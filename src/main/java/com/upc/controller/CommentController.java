package com.upc.controller;

import com.upc.model.Comment;
import com.upc.model.Count;
import com.upc.model.Doc;
import com.upc.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.math.BigInteger;

/**
 * Created by  waiter on 18-11-23  下午4:46.
 *
 * @author waiter
 */
@RestController
@RequestMapping("/comment")
public class CommentController {
    private final CommentService commentService;

    @Autowired
    public CommentController(CommentService commentService) {
        this.commentService = commentService;
    }

    @ResponseBody
    @PreAuthorize("hasRole('普通用户')")
    @PostMapping("/add/{id}")
    public Object comment(@PathVariable("id") BigInteger doc, @RequestBody Comment comment){
        comment.setDoc(doc);
        return commentService.save(comment);
    }

    @GetMapping("/get_count/{id}")
    public Object getCountByDoc(@PathVariable BigInteger id){
        Count count = new Count();
        count.setId(id);
        count.setCount(commentService.countAllByDoc(id));
        return count;
    }

}
