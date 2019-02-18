package com.zking.warehouse.controller;

import com.zking.basicInfo.service.IStoreService;
import com.zking.ssm.util.PageBean;
import com.zking.ssm.vo.StoreperVo;
import com.zking.warehouse.model.Storedetail;
import com.zking.warehouse.model.Storeoper;
import com.zking.warehouse.service.IStoreoperService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/storeoper")
public class StoreperController {
    @Autowired
    private IStoreoperService storedetails;

    @RequestMapping("/queryStoreoper")
    @ResponseBody
    public Map<String,Object> queryDep(StoreperVo storeoper, HttpServletRequest req){
        PageBean pageBean=new PageBean();
        pageBean.setRequest(req);
        List<StoreperVo> storeopers = storedetails.queryStoreoperPage(storeoper, pageBean);
        Map<String,Object> map=new HashMap<String,Object>();
        map.put("data",storeopers);
        map.put("count",pageBean.getTotal());
        map.put("code",0);
        return map;
    }
}
