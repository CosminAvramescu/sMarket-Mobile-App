package com.example.backend.service;

import com.example.backend.dto.ShopDTO;
import com.example.backend.mapper.ShopMapper;
import com.example.backend.model.Product;
import com.example.backend.model.Shop;
import com.example.backend.repository.ProductRepository;
import com.example.backend.repository.ShopRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.PathVariable;

import java.util.ArrayList;
import java.util.List;

@Service
@RequiredArgsConstructor
public class ShopService {
    private final ShopRepository shopRepository;
    private final ProductRepository productRepository;

    private final ShopMapper shopMapper;

    public ShopDTO getShopById(@PathVariable String id){
        return shopMapper.toShopDTO(shopRepository.getShopById(id));
    }

    public Shop getLinkShopById(@PathVariable String id){
        return shopRepository.getShopById(id);
    }

    public Shop addShop(Shop shop){
        return shopRepository.save(shop);
    }

    public void setProduct(String shopId, String productId){
        Shop shop=shopRepository.getShopById(shopId);
        if(shop.getProductList()==null){
            shop.setProductList(new ArrayList<>());
        }
        shop.getProductList().add(productRepository.getProductById(productId));
        shopRepository.save(shop);
    }
    public List<Shop> getAllShops(){
        return shopRepository.findAll();
    }

}
