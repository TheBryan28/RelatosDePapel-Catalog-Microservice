package com.relatosdepapel.catalog.controller.model;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.io.Serializable;
import java.math.BigDecimal;

@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class CreateReviewRequestDto implements Serializable {

    private static final long serialVersionUID = 1L;

    @JsonProperty("rating")
    private BigDecimal rating;

    @JsonProperty("comment")
    private String comment;

    @JsonProperty("userId")
    private Long userId;
}
