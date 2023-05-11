package com.example.backend.service;

import com.example.backend.dto.ProductDTO;
import com.example.backend.model.Product;
import com.example.backend.repository.ProductRepository;
import com.example.backend.repository.ShopRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.SimpleMongoClientDatabaseFactory;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.PathVariable;

import java.util.List;

@Service
@RequiredArgsConstructor
public class ProductService {
    private final ProductRepository productRepository;
    private final ShopRepository shopRepository;

    public Product addProduct(Product product){
        return productRepository.save(product);
    }

    public Product getProductById(String id){
        return productRepository.getProductById(id);
    }
    public void setShop(Product product, String shopId){
        product.setShop(shopRepository.getShopById(shopId));
        productRepository.save(product);
    }

    public List<Product> getAllProducts(){
        return productRepository.findAll();
    }
}

