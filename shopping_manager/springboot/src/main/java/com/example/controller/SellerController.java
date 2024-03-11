package com.example.controller;

import com.example.common.Result;
import com.example.entity.Seller;
import com.example.service.SellerService;
import com.github.pagehelper.PageInfo;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;

/**
 * seller前端操作接口
 * 请求转发，接受页面过来的参数，传给Service处理，接到返回值，再传给页面
 **/
@RestController
@RequestMapping("/seller")
public class SellerController {

    @Resource
    private SellerService sellerService;

    /**
     * 新增
     */
    @PostMapping("/add")
    public Result add(@RequestBody Seller seller) {
        sellerService.add(seller);
        return Result.success();
    }

    @RequestMapping("/")
    public String hello(){
        return "seller ok";
    }

    /**
     * 删除
     */
    @DeleteMapping("/delete/{id}")
    public Result deleteById(@PathVariable Integer id) {
        sellerService.deleteById(id);
        return Result.success();
    }

    /**
     * 批量删除
     */
    @DeleteMapping("/delete/batch")
    public Result deleteBatch(@RequestBody List<Integer> ids) {
        sellerService.deleteBatch(ids);
        return Result.success();
    }

    /**
     * 修改
     */
    @PutMapping("/update")
    public Result updateById(@RequestBody Seller seller) {
        sellerService.updateById(seller);
        return Result.success();
    }

    /**
     * 根据ID查询
     */
    @GetMapping("/selectById/{id}")
    public Result selectById(@PathVariable Integer id) {
        Seller seller = sellerService.selectById(id);
        return Result.success(seller);
    }

    /**
     * 查询所有
     */
    @GetMapping("/selectAll")
    public Result selectAll(Seller seller ) {
        List<Seller> list = sellerService.selectAll(seller);
        return Result.success(list);
    }

    /**
     * 分页查询
     */
    @GetMapping("/selectPage")
    public Result selectPage(Seller seller,
                             @RequestParam(defaultValue = "1") Integer pageNum,
                             @RequestParam(defaultValue = "10") Integer pageSize) {
        PageInfo<Seller> page = sellerService.selectPage(seller, pageNum, pageSize);
        return Result.success(page);
    }

}