package com.relatosdepapel.catalog.service;

import com.relatosdepapel.catalog.controller.model.ReviewDto;
import com.relatosdepapel.catalog.exception.SupplyNotFoundException;
import com.relatosdepapel.catalog.repository.ReviewJpaRepository;
import com.relatosdepapel.catalog.repository.SupplyJpaRepository;
import com.relatosdepapel.catalog.repository.model.Review;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@RequiredArgsConstructor
public class GetReviewsService {

    private final ReviewJpaRepository reviewRepository;
    private final SupplyJpaRepository supplyRepository;

    @Transactional(readOnly = true)
    public List<ReviewDto> getReviewsForSupply(Integer supplyId) {
        if (!supplyRepository.existsById(supplyId)) {
            throw new SupplyNotFoundException("Supply not found with id: " + supplyId);
        }

        List<Review> reviews = reviewRepository.findBySupplyId(supplyId);
        return reviews.stream()
                .map(this::mapToDto)
                .toList();
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
