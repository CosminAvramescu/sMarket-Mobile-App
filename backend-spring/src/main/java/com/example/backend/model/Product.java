package com.example.backend.model;

import com.example.backend.repository.CategoryRepository;
import lombok.Data;
import lombok.Generated;
import lombok.RequiredArgsConstructor;
import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.DBRef;
import org.springframework.data.mongodb.core.mapping.Document;

import java.math.BigInteger;

@Document("product")
@Data
@RequiredArgsConstructor
public class Product {
    @Id
    String id;

    String name;

    String price;

    String imageLink;

    String shelfType; // optional

    Integer row;

    Integer section;

    Integer shelve;

    @DBRef(lazy = true)
    Shop shop;

    @DBRef(lazy = true)
    ShoppingList shoppingList;

    @DBRef(lazy = true)
    Category category;
    public Product(String name, String price, String imageLink,
                   String shelfType, Integer row, Integer section, Integer shelve, Category category) {
        this.name = name;
        this.price = price;
        this.imageLink = imageLink;
        this.shelfType = shelfType;
        this.row = row;
        this.section = section;
        this.shelve = shelve;
        this.category=category;
    }

    @Override
    public String toString() {
        return "Product{" +
                "id='" + id + '\'' +
                ", name='" + name + '\'' +
                ", price='" + price + '\'' +
                ", imageLink='" + imageLink + '\'' +
                ", shelfType='" + shelfType + '\'' +
                ", row=" + row +
                ", section=" + section +
                ", shelve=" + shelve +
                '}';
    }
}
