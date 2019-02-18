package com.zking.basicInfo.model;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.util.Date;

public class Store {
    private String uuid;

    private String name;

    private String empuuid;

    private String address;
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss",timezone = "GMT+8")
    private Date createdate;

    public Store(String uuid, String name, String empuuid, String address, Date createdate) {
        this.uuid = uuid;
        this.name = name;
        this.empuuid = empuuid;
        this.address = address;
        this.createdate = createdate;
    }

    public Store() {
        super();
    }

    public String getUuid() {
        return uuid;
    }

    public void setUuid(String uuid) {
        this.uuid = uuid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmpuuid() {
        return empuuid;
    }

    public void setEmpuuid(String empuuid) {
        this.empuuid = empuuid;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Date getCreatedate() {
        return createdate;
    }

    public void setCreatedate(Date createdate) {
        this.createdate = createdate;
    }

    @Override
    public String toString() {
        return "Store{" +
                "uuid='" + uuid + '\'' +
                ", name='" + name + '\'' +
                ", empuuid='" + empuuid + '\'' +
                ", address='" + address + '\'' +
                ", createdate=" + createdate +
                '}';
    }



}