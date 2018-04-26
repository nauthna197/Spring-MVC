package com.fastfood.model;

import java.util.Date;

public class DataPointDaily {
    private Date date;
    private Long count;


    public DataPointDaily(Date date, Long count) {
        this.date = date;
        this.count = count;
    }

    public DataPointDaily() {

    }

    public Long getCount() {
        return count;
    }

    public void setCount(Long count) {
        this.count = count;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }
}
