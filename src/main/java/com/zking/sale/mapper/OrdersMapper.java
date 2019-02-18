package com.zking.sale.mapper;

import com.zking.sale.model.OrderDetail;
import com.zking.sale.model.Orders;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public interface OrdersMapper {
    int deleteByPrimaryKey(String uuid);

    int insert(Orders record);

    Orders selectByPrimaryKey(String uuid);

    int updateByPrimaryKey(Orders record);

    int updateorder(Orders record);

    int updateorderb(Orders record);

    int updateordera(Orders record);

    List<Orders> queryOrdersPage(Orders orders);

    //修改（确认）
    int updatea(Orders record);

    //放弃采购的
    int updateb(Orders record);

    //结束采购的
    int updatec(Orders record);

    List<Orders> queryOrderPage(Orders order);

    //增加订单项的方法
    int insertorderitem(OrderDetail orderDetail);

    //统计
    List<Integer> queryybtj(Orders date,@Param("ks") String ks);

    List<Map<String,Object>> queryxstj(Map<String,Object> xstj);

}