package com.relatosdepapel.catalog.service;

import com.relatosdepapel.catalog.controller.model.GetSuppliesResponseDto;
import com.relatosdepapel.catalog.repository.SupplyRepository;
import com.relatosdepapel.catalog.repository.model.Supply;
import com.relatosdepapel.catalog.repository.model.SupplyFormat;
import com.relatosdepapel.catalog.utils.SupplyMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.List;

@Service
@RequiredArgsConstructor
public class GetSuppliesWithPredicateAndPaginationService {

    private final SupplyRepository repository;
    private final SupplyMapper mapper;

    @Transactional(readOnly = true)
    public GetSuppliesResponseDto getSupplies(
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
            Integer page
    ) {

        List<Supply> supplies;
        if (StringUtils.hasLength(title) || StringUtils.hasLength(description) || StringUtils.hasLength(author)
                || format != null
                || price != null
                || stock != null
                || isbn != null
                || discount != null
                || averageRating != null
                || reviewCount != null
                || releaseDate != null) {
            supplies = repository.getSupplies(
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
                    releaseDate,
                    pageSize,
                    page);
        } else {
            supplies = repository.getSupplies(pageSize, page);
        }
        return GetSuppliesResponseDto.builder()
                .supplies(mapper.asSupplyDtoList(supplies))
                .build();
    }
}
