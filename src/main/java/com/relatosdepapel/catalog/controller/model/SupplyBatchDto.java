package com.relatosdepapel.catalog.controller.model;

import java.math.BigDecimal;

public interface SupplyBatchDto {
    Long getId();
    String getTitle();
    BigDecimal getPrice(); // O Double/Float según tu mapeo
    Integer getDiscountPct();
    Integer getStock();
    Double getAverageRating();
    Integer getReviewCount();
}
