package com.example.backend.repository;

import com.example.backend.dto.ProductDTO;
import com.example.backend.model.Product;
import com.example.backend.model.Shop;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.data.mongodb.repository.Query;
import org.springframework.scheduling.annotation.Async;

import java.util.List;

public interface ProductRepository extends MongoRepository<Product, String> {
    Product getProductById(String id);

    Product getProductsByName(String name);

    List<Product> getProductsByNameContaining(String c);
}
