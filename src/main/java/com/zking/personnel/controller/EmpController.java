package com.zking.personnel.controller;

import com.zking.personnel.model.Emp;
import com.zking.personnel.service.IEmpService;
import com.zking.ssm.util.PageBean;
import com.zking.ssm.vo.EmpVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.*;

@Controller
@RequestMapping("/emp")
public class EmpController {
    @Autowired
    private IEmpService empService;
    @RequestMapping("queryEmp")
    @ResponseBody
    public Map<String,Object> queryEmp(EmpVo emp, HttpServletRequest req){
        if ("仓库部".equals(emp.getUuid())){
            List<Emp> emps = empService.querEmpPage(emp, null);
            Map<String,Object> map = new HashMap<String, Object>();
            map.put("data",emps);
            return map;
        }
        else{
            PageBean pageBean = new PageBean();
            pageBean.setRequest(req);
            List<Emp> emps = empService.querEmpPage(emp, pageBean);
            Map<String,Object> map = new HashMap<String, Object>();
            map.put("data",emps);
            map.put("count",pageBean.getTotal());
            map.put("code",0);
            return map;
        }
    }
    @RequestMapping("querydep")
    @ResponseBody
    public Map<String,Object> queryEmp(Emp emp){
        List<Emp> querydep = empService.querydep(emp);
        Map<String,Object> map = new HashMap<String, Object>();
        map.put("data",querydep);
        return map;
    }

    @RequestMapping("queryEmpa")
    @ResponseBody
    public Map<String,Object> queryEmpa(Emp emp){
        List<Emp> querydep = empService.queryemp(emp);
        Map<String,Object> map = new HashMap<String, Object>();
        map.put("data",querydep);
        return map;
    }

    @RequestMapping("addEmp")
    @ResponseBody
    public Map<String,Object> addEmp(Emp emp){
        emp.setBirthday(new Date());
        String id= UUID.randomUUID().toString().replace("-","");
        emp.setUuid(id);
        empService.insert(emp);
        Map<String,Object> map=new HashMap<String,Object>();
        map.put("flg",true);
        map.put("message","增加成功");
        return map;
    }
    @RequestMapping("delEmp")
    @ResponseBody
    public Map<String,Object> delEmp(Emp emp) {
        empService.deleteByPrimaryKey(emp.getUuid());
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("flg", true);
        map.put("message", "删除成功");
        return map;
    }

    @RequestMapping("editEmp")
    @ResponseBody
    public Map<String,Object> editEmp(Emp emp) {
        empService.updateByPrimaryKey(emp);
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("flg", true);
        map.put("message", "修改成功");
        return map;
    }
}
