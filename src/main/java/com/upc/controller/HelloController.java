package com.upc.controller;

import com.upc.model.Doc;
import com.upc.service.DocService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

/**
 * Created by  waiter on 18-11-8  下午7:42.
 *
 * @author waiter
 */
@Controller
public class HelloController {

    @Autowired
    private DocService docService;

    @RequestMapping(value = {"/","/index"})
    public String hello(Model model){
        List<Doc> top10 = docService.getNewTop10();
        model.addAttribute("docs",top10);
        model.addAttribute("hot",docService.getWacthTop8());
        return "index";
    }


}
