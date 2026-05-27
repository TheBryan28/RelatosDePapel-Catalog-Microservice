package com.relatosdepapel.catalog.repository.model;

import com.relatosdepapel.catalog.controller.model.SpecificationDto;
import jakarta.persistence.*;
import lombok.*;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.stream.Collectors;

@Entity
@Table(name = "supplies")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Supply {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Integer id;

    @Column(name = "title", nullable = false, length = 255)
    private String title;

    @Column(name = "isbn", nullable = false, length = 13, unique = true)
    private String isbn;

    @Column(name = "description", columnDefinition = "TEXT")
    private String description;

    @Column(name = "author", nullable = false, length = 100)
    private String author;

    @Enumerated(EnumType.STRING)
    @Column(name = "format", nullable = false)
    private SupplyFormat format;

    @Column(name = "price", nullable = false, precision = 10, scale = 2)
    private BigDecimal price;

    @Column(name = "discount_pct", nullable = false, precision = 5, scale = 2)
    private BigDecimal discountPct = BigDecimal.ZERO;

    @Column(name = "stock", nullable = false)
    private Integer stock = 0;

    @Column(name = "file_url", length = 500)
    private String fileUrl;

    @Column(name = "average_rating", nullable = false, precision = 3, scale = 2)
    private BigDecimal averageRating = BigDecimal.ZERO;

    @Column(name = "review_count", nullable = false)
    private Integer reviewCount = 0;

    @Column(name = "is_active", nullable = false)
    private Boolean isActive = true;

    @Column(name = "created_at", insertable = false, updatable = false)
    private LocalDateTime createdAt;

    @Column(name = "updated_at", insertable = false, updatable = false)
    private LocalDateTime updatedAt;

    @OneToMany(mappedBy = "supply", cascade = CascadeType.ALL, fetch = FetchType.LAZY, orphanRemoval = true)
    private List<SupplySpecification> specifications = new ArrayList<>();

    @OneToMany(mappedBy = "supply", cascade = CascadeType.ALL, fetch = FetchType.LAZY, orphanRemoval = true)
    private List<SupplyImage> images = new ArrayList<>();

    @OneToMany(mappedBy = "supply", cascade = CascadeType.ALL, fetch = FetchType.LAZY, orphanRemoval = true)
    private List<Review> reviews = new ArrayList<>();

    public List<SpecificationDto> getSpecificationsAsList() {
        if (specifications == null) {
            return Collections.emptyList();
        }
        return specifications.stream()
                .map(spec -> SpecificationDto.builder()
                        .specKey(spec.getSpecKey())
                        .specValue(spec.getSpecValue())
                        .build())
                .toList();
    }

    public List<String> getImageUrls() {
        if (images == null) {
            return new ArrayList<>();
        }
        return images.stream()
                .map(SupplyImage::getImageUrl)
                .collect(Collectors.toList());
    }
}