package com.zking.basicInfo.controller;

import com.zking.basicInfo.model.GoodStype;
import com.zking.basicInfo.model.Goods;
import com.zking.basicInfo.service.IGoodsService;
import com.zking.ssm.util.PageBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.sql.Timestamp;
import java.util.*;

@Controller
@RequestMapping("/goods")
public class GoodsController {

     @Autowired
    private IGoodsService iGoodsService;

     //查询
    @RequestMapping("/queryGoods")
    @ResponseBody
    public Map<String,Object> queryGoods(Goods goods, HttpServletRequest req,String lx){
        PageBean pageBean=new PageBean();
        pageBean.setRequest(req);
        if("商品".equals(lx)){
            List<Goods> selectgoods = iGoodsService.querygoodsPage(goods,null);
            Map<String,Object> map=new HashMap<String,Object>();
            map.put("data",selectgoods);
            return map;
        }
        else{
            List<Goods> selectgoods = iGoodsService.querygoodsPage(goods,pageBean);
            Map<String,Object> map=new HashMap<String,Object>();
            map.put("data",selectgoods);
            map.put("count",pageBean.getTotal());
            map.put("code",0);
            return map;
        }
    }


    //增加
    @RequestMapping("/addGoods")
    @ResponseBody
    public Map<String,Object> addGoods(Goods goods){
        Map<String,Object> map=new HashMap<String,Object>();
        goods.setUuid(UUID.randomUUID().toString().replace("-","").trim());
        goods.setCreatedate(new Timestamp(System.currentTimeMillis()));
        Goods goods1 = iGoodsService.selectByPrimaryKey(goods.getName());
        if(null!=goods1){
            map.put("flg",true);
            map.put("message","商品列表已经有此商品了");
            return map;
        }
        else {
            int insert = iGoodsService.insert(goods);
            map.put("flg",true);
            map.put("message","增加成功");
            return map;
        }
    }

   //删除
    @RequestMapping("/delGoods")
    @ResponseBody
    public Map<String,Object> delGoods(Goods goods) {
        iGoodsService.deleteByPrimaryKey(goods.getUuid());
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("flg", true);
        map.put("message", "删除成功");
        return map;
    }


    //修改
    @RequestMapping("/editGoods")
    @ResponseBody
    public Map<String,Object> updateGoods(Goods goods){

        int insert = iGoodsService.updateByPrimaryKey(goods);
        Map<String,Object> map=new HashMap<String,Object>();
        map.put("flg",true);
        map.put("message","修改成功");
        return map;

    }


    //查询所有供应商
    @RequestMapping("/queryall")
    @ResponseBody
    public Map<String,Object> queryGoods(Goods goods){
        List<Goods> selectgoods = iGoodsService.querygall(goods);
        System.out.println(selectgoods);
        Map<String,Object> map=new HashMap<String,Object>();
        map.put("data",selectgoods);

        return map;
    }

    //查询所有要增加的商品
    @RequestMapping("/querymap")
    @ResponseBody
    public Map<String,Object> querymap(HttpServletRequest req){
        PageBean pageBean = new PageBean();
        pageBean.setRequest(req);
        List<Map<String, Object>> quermap = iGoodsService.quermap(pageBean);
        Map<String,Object> map=new HashMap<String,Object>();
        map.put("code",0);
        map.put("count",pageBean.getTotal());
        map.put("data",quermap);
        return map;
    }


    //连表查询仓库表的数据
    @RequestMapping("/queryGoodsa")
    @ResponseBody
    public Map<String,Object> queryGoodsa(HttpServletRequest req){
        PageBean pageBean = new PageBean();
        pageBean.setRequest(req);
        List<Goods> goods = iGoodsService.queryGoods(pageBean);
        Map<String,Object> map=new HashMap<String,Object>();
        map.put("code",0);
        map.put("count",pageBean.getTotal());
        map.put("data",goods);
        return map;
    }




}
