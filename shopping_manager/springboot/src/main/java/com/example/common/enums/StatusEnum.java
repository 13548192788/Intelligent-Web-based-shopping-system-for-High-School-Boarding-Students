package com.example.common.enums;

public enum StatusEnum {
    CHECKING("CHECKING"),
    CHECK_OK("PASS"),
    CHECK_NO("FAIL"),
    ;

    public String status;

    StatusEnum(String status) {
        this.status = status;
    }
}
