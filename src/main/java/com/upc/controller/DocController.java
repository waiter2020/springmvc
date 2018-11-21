package com.upc.controller;

import com.upc.model.Comment;
import com.upc.model.Doc;

import com.upc.service.DocService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

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

    @PreAuthorize("hasRole('普通用户')")
    @PostMapping(value = "/add")
    public String add(Doc doc){

        Doc save = docService.save(doc);
        System.out.println(save);
        return "admin/edit/edit";
    }

    @GetMapping(value = "/{id}")
    public String getDoc(@PathVariable("id") Doc doc, Model model){
        doc.setWatch(doc.getWatch()+1);
        model.addAttribute("doc",doc);
        docService.save(doc);
        return "detail";
    }

    @ResponseBody
    @PreAuthorize("hasRole('普通用户')")
    @PostMapping("/comment/{id}")
    public Object comment(@PathVariable("id") Doc doc,@RequestBody Comment comment){
        return docService.addComment(comment,doc);
    }

}
