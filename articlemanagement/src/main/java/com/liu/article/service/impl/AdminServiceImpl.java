package com.liu.article.service.impl;

import com.liu.article.mapper.AdminMapper;
import com.liu.article.pojo.Admin;
import com.liu.article.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;

public class AdminServiceImpl implements AdminService {

    @Autowired
    private AdminMapper adminMapper;

    @Override
    public Admin login(String a_name) {
        return adminMapper.login(a_name);
    }

    @Override
    public void insert(Admin admin) {
        adminMapper.insert(admin);
    }

    @Override
    public Admin findByName(String a_name) {
        return adminMapper.findByName(a_name);
    }
}
