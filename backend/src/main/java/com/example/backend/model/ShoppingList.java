package com.example.backend.model;

import lombok.Data;
import lombok.RequiredArgsConstructor;
import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.DBRef;
import org.springframework.data.mongodb.core.mapping.Document;

import java.util.List;

@Document("shoppingList")
@Data
@RequiredArgsConstructor
public class ShoppingList {
    @Id
    String id;

    //String mealRecipe;

    @DBRef
    List<Product> productList;

    public ShoppingList(List<Product> productList) {
        this.productList = productList;
    }
}
