package com.zking.ssm.service.impl;

import com.zking.ssm.mapper.SysRoleMapper;
import com.zking.ssm.model.SysRole;
import com.zking.ssm.model.SysRolePermission;
import com.zking.ssm.model.SysUserRole;
import com.zking.ssm.service.ISysRoleService;
import com.zking.ssm.util.PageBean;
import com.zking.ssm.vo.SysVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
@Service
@Transactional
public class SysRoleServiceImpl implements ISysRoleService {
    @Autowired
    private SysRoleMapper sysRoleMapper;
    @Override
    public int deleteByPrimaryKey(Integer roleid) {
        return sysRoleMapper.deleteByPrimaryKey(roleid);
    }

    @Override
    public int insert(SysRole record) {
        return sysRoleMapper.insert(record);
    }

    @Override
    public int insertSelective(SysRole record) {
        return sysRoleMapper.insertSelective(record);
    }

    @Override
    public SysRole selectByPrimaryKey(Integer roleid) {
        return sysRoleMapper.selectByPrimaryKey(roleid);
    }

    @Override
    public int updateByPrimaryKeySelective(SysRole record) {
        return sysRoleMapper.updateByPrimaryKeySelective(record);
    }

    @Override
    public int updateByPrimaryKey(SysRole record) {
        return sysRoleMapper.updateByPrimaryKey(record);
    }

    @Override
    public List<SysRole> querySysRolePage(SysRole sysRole, PageBean pageBean) {
        return sysRoleMapper.querySysRolePage(sysRole);
    }

    @Override
    public int insertSysRolePermission(SysVo sysVo) {
        sysRoleMapper.delSysRolePermission(sysVo);
        sysRoleMapper.insertSysRolePermission(sysVo);
        return 0;
    }

    @Override
    public int insertUserRole(SysUserRole sysUserRole) {
        sysRoleMapper.delUserRole(sysUserRole);
        sysRoleMapper.insertUserRole(sysUserRole);
        return 0;
    }

    @Override
    public List<SysRolePermission> queryRolePermission(SysRolePermission sysRolePermission) {
        return sysRoleMapper.queryRolePermission(sysRolePermission);
    }

}
