package com.zking.ssm.model;

import lombok.ToString;

@ToString
public class Module {
    private Integer id;

    private Integer pid;

    private String text;

    private String icon;

    private String url;


    public Module(Integer id, Integer pid, String text, String icon, String url) {
        this.id = id;
        this.pid = pid;
        this.text = text;
        this.icon = icon;
        this.url = url;
    }

    public Module() {
        super();
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getPid() {
        return pid;
    }

    public void setPid(Integer pid) {
        this.pid = pid;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public String getIcon() {
        return icon;
    }

    public void setIcon(String icon) {
        this.icon = icon;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

}