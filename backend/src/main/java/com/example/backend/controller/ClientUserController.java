package com.example.backend.controller;

import com.example.backend.model.AdminUser;
import com.example.backend.model.ClientUser;
import com.example.backend.service.ClientUserService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RequiredArgsConstructor
@RestController
@RequestMapping("clientUser")
public class ClientUserController {
    private final ClientUserService clientUserService;

    @PostMapping("")
    public ClientUser addUser(@RequestBody ClientUser clientUser){
        return clientUserService.addUser(clientUser);
    }
}
