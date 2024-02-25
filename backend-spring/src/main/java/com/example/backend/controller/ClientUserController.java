package com.example.backend.controller;

import com.example.backend.model.AdminUser;
import com.example.backend.model.ClientUser;
import com.example.backend.service.ClientUserService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

@RequiredArgsConstructor
@RestController
@RequestMapping("clientUser")
@CrossOrigin(origins="*")
public class ClientUserController {
    private final ClientUserService clientUserService;

    @PostMapping("")
    public ClientUser addUser(@RequestBody ClientUser clientUser){
        return clientUserService.addUser(clientUser);
    }
}
