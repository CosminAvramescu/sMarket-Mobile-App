package com.example.backend.service;

import com.example.backend.model.AdminUser;
import com.example.backend.repository.AdminUserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestBody;

@Service
@RequiredArgsConstructor
public class AdminUserService{
    private final AdminUserRepository adminUserRepository;

    public AdminUser addUser(AdminUser adminUser){
        return adminUserRepository.save(adminUser);
    }
}
