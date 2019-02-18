package com.zking.ssm.vo;

import com.zking.personnel.model.Emp;
import lombok.ToString;

@ToString
public class EmpVo extends Emp {
    private String ks;
    private String js;

    public String getKs() {
        return ks;
    }

    public void setKs(String ks) {
        this.ks = ks;
    }

    public String getJs() {
        return js;
    }

    public void setJs(String js) {
        this.js = js;
    }

    public EmpVo() {
        super();
    }

}
