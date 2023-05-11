package com.example.backend.repository;

import com.example.backend.model.Shop;
import org.springframework.data.mongodb.repository.MongoRepository;

public interface ShopRepository extends MongoRepository<Shop, String> {
    public Shop getShopById(String id);
}
