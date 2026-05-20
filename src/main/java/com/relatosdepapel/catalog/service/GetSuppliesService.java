package com.relatosdepapel.catalog.service;

import com.relatosdepapel.catalog.controller.model.GetSuppliesResponseDto;
import com.relatosdepapel.catalog.controller.model.GetSupplyResponseDto;
import com.relatosdepapel.catalog.exception.SupplyNotFoundException;
import com.relatosdepapel.catalog.repository.SupplyJpaRepository;
import com.relatosdepapel.catalog.repository.model.Supply;
import com.relatosdepapel.catalog.utils.SupplyMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;

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
                        .price(s.getPrice())
                        .stock(s.getStock())
                        .specifications(s.getSpecificationsAsList())
                        .images(s.getImageUrls())
                        .build()
        ).orElseThrow(
                () -> new SupplyNotFoundException("Supply not found with id: " + supplyId));
    }
}
