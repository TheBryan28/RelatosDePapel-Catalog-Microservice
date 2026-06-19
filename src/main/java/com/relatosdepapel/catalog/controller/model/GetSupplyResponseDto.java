package com.relatosdepapel.catalog.controller.model;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonPropertyOrder;
import com.relatosdepapel.catalog.repository.model.SupplyFormat;
import lombok.*;

import java.io.Serializable;
import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.List;

@JsonInclude(JsonInclude.Include.NON_NULL)
@JsonPropertyOrder({
        "id",
        "title",
        "isbn",
        "description",
        "author",
        "format",
        "price",
        "discountPct",
        "finalPrice",
        "stock",
        "fileUrl",
        "averageRating",
        "reviewCount",
        "isActive",
        "createdAt",
        "updatedAt",
        "specifications",
        "images",
        "categories"
})
@Getter
@Setter
@Builder
@AllArgsConstructor
@RequiredArgsConstructor
public class GetSupplyResponseDto implements Serializable {

    private static final long serialVersionUID = 1L;

    @JsonProperty("id")
    public Integer id;

    @JsonProperty("title")
    public String title;

    @JsonProperty("isbn")
    public String isbn;

    @JsonProperty("description")
    public String description;

    @JsonProperty("author")
    public String author;

    @JsonProperty("format")
    public SupplyFormat format;

    @JsonProperty("price")
    public BigDecimal price;

    @JsonProperty("discountPct")
    public BigDecimal discountPct;

    @JsonProperty("finalPrice")
    public BigDecimal finalPrice;

    @JsonProperty("stock")
    public Integer stock;

    @JsonProperty("fileUrl")
    public String fileUrl;

    @JsonProperty("averageRating")
    public BigDecimal averageRating;

    @JsonProperty("reviewCount")
    public Integer reviewCount;

    @JsonProperty("isActive")
    public Boolean isActive;

    @JsonProperty("createdAt")
    public LocalDateTime createdAt;

    @JsonProperty("updatedAt")
    public LocalDateTime updatedAt;

    @JsonProperty("specifications")
    public List<SpecificationDto> specifications;

    @JsonProperty("images")
    public List<String> images;

    @JsonProperty("categories")
    public List<String> categories;
}