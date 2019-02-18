package com.zking.basicInfo.controller;

import com.zking.basicInfo.model.Store;
import com.zking.basicInfo.model.Supplier;
import com.zking.basicInfo.service.IStoreService;
import com.zking.basicInfo.service.ISupplierService;
import com.zking.ssm.util.PageBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

@Controller
@RequestMapping("/store")
public class StoreController {

     @Autowired
    private IStoreService iStoreService;

     //查询
    @RequestMapping("/querystore")
    @ResponseBody
    public Map<String,Object> querySupplier(Store store, HttpServletRequest request,String lx){
        PageBean pageBean=new PageBean();
        pageBean.setRequest(request);
        if ("仓库".equals(lx)){
            List<Store> stores = iStoreService.queryStorePage(store, null);
            Map<String,Object> map=new HashMap<String,Object>();
            map.put("data",stores);
            return map;
        }
        else{
            List<Store> stores = iStoreService.queryStorePage(store, pageBean);
            Map<String,Object> map=new HashMap<String,Object>();
            map.put("data",stores);
            map.put("count",pageBean.getTotal());
            map.put("code",0);
            return map;
        }
    }
    @RequestMapping("/queryallstore")
    @ResponseBody
    public Map<String,Object> querystore(Store store){
        List<Store> stores = iStoreService.queryAllStore(store);
        Map<String,Object> map=new HashMap<String,Object>();
        map.put("data",stores);
        map.put("flg",true);
        map.put("message","修改成功");
        return map;

    }


    //增加
    @RequestMapping("/addstore")
    @ResponseBody
    public Map<String,Object> addSupplier(Store store ){
        store.setCreatedate(new Timestamp(System.currentTimeMillis()));
        store.setUuid(UUID.randomUUID().toString().replace("-","").trim());
        int insert = iStoreService.insert(store);
        Map<String,Object> map=new HashMap<String,Object>();
        map.put("flg",true);
        map.put("message","增加成功");
        return map;

    }


   //删除
    @RequestMapping("/delstore")
    @ResponseBody
    public Map<String,Object> delSupplier(Store store){

       iStoreService.deleteByPrimaryKey(store.getUuid());
        Map<String,Object> map=new HashMap<String,Object>();
        map.put("flg",true);
        map.put("message","删除成功");
        return map;

    }


    //修改
    @RequestMapping("/editstore")
    @ResponseBody
    public Map<String,Object> updateSupplier(Store store){

        iStoreService.updateByPrimaryKey(store);
        Map<String,Object> map=new HashMap<String,Object>();
        map.put("flg",true);
        map.put("message","修改成功");
        return map;

    }





}
