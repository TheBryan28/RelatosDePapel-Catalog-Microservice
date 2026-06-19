package com.relatosdepapel.catalog.service;

import com.relatosdepapel.catalog.controller.model.GetSuppliesResponseDto;
import com.relatosdepapel.catalog.controller.model.GetSupplyResponseDto;
import com.relatosdepapel.catalog.controller.model.SupplyBatchDto;
import com.relatosdepapel.catalog.exception.SupplyNotFoundException;
import com.relatosdepapel.catalog.repository.SupplyJpaRepository;
import com.relatosdepapel.catalog.repository.model.Supply;
import com.relatosdepapel.catalog.utils.SupplyMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.math.BigInteger;
import java.util.*;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class GetSuppliesService {

    private final SupplyJpaRepository repository;
    private final SupplyMapper mapper;

    @Transactional(readOnly = true)
    public GetSuppliesResponseDto getSupplies() {
        List<Supply> supplies = repository.findAvailableSupplies();
        return GetSuppliesResponseDto.builder()
                .supplies(mapper.asSupplyDtoList(supplies))
                .build();
    }

    @Transactional(readOnly = true)
    public GetSupplyResponseDto getSupply(Integer supplyId) {
        Optional<Supply> supply = repository.findById(supplyId);
        return supply.map(
                s -> GetSupplyResponseDto.builder()
                        .id(s.getId())
                        .title(s.getTitle())
                        .description(s.getDescription())
                        .author(s.getAuthor())
                        .format(s.getFormat())
                        .isbn(s.getIsbn())
                        .averageRating(s.getAverageRating())
                        .reviewCount(s.getReviewCount())
                        .discountPct(s.getDiscountPct())
                        .price(s.getPrice())
                        .finalPrice(s.getPrice().subtract(s.getPrice().multiply(s.getDiscountPct().divide(BigDecimal.valueOf(100)))))
                        .stock(s.getStock())
                        .specifications(s.getSpecificationsAsList())
                        .images(s.getImageUrls())
                        .categories(s.getCategoriesNames())
                        .build()
        ).orElseThrow(
                () -> new SupplyNotFoundException("Supply not found with id: " + supplyId));
    }

    @Transactional(readOnly = true)
    public Map<BigInteger, SupplyBatchDto> getSuppliesInBatch(List<BigInteger> suppliesIds) {
        if (suppliesIds == null || suppliesIds.isEmpty()) {
            return new HashMap<>();
        }
        if (suppliesIds.size() > 2500) {
            throw new IllegalArgumentException("Batch size must not exceed 2500.");
        }
        Map<BigInteger, SupplyBatchDto> allResults = new HashMap<>();
        int maxBatch = 500;
        int totalIds = suppliesIds.size();

        for (int i = 0; i < totalIds; i += maxBatch) {
            int fin = Math.min(i + maxBatch, totalIds);
            List<BigInteger> loteActual = suppliesIds.subList(i, fin);
            List<SupplyBatchDto> result = repository.findByIdInAndIsActiveTrue(loteActual);
            Map<BigInteger, SupplyBatchDto> batch = result.stream()
                    .collect(Collectors.toMap(
                            s -> BigInteger.valueOf(s.getId()),
                            s -> s,
                            (oldData, newData) -> oldData
                    ));
            allResults.putAll(batch);
        }

        return allResults;

    }
}
