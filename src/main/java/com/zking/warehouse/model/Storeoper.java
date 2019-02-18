package com.zking.warehouse.model;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.ToString;

import java.sql.Timestamp;
@ToString
public class Storeoper {
    private String uuid;

    private String empuuid;
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss",timezone = "GMT+8")
    private Timestamp opertime;

    private String storeuuid;

    private String goodsuuid;

    private Integer num;

    private String type;

    public Storeoper(String uuid, String empuuid, Timestamp opertime, String storeuuid, String goodsuuid, Integer num, String type) {
        this.uuid = uuid;
        this.empuuid = empuuid;
        this.opertime = opertime;
        this.storeuuid = storeuuid;
        this.goodsuuid = goodsuuid;
        this.num = num;
        this.type = type;
    }

    public Storeoper() {
        super();
    }

    public String getUuid() {
        return uuid;
    }

    public void setUuid(String uuid) {
        this.uuid = uuid;
    }

    public String getEmpuuid() {
        return empuuid;
    }

    public void setEmpuuid(String empuuid) {
        this.empuuid = empuuid;
    }

    public Timestamp getOpertime() {
        return opertime;
    }

    public void setOpertime(Timestamp opertime) {
        this.opertime = opertime;
    }

    public String getStoreuuid() {
        return storeuuid;
    }

    public void setStoreuuid(String storeuuid) {
        this.storeuuid = storeuuid;
    }

    public String getGoodsuuid() {
        return goodsuuid;
    }

    public void setGoodsuuid(String goodsuuid) {
        this.goodsuuid = goodsuuid;
    }

    public Integer getNum() {
        return num;
    }

    public void setNum(Integer num) {
        this.num = num;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }
}