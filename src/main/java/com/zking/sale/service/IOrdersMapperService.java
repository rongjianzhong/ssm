package com.zking.sale.service;

import com.zking.sale.model.OrderDetail;
import com.zking.sale.model.Orders;
import com.zking.ssm.util.PageBean;

import java.util.List;
import java.util.Map;

public interface IOrdersMapperService {

    int deleteByPrimaryKey(String uuid);

    int insert(Orders record);

    Orders selectByPrimaryKey(String uuid);

    int updateByPrimaryKey(Orders record);

    int updateordera(Orders record);

    int updateorderb(Orders record);

    int updateorder(Orders record);

    List<Orders> queryOrdersPage(Orders orders, PageBean pageBean);

    //修改（确认）
    int updatea(Orders record);

    //放弃采购的
    int updateb(Orders record);

    //结束采购的
    int updatec(Orders record);

    List<Orders> queryOrderPage(Orders order, PageBean pageBean);

    //增加订单项的方法
    int insertorderitem(OrderDetail orderDetail);

    //统计
    List<Integer> queryybtj(Orders date,String ks);

    List<Map<String,Object>> queryxstj(Map<String,Object> xstj);
}