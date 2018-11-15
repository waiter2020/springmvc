package com.upc.controller;

import com.upc.model.User;
import com.upc.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;

/**
 * (User)表控制层
 *
 * @author makejava
 * @since 2018-11-08 20:44:56
 */
@Controller
@RequestMapping("/user")
public class UserController {
    /**
     * 服务对象
     */
    private final UserService userService;
    private final BCryptPasswordEncoder bCryptPasswordEncoder;

    @Autowired
    public UserController(UserService userService, BCryptPasswordEncoder bCryptPasswordEncoder) {
        this.userService = userService;
        this.bCryptPasswordEncoder = bCryptPasswordEncoder;
    }

    /**
     * 通过主键查询单条数据
     *
     * @param id 主键
     * @return 单条数据
     */
    @ResponseBody
    @GetMapping("selectOne")
    public User selectOne(Integer id) {
        return this.userService.queryById(id);
    }

    @PostMapping(value = "/registeraction")
    public String register(Model model, User user){
        User byUserName = userService.findByUserName(user.getUsername());
        if (byUserName==null){
            user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
            User save = userService.save(user);
            if (save!=null){
                model.addAttribute("msg","注册成功，请登录");
            }
        }else {
            model.addAttribute("regerror","用户名已被占用");
            return "register";
        }
        return "login";
    }

}