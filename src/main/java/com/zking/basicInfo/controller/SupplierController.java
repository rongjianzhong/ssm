package com.zking.basicInfo.controller;

import com.zking.basicInfo.model.Goods;
import com.zking.basicInfo.model.Supplier;
import com.zking.basicInfo.service.IGoodsService;
import com.zking.basicInfo.service.ISupplierService;
import com.zking.ssm.util.PageBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

@Controller
@RequestMapping("/supplier")
public class SupplierController {

     @Autowired
    private ISupplierService iSupplierService;

     //查询
    @RequestMapping("/querySupplier")
    @ResponseBody
    public Map<String,Object> querySupplier(Supplier supplier, HttpServletRequest request, String lx){
        if("供应商".equals(supplier.getType())){
            System.out.println(lx);
            if ("供应商".equals(lx)){
                List<Supplier> suppliers = iSupplierService.querySupplierPage(supplier, null);
                Map<String,Object> map=new HashMap<String,Object>();
                map.put("data",suppliers);
                return map;
            }
            else{
                supplier.setType("供应商");
            }
        }
        else{
            supplier.setType("客户");
        }
        PageBean pageBean=new PageBean();
        pageBean.setRequest(request);
        List<Supplier> suppliers = iSupplierService.querySupplierPage(supplier, pageBean);
        Map<String,Object> map=new HashMap<String,Object>();
        map.put("data",suppliers);
        map.put("count",pageBean.getTotal());
        map.put("code",0);
        return map;
    }


    //增加
    @RequestMapping("/addSupplier")
    @ResponseBody
    public Map<String,Object> addSupplier(Supplier supplier){
        if("供应商".equals(supplier.getType())){
            supplier.setType("供应商");
        }
        else{
            supplier.setType("客户");
        }
        supplier.setCreatedate(new Timestamp(System.currentTimeMillis()));
        supplier.setUuid(UUID.randomUUID().toString().replace("-","").trim());
        int insert = iSupplierService.insert(supplier);
        Map<String,Object> map=new HashMap<String,Object>();
        map.put("flg",true);
        map.put("message","增加成功");
        return map;
    }


   //删除
    @RequestMapping("/delSupplier")
    @ResponseBody
    public Map<String,Object> delSupplier(Supplier supplier) {
        iSupplierService.deleteByPrimaryKey(supplier.getUuid());
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("flg", true);
        map.put("message", "删除成功");
        return map;
    }


    //修改
    @RequestMapping("/editSupplier")
    @ResponseBody
    public Map<String,Object> updateSupplier(Supplier supplier){
        if("供应商".equals(supplier.getType())) {
            supplier.setType("供应商");
        }
        else{
            supplier.setType("客户");
        }
        int insert = iSupplierService.updateByPrimaryKey(supplier);
        Map<String,Object> map=new HashMap<String,Object>();
        map.put("flg",true);
        map.put("message","修改成功");
        return map;
    }

    //查询名字
    @RequestMapping("/selectByname")
    @ResponseBody
    public List<Supplier> selectByname(){
        List<Supplier> suppliers = iSupplierService.queryByname();
        return suppliers;
    }


}
