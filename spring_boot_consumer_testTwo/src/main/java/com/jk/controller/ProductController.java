package com.jk.controller;

import com.jk.model.Tree;
import com.jk.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("product")
public class ProductController {
      @Autowired
    private ProductService productService;

      //查询树
    @RequestMapping("queryTree")
    @ResponseBody
    public List queryTree(){
          //查询父级
        List<Tree> parentList=productService.queryParentList(0);
        //查询子级
        List<Tree> allList=productService.queryAllList(parentList);

        return  allList;
    }

}
