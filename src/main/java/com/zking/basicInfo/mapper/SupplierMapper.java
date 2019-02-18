package com.zking.basicInfo.mapper;

import com.zking.basicInfo.model.Supplier;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository

public interface SupplierMapper {
    int deleteByPrimaryKey(String uuid);

    int insert(Supplier record);

    int insertSelective(Supplier record);

    Supplier selectByPrimaryKey(String uuid);

    int updateByPrimaryKeySelective(Supplier record);

    int updateByPrimaryKey(Supplier record);

    List<Supplier>  querySupplierPage(Supplier supplier);

    List<Supplier> queryByname();

}