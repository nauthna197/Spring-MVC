package com.fastfood.message;

public class BaseRespone {
    private Object data;
    private String message;

    public BaseRespone(Object data, String message) {
        this.data = data;
        this.message = message;
    }

    public BaseRespone(String message) {
        this.message = message;
    }

    public Object getData() {
        return data;
    }

    public void setData(Object data) {
        this.data = data;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
}
