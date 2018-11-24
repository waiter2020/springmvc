package com.upc.controller;

import com.upc.model.Comment;
import com.upc.model.Count;
import com.upc.model.Doc;

import com.upc.service.CommentService;
import com.upc.service.CountService;
import com.upc.service.DocService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * Created by  waiter on 18-11-18  上午9:24.
 *
 * @author waiter
 */
@Controller
@RequestMapping("/doc")
public class DocController {
    private final DocService docService;
    private final CommentService commentService;
    private final CountService countService;


    public DocController(DocService docService, CommentService commentService, CountService countService) {
        this.docService = docService;
        this.commentService = commentService;
        this.countService = countService;
    }

    @PreAuthorize("hasRole('普通用户')")
    @PostMapping(value = "/add")
    public String add(Doc doc){

        Doc save = docService.save(doc);
        return "admin/edit/edit";
    }

    @GetMapping(value = "/{id}")
    public String getDoc(@PathVariable("id") Doc doc, Model model){
        Count watch = doc.getWatch();
        watch.setCount(watch.getCount()+1);
        countService.save(watch);
        List<Comment> comments = commentService.findAllByDoc(doc.getId());
        model.addAttribute("doc",doc);
        model.addAttribute("comments",comments);
        return "detail";
    }



}
