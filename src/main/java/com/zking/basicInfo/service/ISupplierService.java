package com.zking.basicInfo.service;

import com.zking.basicInfo.model.Supplier;
import com.zking.ssm.util.PageBean;
import org.springframework.stereotype.Repository;

import java.util.List;



public interface ISupplierService {
    int deleteByPrimaryKey(String uuid);

    int insert(Supplier record);

    int insertSelective(Supplier record);

    Supplier selectByPrimaryKey(String uuid);

    int updateByPrimaryKeySelective(Supplier record);

    int updateByPrimaryKey(Supplier record);

    List<Supplier>  querySupplierPage(Supplier supplier, PageBean pageBean);

    List<Supplier> queryByname();
}