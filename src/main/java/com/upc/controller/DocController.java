package com.upc.controller;

import com.upc.model.Doc;

import com.upc.service.DocService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.Map;

/**
 * Created by  waiter on 18-11-18  上午9:24.
 *
 * @author waiter
 */
@Controller
@RequestMapping("/doc")
public class DocController {
    private final DocService docService;

    @Autowired
    public DocController(DocService docService) {
        this.docService = docService;
    }

    @PostMapping(value = "/add")
    public String add(Doc doc){

        Doc save = docService.save(doc);
        System.out.println(save);
        return "admin/edit/edit";
    }

    @GetMapping(value = "/{id}")
    public String getDoc(@PathVariable("id") Doc doc, Model model){
        model.addAttribute("doc",doc);
        return "detail";
    }

}
