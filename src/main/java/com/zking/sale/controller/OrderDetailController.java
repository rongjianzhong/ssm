package com.zking.sale.controller;

import com.zking.sale.model.OrderDetail;
import com.zking.sale.service.IOrderDetailMapperService;
import com.zking.sale.service.IOrdersMapperService;
import com.zking.ssm.util.PageBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/orderdetail")
public class OrderDetailController {

    @Autowired
    private IOrderDetailMapperService orderDetailMapperService;

    @RequestMapping("/addOrdersDetail")
    @ResponseBody
    public Map<String,Object> addOrdersDetail(OrderDetail orderDetail){
        int insert = orderDetailMapperService.insert(orderDetail);
        Map<String,Object> map=new HashMap<String,Object>();
        map.put("flg",true);
        map.put("message","增加成功");
        return map;
    }

    @RequestMapping("/queryOrdersdetail")
    @ResponseBody
    public Map<String,Object> queryOrdersdetail(OrderDetail orderDetail,HttpServletRequest req,String sa){
        PageBean pageBean=new PageBean();
        pageBean.setRequest(req);
        orderDetail.setOrdersuuid(sa);
        System.out.println(orderDetail.getOrdersuuid());
        List<Map<String, Object>> maps = orderDetailMapperService.queryOrdersPage(orderDetail, pageBean);
        Map<String,Object> map=new HashMap<String,Object>();
        map.put("data",maps);
        map.put("count",pageBean.getTotal());
        map.put("code",0);
        return map;
    }

    //查询订单的方法
    @RequestMapping("/queryorderdetail")
    @ResponseBody
    public Map<String,Object> queryGoods(OrderDetail orderDetail, HttpServletRequest request){
        PageBean pageBean=new PageBean();
        pageBean.setRequest(request);
        List<OrderDetail> orderDetails = orderDetailMapperService.queryOrderDetailPage(orderDetail, pageBean);
        Map<String,Object> map=new HashMap<String,Object>();
        map.put("data",orderDetails);
        map.put("count",pageBean.getTotal());
        map.put("code",0);
        return map;
    }

}
