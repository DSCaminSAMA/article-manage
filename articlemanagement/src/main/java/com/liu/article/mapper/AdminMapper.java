package com.liu.article.mapper;

import com.liu.article.pojo.Admin;

public interface AdminMapper {

    Admin login(String a_name);

    void insert(Admin admin);

    Admin findByName(String a_name);

}
