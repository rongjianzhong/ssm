package com.zking.ssm.vo;

import com.zking.warehouse.model.Storeoper;
import lombok.ToString;

@ToString
public class StoreperVo extends Storeoper {
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
    public StoreperVo() {
        super();
    }
}
