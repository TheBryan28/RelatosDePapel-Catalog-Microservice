package com.relatosdepapel.catalog.repository.model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.*;

import jakarta.persistence.*;

@Entity
@Table(name = "specs")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class SupplySpecification {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @EqualsAndHashCode.Include
    @ToString.Include
    @Column(name = "id")
    private Integer id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "supply_id", nullable = false)
    @JsonIgnore
    @ToString.Exclude
    private Supply supply;

    @Column(name = "spec_key", nullable = false, length = 100)
    private String specKey;

    @Column(name = "spec_value", length = 255)
    private String specValue;
}
