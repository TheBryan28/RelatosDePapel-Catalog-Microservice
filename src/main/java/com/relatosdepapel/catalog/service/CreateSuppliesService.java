package com.relatosdepapel.catalog.service;

import com.relatosdepapel.catalog.controller.model.WriteSupplyRequestDto;
import com.relatosdepapel.catalog.controller.model.GetSupplyResponseDto;
import com.relatosdepapel.catalog.repository.SupplyJpaRepository;
import com.relatosdepapel.catalog.repository.model.Supply;
import com.relatosdepapel.catalog.repository.model.SupplySpecification;
import com.relatosdepapel.catalog.repository.model.SupplyImage;
import com.relatosdepapel.catalog.utils.SupplyMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

@RequiredArgsConstructor
@Service
public class CreateSuppliesService {

    private final SupplyJpaRepository supplyJpaRepository;
    private final SupplyMapper supplyMapper;

    @Transactional
    public GetSupplyResponseDto createSupply(WriteSupplyRequestDto request) {
        // Crear la entidad Supply principal
        Supply supply = Supply.builder()
                .title(request.getTitle())
                .isbn(request.getIsbn())
                .description(request.getDescription())
                .author(request.getAuthor())
                .format(request.getFormat())
                .price(request.getPrice())
                .discountPct(request.getDiscountPct() != null ? request.getDiscountPct() : BigDecimal.ZERO)
                .stock(request.getStock() != null ? request.getStock() : 0)
                .fileUrl(request.getFileUrl())
                .averageRating(BigDecimal.ZERO)
                .reviewCount(0)
                .isActive(request.getIsActive() != null ? request.getIsActive() : true)
                .build();

        // Crear especificaciones si existen
        if (request.getSpecificationDtos() != null && !request.getSpecificationDtos().isEmpty()) {
            List<SupplySpecification> specifications = new ArrayList<>();
            request.getSpecificationDtos().forEach((specification) -> {
                SupplySpecification spec = SupplySpecification.builder()
                        .supply(supply)
                        .specKey(specification.getSpecKey())
                        .specValue(specification.getSpecValue())
                        .build();
                specifications.add(spec);
            });
            supply.setSpecifications(specifications);
        }

        // Crear imágenes si existen
        if (request.getImages() != null && !request.getImages().isEmpty()) {
            List<SupplyImage> images = new ArrayList<>();
            request.getImages().forEach(imageUrl -> {
                SupplyImage image = SupplyImage.builder()
                        .supply(supply)
                        .imageUrl(imageUrl)
                        .build();
                images.add(image);
            });
            supply.setImages(images);
        }

        // Guardar la entidad (cascade guardará automáticamente las especificaciones e imágenes)
        Supply savedSupply = supplyJpaRepository.save(supply);
        return supplyMapper.asGetSupplyResponseDto(savedSupply);
    }
}
