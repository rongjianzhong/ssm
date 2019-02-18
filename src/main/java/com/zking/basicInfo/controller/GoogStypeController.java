package com.zking.basicInfo.controller;

import com.zking.basicInfo.model.GoodStype;
import com.zking.basicInfo.service.IGoodStypeService;
import com.zking.ssm.util.PageBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

@Controller
@RequestMapping("/goodStype")
public class GoogStypeController {
    @Autowired
    private IGoodStypeService goodStypeService;

    @RequestMapping("queryGoodStype")
    @ResponseBody
    public Map<String,Object> queryGoodStypePage(GoodStype goodStype, HttpServletRequest req,@RequestParam String lx){
        if("类型".equals(lx)){
            List<GoodStype> goodStypes = goodStypeService.queryGoodStypePage(goodStype,null);
            Map<String,Object> map = new HashMap<String, Object>();
            map.put("data",goodStypes);
            return map;
        }
        else{
            PageBean pageBean = new PageBean();
            pageBean.setRequest(req);
            List<GoodStype> goodStypes = goodStypeService.queryGoodStypePage(goodStype, pageBean);
            Map<String,Object> map = new HashMap<String, Object>();
            map.put("data",goodStypes);
            map.put("count",pageBean.getTotal());
            map.put("code",0);
            return map;
        }
    }
    @RequestMapping("addGoodStype")
    @ResponseBody
    public Map<String,Object> addGoodStype(GoodStype goodStype){
        int insert = goodStypeService.insert(goodStype);
        Map<String,Object> map = new HashMap<String, Object>();
        map.put("flg",true);
        map.put("message","增加成功");
        return map;
    }

    @RequestMapping("delGoodStype")
    @ResponseBody
    public Map<String,Object> delGoodStype(GoodStype goodStype){
        goodStypeService.deleteByPrimaryKey(goodStype.getUuid()+"");
        Map<String,Object> map = new HashMap<String, Object>();
        map.put("flg",true);
        map.put("message","删除成功");
        return map;
    }

    @RequestMapping("editGoodStype")
    @ResponseBody
    public Map<String,Object> editGoodStype(GoodStype goodStype){
        goodStypeService.updateByPrimaryKey(goodStype);
        Map<String,Object> map = new HashMap<String, Object>();
        map.put("flg",true);
        map.put("message","修改成功");
        return map;
    }



}
