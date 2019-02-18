package com.zking.personnel.service.impl;

import com.zking.personnel.mapper.DepMapper;
import com.zking.personnel.mapper.EmpMapper;
import com.zking.personnel.model.Emp;
import com.zking.personnel.service.IEmpService;
import com.zking.ssm.mapper.SysRoleMapper;
import com.zking.ssm.model.SysUserRole;
import com.zking.ssm.util.PageBean;
import com.zking.ssm.vo.EmpVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
@Service
@Transactional
public class EmpServiceImpl implements IEmpService {
    @Autowired
    private EmpMapper empMapper;
    @Autowired
    private SysRoleMapper sysRoleMapper;
    @Override
    public int deleteByPrimaryKey(String uuid) {
        SysUserRole sysUserRole  = new SysUserRole();
        sysUserRole.setUserid(uuid);
        sysRoleMapper.delUserRole(sysUserRole);
        return empMapper.deleteByPrimaryKey(uuid);
    }
    @Override
    public int insert(Emp record) {
        return empMapper.insert(record);
    }

    @Override
    public Emp selectByPrimaryKey(Emp emp) {
        return empMapper.selectByPrimaryKey(emp);
    }

    @Override
    public int updateByPrimaryKey(Emp record) {
        return empMapper.updateByPrimaryKey(record);
    }

    @Override
    public List<Emp> querEmpPage(EmpVo emp, PageBean pageBean) {
        return empMapper.querEmpPage(emp);
    }

    @Override
    public List<Emp> querydep(Emp emp) {
        return empMapper.querydep(emp);
    }

    @Override
    public List<Emp> queryemp(Emp emp) {
        return empMapper.queryemp(emp);
    }


}
