package com.relatosdepapel.catalog.service;

import com.relatosdepapel.catalog.exception.ReviewNotFoundException;
import com.relatosdepapel.catalog.repository.ReviewJpaRepository;
import com.relatosdepapel.catalog.repository.SupplyJpaRepository;
import com.relatosdepapel.catalog.repository.model.Review;
import com.relatosdepapel.catalog.repository.model.Supply;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.List;

@Service
@RequiredArgsConstructor
public class DeleteReviewService {

    private final ReviewJpaRepository reviewRepository;
    private final SupplyJpaRepository supplyRepository;

    @Transactional
    public void deleteReview(Long reviewId) {
        Review review = reviewRepository.findById(reviewId)
                .orElseThrow(() -> new ReviewNotFoundException("Review not found with id: " + reviewId));

        Supply supply = review.getSupply();

        // Eliminar la reseña
        reviewRepository.delete(review);

        // Forzar la recarga del promedio en el libro asociado
        recalculateSupplyRating(supply);
    }

    private void recalculateSupplyRating(Supply supply) {
        List<Review> reviews = reviewRepository.findBySupplyId(supply.getId());
        int count = reviews.size();
        BigDecimal average = BigDecimal.ZERO;

        if (count > 0) {
            BigDecimal sum = reviews.stream()
                    .map(Review::getRating)
                    .reduce(BigDecimal.ZERO, BigDecimal::add);
            average = sum.divide(BigDecimal.valueOf(count), 2, RoundingMode.HALF_UP);
        }

        supply.setReviewCount(count);
        supply.setAverageRating(average);
        supplyRepository.save(supply);
    }
}
