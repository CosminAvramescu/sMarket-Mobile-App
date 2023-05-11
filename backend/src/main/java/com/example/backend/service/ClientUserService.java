package com.example.backend.service;

import com.example.backend.model.ClientUser;
import com.example.backend.model.ShoppingList;
import com.example.backend.repository.ClientUserRepository;
import com.example.backend.repository.ShoppingListRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestBody;

import java.util.ArrayList;

@Service
@RequiredArgsConstructor
public class ClientUserService {
    private final ClientUserRepository clientUserRepository;
    private final ShoppingListRepository shoppingListRepository;
    public ClientUser addUser(ClientUser clientUser){
        return clientUserRepository.save(clientUser);
    }

    public ClientUser setShoppingList(String clientId, String shoppingListId){
        ClientUser clientUser=clientUserRepository.getUserById(clientId);
        if(clientUser.getShoppingLists()==null){
            clientUser.setShoppingLists(new ArrayList<>());
        }
        clientUser.getShoppingLists().add(shoppingListRepository.getShoppingListById(shoppingListId));
        return clientUserRepository.save(clientUser);
    }
}
