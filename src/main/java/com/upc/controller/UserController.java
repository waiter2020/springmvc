package com.upc.controller;

import com.upc.model.User;
import com.upc.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

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

    @GetMapping("/info")
    public String info(HttpServletRequest request,Model model){
        User byUserName = userService.findByUserName(request.getRemoteUser());
        model.addAttribute("info",byUserName);
        return "admin/user/change";
    }



    @ResponseBody
    @PostMapping("/add")
    public Object add(User user){
        user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
        user.setEnable(true);
        return userService.save(user);
    }

    @PreAuthorize("hasRole('管理员')")
    @GetMapping("/list/{page}/{size}/info")
    public String getList(@PathVariable(required = false) Integer page,
                          @PathVariable(required = false) Integer size,
                          Model model){

        model.addAttribute("list",userService.findAll(size==null?10:size,page==null?1:page));
        return "admin/user/list";
    }

}