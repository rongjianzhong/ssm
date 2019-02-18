package com.zking.ssm.service;

import com.zking.ssm.model.SysRole;
import com.zking.ssm.model.SysRolePermission;
import com.zking.ssm.model.SysUserRole;
import com.zking.ssm.util.PageBean;
import com.zking.ssm.vo.SysVo;

import java.util.List;

public interface ISysRoleService {
    int deleteByPrimaryKey(Integer roleid);

    int insert(SysRole record);

    int insertSelective(SysRole record);

    SysRole selectByPrimaryKey(Integer roleid);

    int updateByPrimaryKeySelective(SysRole record);

    int updateByPrimaryKey(SysRole record);

    List<SysRole> querySysRolePage(SysRole sysRole, PageBean pageBean);

    int insertSysRolePermission(SysVo sysVo);

    int insertUserRole(SysUserRole sysUserRole);

    List<SysRolePermission> queryRolePermission(SysRolePermission sysRolePermission);
}