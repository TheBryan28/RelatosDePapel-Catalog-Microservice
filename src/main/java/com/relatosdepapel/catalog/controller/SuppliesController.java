package com.relatosdepapel.catalog.controller;

import com.relatosdepapel.catalog.controller.model.WriteSupplyRequestDto;
import com.relatosdepapel.catalog.controller.model.GetSuppliesResponseDto;
import com.relatosdepapel.catalog.controller.model.GetSupplyResponseDto;
import com.relatosdepapel.catalog.service.CreateSuppliesService;
import com.relatosdepapel.catalog.service.DeleteSuppliesService;
import com.relatosdepapel.catalog.service.GetSuppliesService;
import com.relatosdepapel.catalog.service.ModifySuppliesService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/v1/")
@RequiredArgsConstructor
@CrossOrigin(origins = "*", maxAge = 3600)
public class SuppliesController {

    private final GetSuppliesService getSuppliesService;
    private final ModifySuppliesService modifySuppliesService;
    private final DeleteSuppliesService deleteSuppliesService;
    private final CreateSuppliesService createSuppliesService;

    @GetMapping("supplies")
    public ResponseEntity<GetSuppliesResponseDto> getSupplies() {
        return ResponseEntity.ok(getSuppliesService.getSupplies());
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

}
