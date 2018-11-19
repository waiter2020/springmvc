package com.upc.controller;


import com.alibaba.druid.support.json.JSONUtils;
import com.mongodb.DB;
import com.mongodb.MongoClient;
import com.mongodb.gridfs.GridFS;
import com.mongodb.gridfs.GridFSDBFile;
import com.mongodb.gridfs.GridFSInputFile;
import lombok.Data;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.InputStreamResource;
import org.springframework.data.mongodb.MongoDbFactory;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.net.URLEncoder;
import java.util.UUID;

/**
 * Created by  waiter on 18-11-19  下午1:32.
 *
 * @author waiter
 */
@Controller
@RequestMapping("/file")
public class FileController {

    @Autowired
    private MongoDbFactory mongoDbFactory;

    @ResponseBody
    @PostMapping("/upload")
    public Object upload(@RequestParam("editormd-image-file") CommonsMultipartFile file)  {
        Res res = new Res();
        String fileName;
        try {
            String username = ((UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal()).getUsername();
            UUID uuid = UUID.randomUUID();
             fileName = uuid + file.getOriginalFilename();
            saveFile("my_file", file.getInputStream(), username, fileName);
        }catch (Exception e){
            res.setSuccess(0);
            res.setMessage(e.getMessage());
            e.printStackTrace();
            return res;
        }

        res.setSuccess(1);
        res.setMessage("上传成功");
        res.setUrl("/file/get/"+fileName.substring(0,fileName.lastIndexOf(".")));

        return res;
    }

    @ResponseBody
    @GetMapping("/get/{fileName}")
    public ResponseEntity<InputStreamResource> get(@PathVariable("fileName") String fileName,
                                                   HttpServletResponse response) throws IOException {
        GridFSDBFile myFile = retrieveFileOne("my_file", fileName);
        response.setContentType(fileName.substring(fileName.lastIndexOf(".")+1));

        HttpHeaders headers = new HttpHeaders();
        headers.add("Cache-Control", "cache, store, must-revalidate");
        headers.add("Content-Disposition", "attachment; fileName="+  fileName +";filename*=utf-8''"+ URLEncoder.encode(fileName,"UTF-8"));
        headers.add("Pragma", "cache");
        headers.add("Expires", "0");

        return ResponseEntity
                .ok()
                .headers(headers)
                .contentLength(myFile.getLength())
                .contentType(MediaType.parseMediaType("application/octet-stream"))
                .body(new InputStreamResource(myFile.getInputStream()));
    }

    /**
     * 存储文件
     * @param collectionName 集合名
     * @param file 文件
     * @param filename 文件名称
     */
    public void saveFile(String collectionName, InputStream file, String userName, String filename) {
        try {
            DB db = mongoDbFactory.getLegacyDb();
            // 存储fs的根节点
            GridFS gridFS = new GridFS(db, collectionName);
            GridFSInputFile gfs = gridFS.createFile(file);
            gfs.put("aliases", userName);
            gfs.put("filename", filename.substring(0,filename.lastIndexOf(".")));
            gfs.put("contentType", filename.substring(filename.lastIndexOf(".")+1));
            gfs.save();
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("存储文件时发生错误！！！");
        }
    }

    // 取出文件
    public GridFSDBFile retrieveFileOne(String collectionName, String filename) {
        try {
            DB db = mongoDbFactory.getLegacyDb();
            // 获取fs的根节点
            GridFS gridFS = new GridFS(db, collectionName);
            GridFSDBFile dbfile = gridFS.findOne(filename);
            if (dbfile != null) {
                return dbfile;
            }
        } catch (Exception e) {
            // TODO: handle exception
        }
        return null;
    }

    @Data
    private class Res{
        private String url;
        private Integer success;
        private String message;
    }
}
