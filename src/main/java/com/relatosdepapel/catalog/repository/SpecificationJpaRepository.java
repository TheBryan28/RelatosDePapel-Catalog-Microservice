package com.relatosdepapel.catalog.repository;

import com.relatosdepapel.catalog.repository.model.SupplySpecification;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface SpecificationJpaRepository extends JpaRepository<SupplySpecification, Integer> {

    List<SupplySpecification> findBySupplyId(Integer supplyId);

    @Modifying
    @Query(nativeQuery = true, value = "DELETE FROM specs WHERE supply_id = ?1")
    void deleteBySupplyId(Integer supplyId);

}
