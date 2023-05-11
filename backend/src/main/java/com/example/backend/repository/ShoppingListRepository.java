package com.example.backend.repository;

import com.example.backend.model.ShoppingList;
import org.springframework.data.mongodb.repository.MongoRepository;

public interface ShoppingListRepository extends MongoRepository<ShoppingList, String> {
    ShoppingList getShoppingListById(String id);
}
