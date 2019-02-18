package com.zking.personnel.service;

import com.zking.personnel.model.Emp;
import com.zking.ssm.util.PageBean;
import com.zking.ssm.vo.EmpVo;
import org.springframework.stereotype.Repository;

import java.util.List;

public interface IEmpService {
    int deleteByPrimaryKey(String uuid);

    int insert(Emp record);

    Emp selectByPrimaryKey(Emp emp);

    int updateByPrimaryKey(Emp record);

    List<Emp> querEmpPage(EmpVo emp, PageBean pageBean);

    List<Emp> querydep(Emp emp);

    List<Emp> queryemp(Emp emp);
}