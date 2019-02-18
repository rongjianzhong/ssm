package com.zking.sale.mapper;

import com.zking.sale.model.OrderDetail;
import com.zking.sale.model.Orders;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public interface OrderDetailMapper {
    int deleteByPrimaryKey(String uuid);

    int insert(List<OrderDetail> ls);

    int insert1(OrderDetail record);

    OrderDetail selectByPrimaryKey(String uuid);
    //修改审查
    int updateByPrimaryKey(OrderDetail record);

    List<Map<String,Object>> queryOrdersPage(OrderDetail orderDetail);

    //根据订单id查询所有订单项
    List<OrderDetail> queryOrderDetailPage(OrderDetail orderDetail);
}