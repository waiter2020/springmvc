package com.upc.controller;

import com.upc.service.TypeService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Created by  waiter on 18-11-24  下午3:02.
 *
 * @author waiter
 */
@Controller
@RequestMapping("/type")
public class TypeController {
    private final TypeService typeService;

    public TypeController(TypeService typeService) {
        this.typeService = typeService;
    }

    @ResponseBody
    @RequestMapping("/get_all")
    public Object getAll(){
        return typeService.findAll();
    }

}
