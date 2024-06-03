package com.example.controller;

import com.example.common.Result;
import com.example.entity.Cart;
import com.example.entity.Orders;
import com.example.entity.Product;
import com.example.service.OrdersService;
import com.example.service.ProductService;
import com.github.pagehelper.PageInfo;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;

/**
 * 购物车前端操作接口
 **/
@RestController
@RequestMapping("/orders")
public class OrdersController {

    @Resource
    private OrdersService ordersService;
    @Resource
    private ProductService productService;

    @PostMapping("/add")
    public Result add(@RequestBody Orders orders) {
        ordersService.add(orders);
        // 更新商品销量
        List<Cart> cartData = orders.getCartData();
        try {
            if (!cartData.isEmpty()) {
                for (Cart cart : cartData) {
                    Integer productId = cart.getProductId();
                    Integer num = cart.getNum();
                    Product product = productService.selectById(productId);
                    product.setCount(product.getCount() + num);
                    productService.updateById(product);
                }
            }
        }catch ( Exception e){
           System.out.println("Update sale failed");
           System.out.println(e.getMessage());
        }

        //productService.increaseProductSales(orders.getProductId());
        return Result.success();
    }

    /**
     * 删除
     */
    @DeleteMapping("/delete/{id}")
    public Result deleteById(@PathVariable Integer id) {
        ordersService.deleteById(id);
        return Result.success();
    }

    /**
     * 批量删除
     */
    @DeleteMapping("/delete/batch")
    public Result deleteBatch(@RequestBody List<Integer> ids) {
        ordersService.deleteBatch(ids);
        return Result.success();
    }

    /**
     * 修改
     */
    @PutMapping("/update")
    public Result updateById(@RequestBody Orders orders) {
        ordersService.updateById(orders);
        return Result.success();
    }

    /**
     * 根据ID查询
     */
    @GetMapping("/selectById/{id}")
    public Result selectById(@PathVariable Integer id) {
        Orders orders = ordersService.selectById(id);
        return Result.success(orders);
    }

    /**
     * 查询所有
     */
    @GetMapping("/selectAll")
    public Result selectAll(Orders orders ) {
        List<Orders> list = ordersService.selectAll(orders);
        return Result.success(list);
    }

    /**
     * 分页查询
     */
    @GetMapping("/selectPage")
    public Result selectPage(Orders orders,
                             @RequestParam(defaultValue = "1") Integer pageNum,
                             @RequestParam(defaultValue = "10") Integer pageSize) {
        PageInfo<Orders> page = ordersService.selectPage(orders, pageNum, pageSize);
        return Result.success(page);
    }

}