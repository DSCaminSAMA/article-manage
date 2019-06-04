package com.liu.article.service;

import com.liu.article.pojo.Admin;
import org.springframework.stereotype.Service;

@Service
public interface AdminService {

    Admin login(String a_name);

    void insert(Admin admin);

    Admin findByName(String a_name);

}
