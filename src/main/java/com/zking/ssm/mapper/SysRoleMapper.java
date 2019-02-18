package com.zking.ssm.mapper;

import com.zking.ssm.model.SysRole;
import com.zking.ssm.model.SysRolePermission;
import com.zking.ssm.model.SysUserRole;
import com.zking.ssm.vo.SysVo;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public interface SysRoleMapper {
    int deleteByPrimaryKey(Integer roleid);

    int insert(SysRole record);

    int insertSelective(SysRole record);

    SysRole selectByPrimaryKey(Integer roleid);

    int updateByPrimaryKeySelective(SysRole record);

    int updateByPrimaryKey(SysRole record);

    List<SysRole> querySysRolePage(SysRole sysRole);

    int insertSysRolePermission(SysVo sysVo);

    int delSysRolePermission(SysVo sysVo);

    int insertUserRole(SysUserRole sysUserRole);

    int delUserRole(SysUserRole sysUserRole);

    List<SysRolePermission> queryRolePermission(SysRolePermission sysRolePermission);

}