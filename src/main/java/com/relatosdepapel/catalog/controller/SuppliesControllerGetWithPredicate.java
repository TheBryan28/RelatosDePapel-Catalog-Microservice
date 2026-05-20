package com.relatosdepapel.catalog.controller;

import com.relatosdepapel.catalog.controller.model.GetSuppliesResponseDto;
import com.relatosdepapel.catalog.service.*;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/v2/")
@RequiredArgsConstructor
@CrossOrigin(origins = "*", maxAge = 3600)
public class SuppliesControllerGetWithPredicate {

    private final GetSuppliesWithPredicateService getSuppliesService;

    @GetMapping("supplies")
    public ResponseEntity<GetSuppliesResponseDto> getSupplies(
            @RequestParam(required = false) String title,
            @RequestParam(required = false) String description,
            @RequestParam(required = false) String author,
            @RequestParam(required = false) Double price,
            @RequestParam(required = false) Integer stock
    ) {
        return ResponseEntity.ok(getSuppliesService.getSupplies(title, description, author, price, stock));
    }
}
