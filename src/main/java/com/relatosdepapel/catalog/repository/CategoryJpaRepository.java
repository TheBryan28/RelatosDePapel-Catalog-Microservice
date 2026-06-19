package com.relatosdepapel.catalog.repository;

import com.relatosdepapel.catalog.repository.model.Category;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CategoryJpaRepository extends JpaRepository<Category, Integer> {
}
