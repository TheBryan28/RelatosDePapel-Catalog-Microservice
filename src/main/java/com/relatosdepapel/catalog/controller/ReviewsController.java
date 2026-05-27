package com.relatosdepapel.catalog.controller;

import com.relatosdepapel.catalog.controller.model.CreateReviewRequestDto;
import com.relatosdepapel.catalog.controller.model.ReviewDto;
import com.relatosdepapel.catalog.service.CreateReviewService;
import com.relatosdepapel.catalog.service.DeleteReviewService;
import com.relatosdepapel.catalog.service.GetReviewsService;
import com.relatosdepapel.catalog.service.ModifyReviewService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/v1/")
@RequiredArgsConstructor
@CrossOrigin(origins = "*", maxAge = 3600)
public class ReviewsController {

    private final GetReviewsService getReviewsService;
    private final CreateReviewService createReviewService;
    private final ModifyReviewService modifyReviewService;
    private final DeleteReviewService deleteReviewService;

    @GetMapping("supplies/{supplyId}/reviews")
    public ResponseEntity<List<ReviewDto>> getReviewsForSupply(@PathVariable Integer supplyId) {
        return ResponseEntity.ok(getReviewsService.getReviewsForSupply(supplyId));
    }

    @PostMapping("supplies/{supplyId}/reviews")
    public ResponseEntity<ReviewDto> createReview(
            @PathVariable Integer supplyId,
            @RequestBody CreateReviewRequestDto request) {
        return ResponseEntity.status(HttpStatus.CREATED)
                .body(createReviewService.createReview(supplyId, request));
    }

    @PutMapping("reviews/{reviewId}")
    public ResponseEntity<ReviewDto> updateReview(
            @PathVariable Long reviewId,
            @RequestBody CreateReviewRequestDto request) {
        return ResponseEntity.ok(modifyReviewService.modifyReview(reviewId, request));
    }

    @DeleteMapping("reviews/{reviewId}")
    public ResponseEntity<Void> deleteReview(@PathVariable Long reviewId) {
        deleteReviewService.deleteReview(reviewId);
        return ResponseEntity.noContent().build();
    }
}
