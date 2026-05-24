package com.relatosdepapel.catalog.service;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.github.fge.jsonpatch.JsonPatchException;
import com.github.fge.jsonpatch.mergepatch.JsonMergePatch;
import com.relatosdepapel.catalog.controller.model.GetSupplyResponseDto;
import com.relatosdepapel.catalog.controller.model.UpdateSupplyDto;
import com.relatosdepapel.catalog.controller.model.WriteSupplyRequestDto;
import com.relatosdepapel.catalog.exception.SupplyNotFoundException;
import com.relatosdepapel.catalog.repository.SupplyJpaRepository;
import com.relatosdepapel.catalog.repository.model.Supply;
import com.relatosdepapel.catalog.utils.SupplyMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;

@RequiredArgsConstructor
@Service
@Slf4j
public class ModifySuppliesService {

    private final SupplyJpaRepository supplyJpaRepository;
    private final SupplyMapper supplyMapper;
    private final ObjectMapper objectMapper;

    @Transactional
    public GetSupplyResponseDto modifySupply(Integer supplyId, WriteSupplyRequestDto supplyDto) {
        Supply modifiedSupply = supplyMapper.asSupply(supplyId, supplyDto);
        modifiedSupply.setId(supplyId);
        Supply updatedSupply = supplyJpaRepository.save(modifiedSupply);
        return supplyMapper.asGetSupplyResponseDto(updatedSupply);
    }

    @Transactional
    public GetSupplyResponseDto modifySupply(Integer supplyId, String jsonPart) {
        //PATCH se implementa en este caso mediante Merge Patch: https://datatracker.ietf.org/doc/html/rfc7386
        System.out.println(supplyId+"SupplyId");
        UpdateSupplyDto supply = supplyMapper.asGetSupplyDto(
                        supplyJpaRepository
                                .findById(supplyId)
                                .orElseThrow(() -> new SupplyNotFoundException("Supply with ID " + supplyId + " not found.")));
        try {
            JsonNode patch = objectMapper.readTree(jsonPart);
            JsonNode actualSupply = objectMapper.valueToTree(supply);
            JsonMergePatch mergePatch = JsonMergePatch.fromJson(patch); // ✅ Desde el patch entrante
            // Apply the patch to the actual supply
            JsonNode patchedSupplyNode = mergePatch.apply(actualSupply); // ✅ Aplicando al supply actual
            UpdateSupplyDto patchedSupply = objectMapper.treeToValue(patchedSupplyNode, UpdateSupplyDto.class);
            patchedSupply.setId(supplyId);
            patchedSupply.setUpdatedAt(LocalDateTime.now());
            Supply auxSupply = supplyMapper.asUpdateSupply(patchedSupply);
            // ✅ Reasignar la referencia padre en cada colección
            if (patchedSupply.getSpecifications() != null) {
                patchedSupply.getSpecifications()
                        .forEach(spec -> spec.setSupply(auxSupply));
            }
            if (patchedSupply.getImages() != null) {
                patchedSupply.getImages()
                        .forEach(image -> image.setSupply(auxSupply));
            }
            Supply savedSupply = supplyJpaRepository.save(supplyMapper.asUpdateSupply(patchedSupply));
            return supplyMapper.asGetSupplyResponseDto(savedSupply);
        } catch (JsonProcessingException | JsonPatchException e) {
            log.error("Error processing JSON patch for supply ID {}: {}", supplyId, e.getMessage(), e);
            throw new RuntimeException("Error processing JSON patch", e);
        }
    }
}
