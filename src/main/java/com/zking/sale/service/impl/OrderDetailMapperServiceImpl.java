package com.zking.sale.service.impl;

import com.zking.sale.mapper.OrderDetailMapper;
import com.zking.sale.model.OrderDetail;
import com.zking.sale.service.IOrderDetailMapperService;
import com.zking.ssm.util.PageBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

@Transactional
@Service
public class OrderDetailMapperServiceImpl implements IOrderDetailMapperService {

    @Autowired
    private OrderDetailMapper orderDetailMapper;

    @Override
    public int deleteByPrimaryKey(String uuid) {
        return orderDetailMapper.deleteByPrimaryKey(uuid);
    }

    @Override
    public int insert(OrderDetail record) {
        return orderDetailMapper.insert1(record);
    }

    @Override
    public int insert1(OrderDetail record) {
        return orderDetailMapper.insert1(record);
    }

    @Override
    public OrderDetail selectByPrimaryKey(String uuid) {
        return orderDetailMapper.selectByPrimaryKey(uuid);
    }

    @Override
    public int updateByPrimaryKey(OrderDetail record) {
        return orderDetailMapper.updateByPrimaryKey(record);
    }

    @Override
    public List<Map<String, Object>> queryOrdersPage(OrderDetail orderDetail, PageBean pageBean) {
        return orderDetailMapper.queryOrdersPage(orderDetail);
    }

    @Override
    public List<OrderDetail> queryOrderDetailPage(OrderDetail orderDetail,PageBean pageBean) {
        return orderDetailMapper.queryOrderDetailPage(orderDetail);
    }
}
