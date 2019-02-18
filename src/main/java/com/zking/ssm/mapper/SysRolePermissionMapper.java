package com.zking.ssm.mapper;

import com.zking.ssm.model.SysRolePermission;
import com.zking.ssm.vo.SysVo;

public interface SysRolePermissionMapper {
    int insert(SysRolePermission record);

    int insertSelective(SysRolePermission record);

    int insertSysRolePermission(SysVo sysVo);
}