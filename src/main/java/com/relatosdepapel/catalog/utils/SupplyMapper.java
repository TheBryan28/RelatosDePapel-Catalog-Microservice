package com.relatosdepapel.catalog.utils;

import com.relatosdepapel.catalog.controller.model.*;
import com.relatosdepapel.catalog.exception.SupplyNotFoundException;
import com.relatosdepapel.catalog.repository.ImageJpaRepository;
import com.relatosdepapel.catalog.repository.SpecificationJpaRepository;
import com.relatosdepapel.catalog.repository.SupplyJpaRepository;
import com.relatosdepapel.catalog.repository.model.Supply;
import com.relatosdepapel.catalog.repository.model.SupplyImage;
import com.relatosdepapel.catalog.repository.model.SupplySpecification;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

@Component
@RequiredArgsConstructor
public class SupplyMapper {

    private final SupplyJpaRepository supplyJpaRepository;
    private final SpecificationJpaRepository specificationJpaRepository;
    private final ImageJpaRepository imageJpaRepository;

    public List<SupplyDto> asSupplyDtoList(List<Supply> supplies) {
        return supplies.stream()
                .map(supply -> SupplyDto.builder()
                        .id(supply.getId())
                        .title(supply.getTitle())
                        .isbn(supply.getIsbn())
                        .description(supply.getDescription())
                        .price(supply.getPrice())
                        .stock(supply.getStock())
                        .build())
                .toList();
    }

    public GetSupplyResponseDto asGetSupplyResponseDto(Supply supply) {
        return GetSupplyResponseDto.builder()
                .id(supply.getId())
                .title(supply.getTitle())
                .description(supply.getDescription())
                .price(supply.getPrice())
                .discountPct(supply.getDiscountPct())
                .stock(supply.getStock())
                .format(supply.getFormat())
                .isbn(supply.getIsbn())
                .author(supply.getAuthor())
                .averageRating(supply.getAverageRating())
                .reviewCount(supply.getReviewCount())
                .fileUrl(supply.getFileUrl())
                .isActive(supply.getIsActive())
                .specifications(supply.getSpecificationsAsList())
                .images(supply.getImageUrls())
                .build();
    }

    public UpdateSupplyDto asGetSupplyDto(Supply supply) {
        return UpdateSupplyDto.builder()
                .id(supply.getId())
                .title(supply.getTitle())
                .description(supply.getDescription())
                .price(supply.getPrice())
                .discountPct(supply.getDiscountPct())
                .stock(supply.getStock())
                .format(supply.getFormat())
                .isbn(supply.getIsbn())
                .author(supply.getAuthor())
                .averageRating(supply.getAverageRating())
                .reviewCount(supply.getReviewCount())
                .fileUrl(supply.getFileUrl())
                .isActive(supply.getIsActive())
                .specifications(supply.getSpecifications())
                .images(supply.getImages())
                .build();
    }

    public Supply asSupply(Integer supplyId, WriteSupplyRequestDto supplyDto) {
        Supply oldSupply = supplyJpaRepository.findById(supplyId).orElseThrow(
                () -> new SupplyNotFoundException("Supply with ID " + supplyId + " not found.")
        );
        return Supply.builder()
                .title(supplyDto.getTitle())
                .description(supplyDto.getDescription())
                .price(supplyDto.getPrice())
                .discountPct(supplyDto.getDiscountPct())
                .stock(supplyDto.getStock())
                .format(supplyDto.getFormat())
                .isbn(supplyDto.getIsbn())
                .author(supplyDto.getAuthor())
                .averageRating(supplyDto.getAverageRating())
                .reviewCount(supplyDto.getReviewCount())
                .fileUrl(supplyDto.getFileUrl())
                .isActive(supplyDto.getIsActive())
                .specifications(getSpecificationsFromDto(oldSupply, supplyDto.getSpecificationDtos()))
                .images(getImagesFromDto(oldSupply, supplyDto.getImages()))
                .build();
    }

    public Supply asSupply(GetSupplyResponseDto getSupplyResponseDto) {
        Supply oldSupply = supplyJpaRepository.findById(getSupplyResponseDto.getId()).orElseThrow(
                () -> new SupplyNotFoundException("Supply with ID " + getSupplyResponseDto.getId() + " not found.")
        );
        return Supply.builder()
                .id(getSupplyResponseDto.getId())
                .title(getSupplyResponseDto.getTitle())
                .description(getSupplyResponseDto.getDescription())
                .price(getSupplyResponseDto.getPrice() != null ? getSupplyResponseDto.getPrice() : null)
                .discountPct(getSupplyResponseDto.getDiscountPct())
                .stock(getSupplyResponseDto.getStock())
                .format(getSupplyResponseDto.getFormat())
                .isbn(getSupplyResponseDto.getIsbn())
                .author(getSupplyResponseDto.getAuthor())
                .averageRating(getSupplyResponseDto.getAverageRating())
                .reviewCount(getSupplyResponseDto.getReviewCount())
                .fileUrl(getSupplyResponseDto.getFileUrl())
                .isActive(getSupplyResponseDto.getIsActive())
                .specifications(getSpecificationsFromDto(oldSupply, getSupplyResponseDto.getSpecifications()))
                .images(getImagesFromDto(oldSupply, getSupplyResponseDto.getImages()))
                .build();
    }

    public Supply asUpdateSupply(UpdateSupplyDto getSupplyResponseDto) {
        return Supply.builder()
                .id(getSupplyResponseDto.getId())
                .title(getSupplyResponseDto.getTitle())
                .description(getSupplyResponseDto.getDescription())
                .price(getSupplyResponseDto.getPrice() != null ? getSupplyResponseDto.getPrice() : null)
                .discountPct(getSupplyResponseDto.getDiscountPct())
                .stock(getSupplyResponseDto.getStock())
                .format(getSupplyResponseDto.getFormat())
                .isbn(getSupplyResponseDto.getIsbn())
                .author(getSupplyResponseDto.getAuthor())
                .averageRating(getSupplyResponseDto.getAverageRating())
                .reviewCount(getSupplyResponseDto.getReviewCount())
                .fileUrl(getSupplyResponseDto.getFileUrl())
                .isActive(getSupplyResponseDto.getIsActive())
                .specifications(getSupplyResponseDto.getSpecifications())
                .images(getSupplyResponseDto.getImages())
                .build();
    }

    private List<SupplySpecification> getSpecificationsFromDto(Supply oldSupply, List<SpecificationDto> specificationDtos) {
        specificationJpaRepository.deleteBySupplyId(oldSupply.getId());
        return specificationDtos.stream()
                .map(spec -> SupplySpecification.builder()
                        .supply(oldSupply)
                        .specKey(spec.getSpecKey())
                        .specValue(spec.getSpecValue())
                        .build())
                .toList();
    }

    private List<SupplyImage> getImagesFromDto(Supply oldSupply, List<String> images) {
        imageJpaRepository.deleteBySupplyId(oldSupply.getId());
        return images.stream()
                .map(imageUrl -> SupplyImage.builder()
                        .supply(oldSupply)
                        .imageUrl(imageUrl)
                        .build())
                .toList();
    }

    public List<SupplySpecification> mapSpecifications(Map<String, String> specifications) {
        return specifications.entrySet().stream()
                .map(entry -> SupplySpecification.builder()
                        .specKey(entry.getKey())
                        .specValue(entry.getValue())
                        .build())
                .toList();
    }

    public List<SupplyImage> mapImages(List<String> images) {
        return images.stream()
                .map(imageUrl -> SupplyImage.builder()
                        .imageUrl(imageUrl)
                        .build())
                .toList();
    }
}
