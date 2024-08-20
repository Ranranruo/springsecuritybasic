package com.easybytes.easybankbackend.controller;

import com.easybytes.easybankbackend.model.Accounts;
import com.easybytes.easybankbackend.repository.AccountsRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RequiredArgsConstructor
@RestController
public class AccountController {
    final private AccountsRepository accountsRepository;

    @GetMapping("/myAccount")
    public Accounts getAccountDetails(@RequestParam int id){
        Accounts accounts = accountsRepository.findByCustomerId(id);
        if(accounts != null)
            return accounts;
        else
            return null;
    }
}
