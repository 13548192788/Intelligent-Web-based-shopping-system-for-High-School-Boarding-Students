package com.example.controller;

import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.io.FileUtil;
import cn.hutool.core.lang.Dict;
import com.example.common.Result;
import com.example.entity.Product;
import com.example.service.ProductService;
import com.github.pagehelper.PageInfo;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


/**
 * 分类信息表前端操作接口
 **/

@RestController
@RequestMapping("/product")
public class ProductController {

    @Resource
    private ProductService productService;

    @PostMapping("/add")
    public Result add(@RequestBody Product product) {

        productService.add(product);
        return Result.success();
    }

    @DeleteMapping("/delete/{id}")
    public Result deleteById(@PathVariable Integer id) {
        productService.deleteById(id);
        return Result.success();
    }


    @DeleteMapping("/delete/batch")
    public Result deleteBatch(@RequestBody List<Integer> ids) {
        productService.deleteBatch(ids);
        return Result.success();
    }

    @PutMapping("/update")
    public Result updateById(@RequestBody Product product) {
        productService.updateById(product);
        return Result.success();
    }

    /**
     * 根据ID查询
     */
    @GetMapping("/selectById/{id}")
    public Result selectById(@PathVariable Integer id) {
        Product product = productService.selectById(id);
        return Result.success(product);
    }

    @GetMapping("/selectById")
    public Result selectByIdNew(Integer id) {
        Product product = productService.selectById(id);
        return Result.success(product);
    }

    /**
     * 查询所有
     */
    @GetMapping("/selectAll")
    public Result selectAll(Product product ) {
        List<Product> list = productService.selectAll(product);
        return Result.success(list);
    }

    @GetMapping("/selectByCategoryId")
    public Result selectByTypeId(@RequestParam Integer id) {
        List<Product> list = productService.selectByCategoryId(id);
        return Result.success(list);
    }

    @GetMapping("/selectByName")
    public Result selectByName(@RequestParam String name) {
        List<Product> list = productService.selectByName(name);
        return Result.success(list);
    }

    @GetMapping("/selectTop12")
    public Result selectTop12() {
        List<Product> list = productService.selectTop12();
        return Result.success(list);
    }

    @GetMapping("/selectBySellerId")
    public Result selectBySellerId(@RequestParam Integer id) {
        List<Product> list = productService.selectBySellerId(id);
        return Result.success(list);
    }


    @GetMapping("/recommend")
    public Result recommend() {
        List<Product> list = productService.recommend();
        return Result.success(list);
    }

    /**
     * 分页查询
     */
    @GetMapping("/selectPage")
    public Result selectPage(Product product,
                             @RequestParam(defaultValue = "1") Integer pageNum,
                             @RequestParam(defaultValue = "10") Integer pageSize) {
        PageInfo<Product> page = productService.selectPage(product, pageNum, pageSize);
        return Result.success(page);
    }


}