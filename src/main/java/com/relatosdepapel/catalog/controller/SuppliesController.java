package com.relatosdepapel.catalog.controller;

import com.relatosdepapel.catalog.controller.model.*;
import com.relatosdepapel.catalog.repository.model.SupplyFormat;
import com.relatosdepapel.catalog.service.*;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.math.BigInteger;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/api/v1/")
@RequiredArgsConstructor
@CrossOrigin(origins = "*", maxAge = 3600)
public class SuppliesController {

    private final GetSuppliesService getSuppliesService;
    private final GetSuppliesWithPredicateAndPaginationService getSuppliesWithPaginationService;
    private final ModifySuppliesService modifySuppliesService;
    private final DeleteSuppliesService deleteSuppliesService;
    private final CreateSuppliesService createSuppliesService;

    @GetMapping("supplies")
    public ResponseEntity<GetSuppliesResponseDto> getSupplies(
            @RequestParam(required = false) String title,
            @RequestParam(required = false) String description,
            @RequestParam(required = false) String author,
            @RequestParam(required = false) Double price,
            @RequestParam(required = false) Integer stock,
            @RequestParam(required = false) SupplyFormat format,
            @RequestParam(required = false, defaultValue = "true") Boolean active,
            @RequestParam(required = false, defaultValue = "5") Integer pageSize,
            @RequestParam(required = false, defaultValue = "0") Integer page
    ) {
        return ResponseEntity.ok(getSuppliesWithPaginationService.getSupplies(title, description, author, price, stock, active, format, pageSize, page));
    }

    @GetMapping("supplies/{supplyId}")
    public ResponseEntity<GetSupplyResponseDto> getSuppl(@PathVariable Long supplyId) {
        return ResponseEntity.ok(getSuppliesService.getSupply(supplyId.intValue()));
    }

    @PostMapping("supplies")
    public ResponseEntity<GetSupplyResponseDto> createSupply(@RequestBody WriteSupplyRequestDto request) {
        return ResponseEntity.ok(createSuppliesService.createSupply(request));
    }

    @PutMapping("supplies/{supplyId}")
    public ResponseEntity<GetSupplyResponseDto> updateSupply(
            @PathVariable Long supplyId,
            @RequestBody WriteSupplyRequestDto request) {
        return ResponseEntity.ok(modifySuppliesService.modifySupply(supplyId.intValue(), request));
    }

    @PatchMapping("supplies/{supplyId}")
    public ResponseEntity<GetSupplyResponseDto> updateSupply(
            @PathVariable Long supplyId,
            @RequestBody String jsonPart) {
        return ResponseEntity.ok(modifySuppliesService.modifySupply(supplyId.intValue(), jsonPart));
    }

    @DeleteMapping("supplies/{supplyId}")
    public ResponseEntity<Void> deleteSupply(@PathVariable Long supplyId) {
        deleteSuppliesService.deleteSupply(supplyId.intValue());
        return ResponseEntity.noContent().build();
    }

    // se reserva el POST supplies/batch endpoint para creación en batch de supplies

    // endpoint para obtener cientos de supplies en batch
    @PostMapping("supplies/get-in-batch")
    public ResponseEntity<Map<BigInteger, SupplyBatchDto>> getSuppliesInBatch(@RequestBody GetInBatchDto request) {
        return ResponseEntity.ok(getSuppliesService.getSuppliesInBatch(request.getSuppliesIds()));
    }

}
