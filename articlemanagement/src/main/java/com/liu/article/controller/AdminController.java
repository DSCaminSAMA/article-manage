package com.liu.article.controller;

import com.alibaba.fastjson.JSONObject;
import com.liu.article.pojo.Admin;
import com.liu.article.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping(value = "/admin")
public class AdminController {

    @Autowired
    private AdminService adminService;

    /**
     * 跳转到首页
     * @return
     */
    @RequestMapping(value = "/index")
    public String index(){
        return "index";
    }

    /**
     * 登陆功能
     * @param a_name
     * @param a_password
     * @param model
     * @param session
     * @return
     */
    @RequestMapping(value = "/login")
    public String login(@RequestParam String a_name,
                        @RequestParam String a_password, Model model, HttpSession session){
        Admin admin = adminService.login(a_name);
        //判断是否为空
        if (admin != null){
            //判断是否密码正确
            if (admin.getA_password().equals(a_password)){
                session.setAttribute("name",admin.getA_name());
                return "view/page";
            }else{
                model.addAttribute("message","用户名或密码错误");
                return "view/login/info";
            }
        }else {
            model.addAttribute("message","登陆失败");
            return "view/login/info";
        }
    }

    /**
     * 注册功能
     * @param admin
     * @param session
     * @return
     */
    @RequestMapping(value = "/register")
    public String register(Admin admin,HttpSession session){
        adminService.insert(admin);
        session.setAttribute("name",admin.getA_name());
        return "view/page";
    }

    /**
     * 退出登陆功能
     */
    @RequestMapping(value = "/outLogin")
    public String outLogin(HttpSession session){
        session.invalidate();
        return "index";
    }

    /**
     * 跳转到page界面
     */
    @RequestMapping(value = "/page")
    public String page(){
        return "view/page";
    }

    /**
     * 根据用户名查询
     */
    @ResponseBody
    @RequestMapping(value = "/findByName")
    public String findByName(@RequestBody Admin admin){
        Admin info = adminService.findByName(admin.getA_name());
        return JSONObject.toJSONString(info);
    }

}
