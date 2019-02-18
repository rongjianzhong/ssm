package com.zking.sale.service;

import com.zking.sale.model.OrderDetail;
import com.zking.ssm.util.PageBean;

import java.util.List;
import java.util.Map;

public interface IOrderDetailMapperService {
    int deleteByPrimaryKey(String uuid);

    int insert(OrderDetail record);

    int insert1(OrderDetail record);

    OrderDetail selectByPrimaryKey(String uuid);

    int updateByPrimaryKey(OrderDetail record);

    List<Map<String,Object>> queryOrdersPage(OrderDetail orderDetail, PageBean pageBean);

    //根据订单id查询所有订单项
    List<OrderDetail> queryOrderDetailPage(OrderDetail orderDetail,PageBean pageBean);
}