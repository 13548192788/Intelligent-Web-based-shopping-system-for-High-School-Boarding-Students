package com.example.common.enums;

public enum ResultCodeEnum {
    SUCCESS("200", "Successfully"),

    PARAM_ERROR("400", "Parameter Error"),
    TOKEN_INVALID_ERROR("401", "Invalid token"),
    TOKEN_CHECK_ERROR("401", "Token authentication failed, please log in again"),
    PARAM_LOST_ERROR("4001", "Missing parameters"),//参数缺失

    SYSTEM_ERROR("500", "System Error"),//系统异常
    USER_EXIST_ERROR("5001", "Account already exists"),//用户名已存在
    USER_NOT_LOGIN("5002", "User not logged in"),//用户未登录
    USER_ACCOUNT_ERROR("5003", "Wrong account or password"),//账号或密码错误
    USER_NOT_EXIST_ERROR("5004", "User does not exist"),
    PARAM_PASSWORD_ERROR("5005", "Original password input error"),//原密码输入错误
    COLLECT_ALREADY_ERROR("5006", "You have already collected this product"),//您已收藏过该商品
    ;

    public String code;
    public String msg;

    ResultCodeEnum(String code, String msg) {
        this.code = code;
        this.msg = msg;
    }
}
