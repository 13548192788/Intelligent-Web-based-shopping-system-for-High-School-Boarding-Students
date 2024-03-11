package com.example.service;

import cn.hutool.core.util.ObjectUtil;
import com.example.common.Constants;
import com.example.common.enums.ResultCodeEnum;
import com.example.common.enums.RoleEnum;
import com.example.common.enums.StatusEnum;
import com.example.entity.Account;
import com.example.entity.Seller;
import com.example.exception.CustomException;
import com.example.mapper.SellerMapper;
import com.example.utils.TokenUtils;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * seller业务处理
 **/
@Service
public class SellerService {

    @Resource
    private SellerMapper sellerMapper;

    /**
     * 新增
     */
    public void add(Seller seller) {
        Seller dbSeller = sellerMapper.selectByUsername(seller.getUsername());
        if (ObjectUtil.isNotNull(dbSeller)) {
            throw new CustomException(ResultCodeEnum.USER_EXIST_ERROR);
        }
        if (ObjectUtil.isEmpty(seller.getPassword())) {
            seller.setPassword(Constants.USER_DEFAULT_PASSWORD);
        }
        if (ObjectUtil.isEmpty(seller.getName())) {
            seller.setName(seller.getUsername());
        }
        if (ObjectUtil.isEmpty(seller.getStatus())) {
            seller.setStatus(StatusEnum.CHECKING.status);
        }
        seller.setRole(RoleEnum.SELLER.name());
        sellerMapper.insert(seller);
    }

    /**
     * 删除
     */
    public void deleteById(Integer id) {
        sellerMapper.deleteById(id);
    }

    /**
     * 批量删除
     */
    public void deleteBatch(List<Integer> ids) {
        for (Integer id : ids) {
            sellerMapper.deleteById(id);
        }
    }

    /**
     * 修改
     */
    public void updateById(Seller seller) {
        sellerMapper.updateById(seller);
    }

    /**
     * 根据ID查询
     */
    public Seller selectById(Integer id) {
        return sellerMapper.selectById(id);
    }

    /**
     * 查询所有
     */
    public List<Seller> selectAll(Seller seller) {
        return sellerMapper.selectAll(seller);
    }

    /**
     * 分页查询
     */
    public PageInfo<Seller> selectPage(Seller seller, Integer pageNum, Integer pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        List<Seller> list = sellerMapper.selectAll(seller);
        return PageInfo.of(list);
    }

    /**
     * 登录
     */
    public Account login(Account account) {
        Account dbSeller = sellerMapper.selectByUsername(account.getUsername());
        if (ObjectUtil.isNull(dbSeller)) {
            throw new CustomException(ResultCodeEnum.USER_NOT_EXIST_ERROR);
        }
        if (!account.getPassword().equals(dbSeller.getPassword())) {
            throw new CustomException(ResultCodeEnum.USER_ACCOUNT_ERROR);
        }
        // 生成token
        String tokenData = dbSeller.getId() + "-" + RoleEnum.SELLER.name();
        String token = TokenUtils.createToken(tokenData, dbSeller.getPassword());
        dbSeller.setToken(token);
        return dbSeller;
    }

    /**
     * 注册
     */
    public void register(Account account) {
        Seller seller = new Seller();
        BeanUtils.copyProperties(account, seller);
        add(seller);
    }

    /**
     * 修改密码
     */
    public void updatePassword(Account account) {
        Seller dbSeller = sellerMapper.selectByUsername(account.getUsername());
        if (ObjectUtil.isNull(dbSeller)) {
            throw new CustomException(ResultCodeEnum.USER_NOT_EXIST_ERROR);
        }
        if (!account.getPassword().equals(dbSeller.getPassword())) {
            throw new CustomException(ResultCodeEnum.PARAM_PASSWORD_ERROR);
        }
        dbSeller.setPassword(account.getNewPassword());
        sellerMapper.updateById(dbSeller);
    }

}