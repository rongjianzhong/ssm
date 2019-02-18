package com.zking.sale.model;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.ToString;
import java.sql.Timestamp;
@ToString
public class Orders {
    private String uuid;
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss",timezone = "GMT+8")
    private Timestamp createtime;
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss",timezone = "GMT+8")
    private Timestamp checktime;
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss",timezone = "GMT+8")
    private Timestamp starttime;
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss",timezone = "GMT+8")
    private Timestamp endtime;

    private String type;

    private String creater;

    private String checker;

    private String starter;

    private String ender;

    private String supplieruuid;

    private Float totalmoney;

    private String state;

    public Orders() {
        super();
    }

    public String getUuid() {
        return uuid;
    }

    public void setUuid(String uuid) {
        this.uuid = uuid;
    }

    public Timestamp getCreatetime() {
        return createtime;
    }

    public void setCreatetime(Timestamp createtime) {
        this.createtime = createtime;
    }

    public Timestamp getChecktime() {
        return checktime;
    }

    public void setChecktime(Timestamp checktime) {
        this.checktime = checktime;
    }

    public Timestamp getStarttime() {
        return starttime;
    }

    public void setStarttime(Timestamp starttime) {
        this.starttime = starttime;
    }

    public Timestamp getEndtime() {
        return endtime;
    }

    public void setEndtime(Timestamp endtime) {
        this.endtime = endtime;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getCreater() {
        return creater;
    }

    public void setCreater(String creater) {
        this.creater = creater;
    }

    public String getChecker() {
        return checker;
    }

    public void setChecker(String checker) {
        this.checker = checker;
    }

    public String getStarter() {
        return starter;
    }

    public void setStarter(String starter) {
        this.starter = starter;
    }

    public String getEnder() {
        return ender;
    }

    public void setEnder(String ender) {
        this.ender = ender;
    }

    public String getSupplieruuid() {
        return supplieruuid;
    }

    public void setSupplieruuid(String supplieruuid) {
        this.supplieruuid = supplieruuid;
    }

    public Float getTotalmoney() {
        return totalmoney;
    }

    public void setTotalmoney(Float totalmoney) {
        this.totalmoney = totalmoney;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }
}