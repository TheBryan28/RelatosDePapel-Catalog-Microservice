package com.relatosdepapel.catalog.repository;

import com.relatosdepapel.catalog.repository.model.Review;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface ReviewJpaRepository extends JpaRepository<Review, Long> {

    List<Review> findBySupplyId(Integer supplyId);

    Optional<Review> findBySupplyIdAndUserId(Integer supplyId, Long userId);
}
