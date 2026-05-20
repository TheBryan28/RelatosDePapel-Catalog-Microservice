package com.relatosdepapel.catalog.controller.model;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonPropertyOrder;
import com.relatosdepapel.catalog.repository.model.SupplyFormat;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.List;

@JsonInclude(JsonInclude.Include.NON_NULL)
@JsonPropertyOrder({
        "title",
        "isbn",
        "description",
        "author",
        "format",
        "price",
        "discountPct",
        "stock",
        "fileUrl",
        "isActive",
        "specificationDtos",
        "images"
})
@Getter
@Setter
@Builder
public class WriteSupplyRequestDto implements Serializable {

    private static final long serialVersionUID = 1L;

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

    @JsonProperty("stock")
    public Integer stock;

    @JsonProperty("fileUrl")
    public String fileUrl;

    @JsonProperty("isActive")
    public Boolean isActive;

    @JsonProperty("specificationDtos")
    public List<SpecificationDto> specificationDtos;

    @JsonProperty("images")
    public List<String> images;
}