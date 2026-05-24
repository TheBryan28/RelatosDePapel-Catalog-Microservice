package com.relatosdepapel.catalog.controller.model;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonPropertyOrder;
import lombok.*;

import java.io.Serializable;

@JsonInclude(JsonInclude.Include.NON_NULL)
@JsonPropertyOrder({
        "id",
        "supply_id",
        "specKey",
        "specValue"
})
@Builder
@Getter
@Setter
@AllArgsConstructor(access = AccessLevel.PRIVATE)
@NoArgsConstructor(access = AccessLevel.PRIVATE)
public class SpecificationDto implements Serializable {

    private final static long serialVersionUID = 1901178943784643027L;

    @JsonProperty("id")
    private Integer id;

    @JsonProperty("supply_id")
    private Integer supplyId;

    @JsonProperty("specKey")
    private String specKey;

    @JsonProperty("specValue")
    private String specValue;
}
