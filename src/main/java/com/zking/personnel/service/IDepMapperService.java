package com.zking.personnel.service;

import com.zking.personnel.model.Dep;
import com.zking.ssm.util.PageBean;

import java.util.List;

public interface IDepMapperService {
    int deleteByPrimaryKey(String uuid);

    int insert(Dep record);

    Dep selectByPrimaryKey(String uuid);

    int updateByPrimaryKey(Dep record);

    List<Dep> queryGoodStypePage(Dep dep, PageBean pageBean);
}