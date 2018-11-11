package com.upc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * Created by  waiter on 18-11-8  下午7:42.
 *
 * @author waiter
 */
@Controller
public class HelloController {

    @RequestMapping(value = {"/","/index"})
    public String hello(){

        return "index";
    }


}
