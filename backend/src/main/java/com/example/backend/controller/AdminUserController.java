package com.example.backend.controller;

import com.example.backend.model.AdminUser;
import com.example.backend.repository.AdminUserRepository;
import com.example.backend.service.AdminUserService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

@RequiredArgsConstructor
@RestController
@RequestMapping("adminUser")
public class AdminUserController {
    private final AdminUserService adminUserService;

    @PostMapping()
    public AdminUser addUser(@RequestBody AdminUser adminUser){
        return adminUserService.addUser(adminUser);
    }
}
