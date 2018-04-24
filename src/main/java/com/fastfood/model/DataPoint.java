package com.fastfood.model;

public class DataPoint {
    Long count;
    String name;

    public DataPoint() {
    }

    public DataPoint(Long count,String name) {
        this.count = count;
        this.name = name;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Long getCount() {
        return count;
    }

    public void setCount(Long count) {
        this.count = count;
    }
}
