package com.zking.basicInfo.service.impl;

import com.zking.basicInfo.mapper.SupplierMapper;
import com.zking.basicInfo.model.Supplier;
import com.zking.basicInfo.service.ISupplierService;
import com.zking.ssm.util.PageBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Transactional
@Service
public class SupplierServiceImpl implements ISupplierService {

    @Autowired
    private SupplierMapper supplierMapper;


    @Override
    public int deleteByPrimaryKey(String uuid) {
        return supplierMapper.deleteByPrimaryKey(uuid);
    }

    @Override
    public int insert(Supplier record) {
        return supplierMapper.insert(record);
    }

    @Override
    public int insertSelective(Supplier record) {
        return supplierMapper.insertSelective(record);
    }

    @Override
    public Supplier selectByPrimaryKey(String uuid) {
        return supplierMapper.selectByPrimaryKey(uuid);
    }

    @Override
    public int updateByPrimaryKeySelective(Supplier record) {
        return supplierMapper.updateByPrimaryKeySelective(record);
    }

    @Override
    public int updateByPrimaryKey(Supplier record) {
        return supplierMapper.updateByPrimaryKey(record);
    }

    @Override
    public List<Supplier> querySupplierPage(Supplier supplier, PageBean pageBean) {
        return supplierMapper.querySupplierPage(supplier);
    }

    @Override
    public List<Supplier> queryByname() {
        return supplierMapper.queryByname();
    }

}
