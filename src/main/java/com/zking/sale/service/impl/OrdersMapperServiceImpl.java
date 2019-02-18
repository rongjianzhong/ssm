package com.zking.sale.service.impl;

import com.zking.sale.mapper.OrderDetailMapper;
import com.zking.sale.mapper.OrdersMapper;
import com.zking.sale.model.OrderDetail;
import com.zking.sale.model.Orders;
import com.zking.sale.service.IOrdersMapperService;
import com.zking.ssm.util.PageBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;
import java.util.Map;
@Service
@Transactional
public class OrdersMapperServiceImpl implements IOrdersMapperService {

    @Autowired
    private OrdersMapper ordersMapper;

    @Override
    public int deleteByPrimaryKey(String uuid) {
        return ordersMapper.deleteByPrimaryKey(uuid);
    }

    @Override
    public int insert(Orders record) {
        return ordersMapper.insert(record);
    }


    @Override
    public Orders selectByPrimaryKey(String uuid) {
        return ordersMapper.selectByPrimaryKey(uuid);
    }

    @Override
    public int updateByPrimaryKey(Orders record) {
        return ordersMapper.updateByPrimaryKey(record);
    }

    @Override
    public int updateordera(Orders record) {
        return ordersMapper.updateordera(record);
    }

    @Override
    public int updateorderb(Orders record) {
        return ordersMapper.updateorderb(record);
    }

    @Override
    public int updateorder(Orders record) {
        return ordersMapper.updateorder(record);
    }

    @Override
    public List<Orders> queryOrdersPage(Orders orders, PageBean pageBean) {
        return ordersMapper.queryOrdersPage(orders);
    }

    @Override
    public int updatea(Orders record) {
        return ordersMapper.updatea(record);
    }

    @Override
    public int updateb(Orders record) {
        return ordersMapper.updateb(record);
    }

    @Override
    public int updatec(Orders record) {
        return ordersMapper.updatec(record);
    }

    @Override
    public List<Orders> queryOrderPage(Orders order, PageBean pageBean) {
        return ordersMapper.queryOrderPage(order);
    }

    @Override
    public int insertorderitem(OrderDetail orderDetail) {
        return ordersMapper.insertorderitem(orderDetail);
    }

    @Override
    public List<Integer> queryybtj(Orders date,String ks) {
        return ordersMapper.queryybtj(date,ks);
    }

    @Override
    public List<Map<String, Object>> queryxstj(Map<String, Object> xstj) {
        return ordersMapper.queryxstj(xstj);
    }

}
