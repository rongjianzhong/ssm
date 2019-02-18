package com.zking.basicInfo.model;

import lombok.ToString;

import java.util.UUID;

@ToString
public class GoodStype {
    private Integer uuid;

    private String name;

    public GoodStype(Integer uuid, String name) {
        this.uuid = uuid;
        this.name = name;
    }

    public GoodStype() {
        super();
    }

    public Integer getUuid() {
        return uuid;
    }

    public void setUuid(Integer uuid) {
        this.uuid = uuid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}