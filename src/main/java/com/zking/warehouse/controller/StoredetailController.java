package com.zking.warehouse.controller;

import com.zking.personnel.model.Dep;
import com.zking.ssm.util.PageBean;
import com.zking.warehouse.model.Storedetail;
import com.zking.warehouse.service.IStoredetailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/storedetail")
public class StoredetailController {
    @Autowired
    private IStoredetailService iStoredetailService;

    @RequestMapping("/querystoredetail")
    @ResponseBody
    public Map<String,Object> queryDep(Storedetail storedetail, HttpServletRequest req){
        PageBean pageBean=new PageBean();
        pageBean.setRequest(req);
        List<Storedetail> storedetails = iStoredetailService.queryStoredetailPage(storedetail, pageBean);
        Map<String,Object> map=new HashMap<String,Object>();
        map.put("data",storedetails);
        map.put("count",pageBean.getTotal());
        map.put("code",0);
        return map;
    }
}
