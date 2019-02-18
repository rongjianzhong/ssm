package com.zking.basicInfo.model;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.sql.Timestamp;

public class Supplier {
    private String uuid;

    private String name;

    private String address;

    private String contact;

    private String tele;

    private String email;

    private String type;

    private Timestamp createdate;

    public Timestamp getCreatedate() {
        return createdate;
    }
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss",timezone = "GMT+8")

    public void setCreatedate(Timestamp createdate) {
        this.createdate = createdate;
    }

    public Supplier() {
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

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getContact() {
        return contact;
    }

    public void setContact(String contact) {
        this.contact = contact;
    }

    public String getTele() {
        return tele;
    }

    public void setTele(String tele) {
        this.tele = tele;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public Supplier(String uuid, String name, String address, String contact, String tele, String email, String type, Timestamp createdate) {
        this.uuid = uuid;
        this.name = name;
        this.address = address;
        this.contact = contact;
        this.tele = tele;
        this.email = email;
        this.type = type;
        this.createdate = createdate;
    }

    @Override
    public String toString() {
        return "Supplier{" +
                "uuid='" + uuid + '\'' +
                ", name='" + name + '\'' +
                ", address='" + address + '\'' +
                ", contact='" + contact + '\'' +
                ", tele='" + tele + '\'' +
                ", email='" + email + '\'' +
                ", type='" + type + '\'' +
                ", createdate=" + createdate +
                '}';
    }

}