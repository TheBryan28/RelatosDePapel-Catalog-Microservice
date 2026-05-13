package com.relatosdepapel.catalog.service;

import com.relatosdepapel.catalog.exception.SupplyNotFoundException;
import com.relatosdepapel.catalog.repository.SupplyJpaRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@RequiredArgsConstructor
@Service
public class DeleteSuppliesService {

    private final SupplyJpaRepository supplyJpaRepository;

    @Transactional
    public void deleteSupply(int supplyId) {
        if (!supplyJpaRepository.existsById(supplyId)) {
            throw new SupplyNotFoundException("Supply with ID " + supplyId + " does not exist.");
        }
        supplyJpaRepository.deleteById(supplyId);
    }
}
