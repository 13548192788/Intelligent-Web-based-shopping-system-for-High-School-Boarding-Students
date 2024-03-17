package com.example.service;

import cn.hutool.core.util.ObjectUtil;
import com.example.common.enums.RoleEnum;
import com.example.entity.*;
import com.example.mapper.*;
import com.example.utils.TokenUtils;
import com.example.utils.UserCF;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.Random;
import java.util.stream.Collectors;

/**
 * 分类信息表业务处理
 **/
@Service
public class ProductService {

    @Resource
    private ProductMapper productMapper;
    @Resource
    private CollectMapper collectMapper;
    @Resource
    private CommentMapper commentMapper;
    @Resource
    private CartMapper cartMapper;
    @Resource
    private OrdersMapper ordersMapper;
    @Resource
    private UserMapper userMapper;


    /**
     * 新增
     */
    public void add(Product product) {
        Account currentUser = TokenUtils.getCurrentUser();
        if (RoleEnum.SELLER.name().equals(currentUser.getRole())) {
            product.setSellerId(currentUser.getId());
        }
        productMapper.insert(product);
    }

    /**
     * 删除
     */
    public void deleteById(Integer id) {
        productMapper.deleteById(id);
    }

    /**
     * 批量删除
     */
    public void deleteBatch(List<Integer> ids) {
        for (Integer id : ids) {
            productMapper.deleteById(id);
        }
    }

    /**
     * 修改
     */
    public void updateById(Product product) {
        productMapper.updateById(product);
    }

    /**
     * 根据ID查询
     */
    public Product selectById(Integer id) {
        return productMapper.selectById(id);
    }

    /**
     * 查询所有
     */
    public List<Product> selectAll(Product product) {
        return productMapper.selectAll(product);
    }

    public List<Product> selectTop15() {
        return productMapper.selectTop15();
    }

    public List<Product> selectByCategoryId(Integer id) {
        return productMapper.selectByCategoryId(id);
    }

    public List<Product> selectBySellerId(Integer id) {
        return productMapper.selectBySellerId(id);
    }

    public List<Product> selectByName(String name) {
        return productMapper.selectByName(name);
    }

    /**
     * 分页查询
     */
    public PageInfo<Product> selectPage(Product product, Integer pageNum, Integer pageSize) {
        Account currentUser = TokenUtils.getCurrentUser();
        if (RoleEnum.SELLER.name().equals(currentUser.getRole())) {
            product.setSellerId(currentUser.getId());
        }
        PageHelper.startPage(pageNum, pageSize);
        List<Product> list = productMapper.selectAll(product);
        return PageInfo.of(list);
    }

    public List<Product> recommend() {
        Account currentUser = TokenUtils.getCurrentUser();
        if (ObjectUtil.isEmpty(currentUser)) {
            // 没有用户登录
            return new ArrayList<>();
        }
        // 用户的哪些行为可以认为他跟商品产生了关系？收藏、加入购物车、下单、评论
        // 1. 获取所有的收藏信息
        List<Collect> allCollects = collectMapper.selectAll(null);
        // 2. 获取所有的购物车信息
        List<Cart> allCarts = cartMapper.selectAll(null);
        // 3. 获取所有的订单信息
        List<Orders> allOrders = ordersMapper.selectAllOKOrders();
        // 4. 获取所有的评论信息
        List<Comment> allComments = commentMapper.selectAll(null);
        // 5. 获取所有的用户信息
        List<User> allUsers = userMapper.selectAll(null);
        // 6. 获取所有的商品信息
        List<Product> allProduct = productMapper.selectAll(null);

        // 定义一个存储每个商品和每个用户关系的List
        List<RelateDTO> data = new ArrayList<>();
        // 定义一个存储最后返回给前端的商品List
        List<Product> result = new ArrayList<>();

        // 开始计算每个商品和每个用户之间的关系数据
        for (Product product : allProduct) {
            Integer productId = product.getId();
            for (User user : allUsers) {
                Integer userId = user.getId();
                int index = 1;
                // 1. 判断该用户有没有收藏该商品，收藏的权重我们给 1
                Optional<Collect> collectOptional = allCollects.stream().filter(x -> x.getProductId().equals(productId) && x.getUserId().equals(userId)).findFirst();
                if (collectOptional.isPresent()) {
                    index += 1;
                }
                // 2. 判断该用户有没有给该商品加入购物车，加入购物车的权重我们给 2
                Optional<Cart> cartOptional = allCarts.stream().filter(x -> x.getProductId().equals(productId) && x.getUserId().equals(userId)).findFirst();
                if (cartOptional.isPresent()) {
                    index += 2;
                }
                // 3. 判断该用户有没有对该商品下过单（已完成的订单），订单的权重我们给 3
                Optional<Orders> ordersOptional = allOrders.stream().filter(x -> x.getProductId().equals(productId) && x.getUserId().equals(userId)).findFirst();
                if (ordersOptional.isPresent()) {
                    index += 3;
                }
                // 4. 判断该用户有没有对该商品评论过，评论的权重我们给 2
                Optional<Comment> commentOptional = allComments.stream().filter(x -> x.getProductId().equals(productId) && x.getUserId().equals(userId)).findFirst();
                if (commentOptional.isPresent()) {
                    index += 2;
                }
                if (index > 1) {
                    RelateDTO relateDTO = new RelateDTO(userId, productId, index);
                    data.add(relateDTO);
                }
            }
        }

        // 数据准备结束后，就把这些数据一起喂给这个推荐算法
        List<Integer> productIds = UserCF.recommend(currentUser.getId(), data);
        // 把商品id转换成商品
        List<Product> recommendResult = productIds.stream().map(productId -> allProduct.stream()
                        .filter(x -> x.getId().equals(productId)).findFirst().orElse(null))
                .limit(10).collect(Collectors.toList());

//        if (CollectionUtil.isEmpty(recommendResult)) {
//            // 随机给它推荐10个
//            return getRandomProduct(10);
//        }
//        if (recommendResult.size() < 10) {
//            int num = 10 - recommendResult.size();
//            List<Product> list = getRandomProduct(num);
//            result.addAll(list);
//        }
        return recommendResult;
    }

    private List<Product> getRandomProduct(int num) {
        List<Product> list = new ArrayList<>(num);
        List<Product> product = productMapper.selectAll(null);
        for (int i = 0; i < num; i++) {
            int index = new Random().nextInt(product.size());
            list.add(product.get(index));
        }
        return list;
    }

}