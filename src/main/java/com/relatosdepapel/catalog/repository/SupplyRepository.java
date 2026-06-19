package com.relatosdepapel.catalog.repository;

import com.relatosdepapel.catalog.repository.model.Supply;
import com.relatosdepapel.catalog.repository.model.SupplyFormat;
import com.relatosdepapel.catalog.repository.predicate.SearchCriteria;
import com.relatosdepapel.catalog.repository.predicate.SearchFields;
import com.relatosdepapel.catalog.repository.predicate.SearchOperation;
import com.relatosdepapel.catalog.repository.predicate.SearchStatement;
import jakarta.persistence.EntityManager;
import jakarta.persistence.criteria.CriteriaBuilder;
import jakarta.persistence.criteria.CriteriaQuery;
import jakarta.persistence.criteria.Predicate;
import jakarta.persistence.criteria.Root;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Repository;
import org.springframework.util.StringUtils;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.stream.Collectors;

@Slf4j
@Repository
@RequiredArgsConstructor
public class SupplyRepository {

    private final EntityManager entityManager;
    private final SupplyJpaRepository supplyJpaRepository;

    public List<Supply> getSupplies(String title, String description, String author, Double price, Integer stock) {

        SearchCriteria<Supply> spec = new SearchCriteria<>();

        if (StringUtils.hasText(title)) {
            spec.add(new SearchStatement(SearchFields.TITLE, title, SearchOperation.MATCH));
        }

        if (StringUtils.hasText(description)) {
            spec.add(new SearchStatement(SearchFields.DESCRIPTION, description, SearchOperation.MATCH));
        }

        if (StringUtils.hasText(author)) {
            spec.add(new SearchStatement(SearchFields.AUTHOR, author, SearchOperation.MATCH));
        }

        if (price != null && price > 0) {
            spec.add(new SearchStatement(SearchFields.PRICE, price, SearchOperation.LESS_THAN_EQUAL));
        }

        if (stock != null && stock > 0) {
            spec.add(new SearchStatement(SearchFields.STOCK, stock, SearchOperation.GREATER_THAN_EQUAL));
        }

        return supplyJpaRepository.findAll(spec);
    }

    public List<Supply> getSupplies() {
        return supplyJpaRepository.findAvailableSupplies();
    }

    public List<Supply> getSupplies(Integer size, Integer page) {
        if (page < 0 || size <= 0) {
            throw new IllegalArgumentException("Page number must be non-negative and size must be positive.");
        }
        return supplyJpaRepository.findAll(Pageable.ofSize(size).withPage(page)).getContent();
    }

    public List<Supply> getSupplies(
            String title,
            String description,
            String author,
            Double price,
            Integer stock,
            Boolean active,
            SupplyFormat format,
            String isbn,
            BigDecimal discount,
            BigDecimal averageRating,
            Integer reviewCount,
            LocalDateTime releaseDate,
            Integer pageSize,
            Integer page) {

        SearchCriteria<Supply> spec = getSearchCriteria(
                title,
                description,
                author,
                price,
                stock,
                active,
                format,
                isbn,
                discount,
                averageRating,
                reviewCount,
                releaseDate);

        return getSuppliesWithCustomQuery(spec, pageSize, page);
    }

    private SearchCriteria<Supply> getSearchCriteria(
         String title,
         String description,
         String author,
         Double price,
         Integer stock,
         Boolean active,
         SupplyFormat format,
         String isbn,
         BigDecimal discount,
         BigDecimal averageRating,
         Integer reviewCount,
         LocalDateTime releaseDate
    ) {
        SearchCriteria<Supply> spec = new SearchCriteria<>();
        spec.add(new SearchStatement(SearchFields.ACTIVE, active, SearchOperation.EQUAL));
        if (StringUtils.hasText(title)) {
            spec.add(new SearchStatement(SearchFields.TITLE, title, SearchOperation.MATCH));
        }
        if (StringUtils.hasText(description)) {
            spec.add(new SearchStatement(SearchFields.DESCRIPTION, description, SearchOperation.MATCH));
        }
        if (StringUtils.hasText(author)) {
            spec.add(new SearchStatement(SearchFields.AUTHOR, author, SearchOperation.MATCH));
        }
        if (price != null && price > 0) {
            spec.add(new SearchStatement(SearchFields.PRICE, price, SearchOperation.LESS_THAN_EQUAL));
        }
        if (stock != null && stock > 0) {
            spec.add(new SearchStatement(SearchFields.STOCK, stock, SearchOperation.GREATER_THAN_EQUAL));
        }
        if (format != null) {
            spec.add(new SearchStatement(SearchFields.FORMAT, format, SearchOperation.EQUAL));
        }
        if (isbn != null && !isbn.isEmpty()) {
            spec.add(new SearchStatement(SearchFields.ISBN, isbn, SearchOperation.EQUAL));
        }
        if (discount != null && discount.compareTo(BigDecimal.ZERO) > 0) {
            spec.add(new SearchStatement(SearchFields.DISCOUNT, discount, SearchOperation.GREATER_THAN_EQUAL));
        }
        if (averageRating != null && averageRating.compareTo(BigDecimal.ZERO) > 0) {
            spec.add(new SearchStatement(SearchFields.AVERAGE_RATING, averageRating, SearchOperation.GREATER_THAN_EQUAL));
        }
        if (reviewCount != null && reviewCount > 0) {
            spec.add(new SearchStatement(SearchFields.REVIEW_COUNT, reviewCount, SearchOperation.GREATER_THAN_EQUAL));
        }
        return spec;
    }

    public List<Supply> getSuppliesWithCustomQuery(
            SearchCriteria<Supply> spec,
            Integer pageSize,
            Integer page) {

        Pageable pageable = Pageable.ofSize(pageSize).withPage(page);

        // FASE 1: IDs paginados (1 query ligera)
        List<Integer> ids = findIdsBySpec(spec, pageable);
        if (ids.isEmpty()) return List.of();

        // FASE 2: datos completos (2 queries, sin N+1)
        List<Supply> supplies = supplyJpaRepository.findWithImagesByIds(ids);
        supplyJpaRepository.findWithCategoriesByIds(ids);

        // preserva el orden de paginación
        Map<Integer, Supply> map = supplies.stream()
                .collect(Collectors.toMap(Supply::getId, s -> s));

        return ids.stream()
                .map(map::get)
                .filter(Objects::nonNull)
                .toList();
    }

    public List<Integer> findIdsBySpec(Specification<Supply> spec, Pageable pageable) {
        CriteriaBuilder cb = entityManager.getCriteriaBuilder();
        CriteriaQuery<Integer> query = cb.createQuery(Integer.class);
        Root<Supply> root = query.from(Supply.class);

        // aplica el mismo Specification
        if (spec != null) {
            Predicate predicate = spec.toPredicate(root, query, cb);
            if (predicate != null) {
                query.where(predicate);
            }
        }

        query.select(root.get("id"));
        query.orderBy(cb.desc(root.get("createdAt"))); // tu orden preferido

        return entityManager.createQuery(query)
                .setFirstResult((int) pageable.getOffset())
                .setMaxResults(pageable.getPageSize())
                .getResultList();
    }
}
