package com.zking.sale.model;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.sql.Timestamp;
import java.util.Date;

public class OrderDetail {
    private String uuid;

    private String goodsuuid;

    private String goodsname;

    private Float price;

    private Integer num;

    private Float money;
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss",timezone = "GMT+8")
    private Timestamp endtime;

    private String ender;

    private String storeuuid;

    private String state;

    private String ordersuuid;

    public OrderDetail(String uuid, String goodsuuid, String goodsname, Float price, Integer num, Float money, Timestamp endtime, String ender, String storeuuid, String state, String ordersuuid) {
        this.uuid = uuid;
        this.goodsuuid = goodsuuid;
        this.goodsname = goodsname;
        this.price = price;
        this.num = num;
        this.money = money;
        this.endtime = endtime;
        this.ender = ender;
        this.storeuuid = storeuuid;
        this.state = state;
        this.ordersuuid = ordersuuid;
    }

    public OrderDetail() {
        super();
    }

    public String getUuid() {
        return uuid;
    }

    public void setUuid(String uuid) {
        this.uuid = uuid;
    }

    public String getGoodsuuid() {
        return goodsuuid;
    }

    public void setGoodsuuid(String goodsuuid) {
        this.goodsuuid = goodsuuid;
    }

    public String getGoodsname() {
        return goodsname;
    }

    public void setGoodsname(String goodsname) {
        this.goodsname = goodsname;
    }

    public Float getPrice() {
        return price;
    }

    public void setPrice(Float price) {
        this.price = price;
    }

    public Integer getNum() {
        return num;
    }

    public void setNum(Integer num) {
        this.num = num;
    }

    public Float getMoney() {
        return money;
    }

    public void setMoney(Float money) {
        this.money = money;
    }

    public Timestamp getEndtime() {
        return endtime;
    }

    public void setEndtime(Timestamp endtime) {
        this.endtime = endtime;
    }

    public String getEnder() {
        return ender;
    }

    public void setEnder(String ender) {
        this.ender = ender;
    }

    public String getStoreuuid() {
        return storeuuid;
    }

    public void setStoreuuid(String storeuuid) {
        this.storeuuid = storeuuid;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getOrdersuuid() {
        return ordersuuid;
    }

    public void setOrdersuuid(String ordersuuid) {
        this.ordersuuid = ordersuuid;
    }
}