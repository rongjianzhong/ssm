package com.zking.personnel.controller;

import com.zking.personnel.model.Dep;
import com.zking.personnel.service.IDepMapperService;
import com.zking.ssm.util.PageBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

@Controller
@RequestMapping("/dep")
public class DepController {

    @Autowired
    private IDepMapperService depMapperService;

    @RequestMapping("/queryDep")
    @ResponseBody
    public Map<String,Object> queryDep(Dep dep, HttpServletRequest req,String lx){
        if ("部门".equals(lx)){
            List<Dep> deps = depMapperService.queryGoodStypePage(dep, null);
            Map<String,Object> map=new HashMap<String,Object>();
            map.put("data",deps);
            return map;
        }
        else{
            PageBean pageBean=new PageBean();
            pageBean.setRequest(req);
            List<Dep> deps = depMapperService.queryGoodStypePage(dep, pageBean);
            Map<String,Object> map=new HashMap<String,Object>();
            map.put("data",deps);
            map.put("count",pageBean.getTotal());
            map.put("code",0);
            return map;
        }
    }

    @RequestMapping("/addDep")
    @ResponseBody
    public Map<String,Object> addDep(Dep dep){
        String Id= UUID.randomUUID().toString().replace("-","");
        dep.setUuid(Id);
        int insert = depMapperService.insert(dep);
        Map<String,Object> map=new HashMap<String,Object>();
        map.put("flg",true);
        map.put("message","增加成功");
        return map;
    }

    @RequestMapping("/delDep")
    @ResponseBody
    public Map<String,Object> delDep(Dep dep){
        int i = depMapperService.deleteByPrimaryKey(dep.getUuid()+"");
        Map<String,Object> map=new HashMap<String,Object>();
        map.put("flg",true);
        map.put("message","删除成功");
        return map;
    }

    @RequestMapping("/editDep")
    @ResponseBody
    public Map<String,Object> editDep(Dep dep){
        System.out.println(dep);
        depMapperService.updateByPrimaryKey(dep);
        Map<String,Object> map=new HashMap<String,Object>();
        map.put("flg",true);
        map.put("message","修改成功");
        return map;
    }



}
