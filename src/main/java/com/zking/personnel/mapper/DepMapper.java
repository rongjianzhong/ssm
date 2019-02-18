package com.zking.personnel.mapper;

import com.zking.personnel.model.Dep;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public interface DepMapper {
    int deleteByPrimaryKey(String uuid);

    int insert(Dep record);

    Dep selectByPrimaryKey(String uuid);

    int updateByPrimaryKey(Dep record);

    List<Dep> queryGoodStypePage(Dep dep);

}