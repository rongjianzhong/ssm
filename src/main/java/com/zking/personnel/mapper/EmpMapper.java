package com.zking.personnel.mapper;

import com.zking.personnel.model.Emp;
import com.zking.ssm.vo.EmpVo;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface EmpMapper {
    int deleteByPrimaryKey(String uuid);

    int insert(Emp record);
    /**
     * 用户登录
     * @param emp
     * @return
     */
    Emp selectByPrimaryKey(Emp emp);

    int updateByPrimaryKey(Emp record);

    List<Emp> querEmpPage(EmpVo emp);

    List<Emp> querydep(Emp emp);

    List<Emp> queryemp(Emp emp);
}