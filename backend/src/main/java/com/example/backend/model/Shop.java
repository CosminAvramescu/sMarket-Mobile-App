package com.example.backend.model;

import lombok.Data;
import lombok.RequiredArgsConstructor;
import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.DBRef;
import org.springframework.data.mongodb.core.mapping.Document;

import java.util.List;

@Document("shop")
@Data
@RequiredArgsConstructor
public class Shop {
    @Id
    String id;

    String name;

    String city;

    String imageLink;

    @DBRef(lazy = true)
    List<Product> productList;


    public Shop(String name, String city, String imageLink, List<Product> productList) {
        this.name = name;
        this.city = city;
        this.imageLink = imageLink;
        this.productList = productList;
    }
}
