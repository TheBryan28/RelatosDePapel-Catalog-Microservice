package com.relatosdepapel.catalog.repository;

import com.relatosdepapel.catalog.controller.model.SupplyBatchDto;
import com.relatosdepapel.catalog.repository.model.Supply;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.math.BigDecimal;
import java.math.BigInteger;
import java.util.List;

@Repository
public interface SupplyJpaRepository extends
        JpaRepository<Supply, Integer>,
        JpaSpecificationExecutor<Supply>,
        PagingAndSortingRepository<Supply, Integer> {

    // Consulta con JPQL
    @Query("SELECT s FROM Supply s WHERE s.stock > 0")
    List<Supply> findAvailableSupplies();

    // Consulta nativa SQL equivalente a la anterior
    @Query(
            value = "SELECT * FROM supplies WHERE stock > 0",
            nativeQuery = true)
    List<Supply> findAvailableSuppliesNative();

    // Consulta con JPQL
    @Query("SELECT s FROM Supply s " +
            "LEFT JOIN FETCH s.specifications " +
            "LEFT JOIN FETCH s.images")
    List<Supply> findAllWithDetails();

    // Consulta nativa SQL equivalente a la anterior
    @Query(
            value = "SELECT s.* FROM supplies s " +
                    "LEFT JOIN specs ss ON s.id = ss.supply_id " +
                    "LEFT JOIN images si ON s.id = si.supply_id",
            nativeQuery = true)
    List<Supply> findAllWithDetailsNative();

    // Consulta por derivacion de nombre de metodo
    List<Supply> findByAuthorIgnoreCase(String author);

    // Consulta por derivacion de nombre de metodo
    List<Supply> findByTitleContainingIgnoreCase(String title);

    List<SupplyBatchDto> findByIdInAndIsActiveTrue(List<BigInteger> ids);

    @Query("""
    SELECT DISTINCT s FROM Supply s
    LEFT JOIN FETCH s.images
    WHERE (:title IS NULL OR LOWER(s.title) LIKE LOWER(CONCAT('%', :title, '%')))
    AND (:author IS NULL OR LOWER(s.author) LIKE LOWER(CONCAT('%', :author, '%')))
    AND (:minPrice IS NULL OR s.price >= :minPrice)
    AND (:maxPrice IS NULL OR s.price <= :maxPrice)
    AND (:isActive IS NULL OR s.isActive = :isActive)
""")
    List<Supply> findSuppliesWithImages(
            @Param("title") String title,
            @Param("author") String author,
            @Param("minPrice") BigDecimal minPrice,
            @Param("maxPrice") BigDecimal maxPrice,
            @Param("isActive") Boolean isActive
    );

    @Query("""
        SELECT DISTINCT s FROM Supply s
        LEFT JOIN FETCH s.images
        WHERE s.id IN :ids
    """)
    List<Supply> findWithImagesByIds(@Param("ids") List<Integer> ids);

    @Query("""
        SELECT DISTINCT s FROM Supply s
        LEFT JOIN FETCH s.categories
        WHERE s.id IN :ids
    """)
    List<Supply> findWithCategoriesByIds(@Param("ids") List<Integer> ids);
}
