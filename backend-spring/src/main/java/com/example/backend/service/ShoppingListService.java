package com.example.backend.service;

import ch.qos.logback.core.net.server.Client;
import com.example.backend.model.ClientUser;
import com.example.backend.model.ShoppingList;
import com.example.backend.repository.ClientUserRepository;
import com.example.backend.repository.ProductRepository;
import com.example.backend.repository.ShoppingListRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
@RequiredArgsConstructor
public class ShoppingListService {
    private final ShoppingListRepository shoppingListRepository;
    private final ClientUserRepository clientUserRepository;

    private final ProductRepository productRepository;

    public ShoppingList addShoppingList(ShoppingList shoppingList){
        return shoppingListRepository.save(shoppingList);
    }

    public ShoppingList setClient(String shoppingListId, String clientUserId){
        ShoppingList shoppingList=shoppingListRepository.getShoppingListById(shoppingListId);
        return shoppingListRepository.save(shoppingList);
    }

    public ShoppingList setProduct(String shoppingListId, String productId){
        ShoppingList shoppingList=shoppingListRepository.getShoppingListById(shoppingListId);
        if(shoppingList.getProductList()==null){
            shoppingList.setProductList(new ArrayList<>());
        }
        shoppingList.getProductList().add(productRepository.getProductById(productId));
        return shoppingListRepository.save(shoppingList);
    }

    public List<ShoppingList> getShoppingList(){
        return shoppingListRepository.findAll();
    }
}
