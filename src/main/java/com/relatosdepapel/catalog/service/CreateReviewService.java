package com.relatosdepapel.catalog.service;

import com.relatosdepapel.catalog.controller.model.CreateReviewRequestDto;
import com.relatosdepapel.catalog.controller.model.ReviewDto;
import com.relatosdepapel.catalog.exception.SupplyNotFoundException;
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
public class CreateReviewService {

    private final ReviewJpaRepository reviewRepository;
    private final SupplyJpaRepository supplyRepository;

    @Transactional
    public ReviewDto createReview(Integer supplyId, CreateReviewRequestDto request) {
        Supply supply = supplyRepository.findById(supplyId)
                .orElseThrow(() -> new SupplyNotFoundException("Supply not found with id: " + supplyId));

        // Validar que el usuario no haya opinado ya sobre este libro (clave única en BD)
        reviewRepository.findBySupplyIdAndUserId(supplyId, request.getUserId()).ifPresent(r -> {
            throw new IllegalArgumentException("El usuario ya ha escrito una opinión sobre este libro.");
        });

        // Validar calificación entre 0 y 5
        if (request.getRating() == null || request.getRating().compareTo(BigDecimal.ZERO) < 0 || request.getRating().compareTo(BigDecimal.valueOf(5)) > 0) {
            throw new IllegalArgumentException("La calificación debe estar entre 0 y 5 estrellas.");
        }

        Review review = Review.builder()
                .supply(supply)
                .rating(request.getRating())
                .comment(request.getComment())
                .userId(request.getUserId())
                .build();

        Review savedReview = reviewRepository.save(review);

        // Recalcular promedio y total en el libro
        recalculateSupplyRating(supply);

        return mapToDto(savedReview);
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

    private ReviewDto mapToDto(Review review) {
        return ReviewDto.builder()
                .id(review.getId())
                .bookId(review.getSupply().getId())
                .rating(review.getRating())
                .comment(review.getComment())
                .userId(review.getUserId())
                .createdAt(review.getCreatedAt())
                .updatedAt(review.getUpdatedAt())
                .build();
    }
}
