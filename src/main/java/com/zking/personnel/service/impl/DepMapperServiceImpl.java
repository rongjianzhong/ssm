package com.zking.personnel.service.impl;

import com.zking.personnel.mapper.DepMapper;
import com.zking.personnel.model.Dep;
import com.zking.personnel.service.IDepMapperService;
import com.zking.ssm.util.PageBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Transactional
@Service
public class DepMapperServiceImpl implements IDepMapperService {

    @Autowired
    private DepMapper depMapper;

    @Override
    public int deleteByPrimaryKey(String uuid) {
        return depMapper.deleteByPrimaryKey(uuid);
    }

    @Override
    public int insert(Dep record) {
        return depMapper.insert(record);
    }

    @Override
    public Dep selectByPrimaryKey(String uuid) {
        return depMapper.selectByPrimaryKey(uuid);
    }

    @Override
    public int updateByPrimaryKey(Dep record) {
        return depMapper.updateByPrimaryKey(record);
    }

    @Override
    public List<Dep> queryGoodStypePage(Dep dep,PageBean pageBean) {
        return depMapper.queryGoodStypePage(dep);
    }


}
