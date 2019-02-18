package com.zking.ssm.vo;

import com.zking.ssm.model.SysPermission;
import com.zking.ssm.model.SysRolePermission;
import lombok.ToString;

@ToString
public class SysVo extends SysRolePermission {
    private String[] ids;

    public String[] getIds() {
        return ids;
    }

    public void setIds(String[] ids) {
        this.ids = ids;
    }
    public SysVo() {
        super();
    }
}
