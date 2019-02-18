package com.zking.ssm.controller;

import com.zking.personnel.model.Emp;
import com.zking.ssm.model.Module;
import com.zking.ssm.service.IModuleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.*;

@Controller
@RequestMapping(value = "Module")
public class ModelController {
    @Autowired
    private IModuleService moduleService;

    @RequestMapping("/queryModule")
    @ResponseBody
    public List<Module> queryModule(Module module, HttpServletRequest req){
        Emp user = (Emp)req.getSession().getAttribute("user");
        if(null!=user) {
            List<Module> modules = moduleService.queryModule(null);
            Set<String> set1 = new HashSet<String>();
            for (Module m : modules) {
                set1.add(m.getUrl());//将功能url加入set1集合中
            }
            List<Module> lst = new ArrayList<Module>();
            Set<String> set = new HashSet<String>();
            //根据用户ID查询用户对应的权限,并将权限保存到list2中
            List<Module> list2 = moduleService.queryUserModule(user.getUuid());
            //遍历用户所拥有的权限
            for (Module m : list2) {
                //将用户的权限添加到set集合中
                if(m.getPid()==module.getPid()) {
                    lst.add(m);
                }
                set.add(m.getUrl());
            }
            req.getServletContext().setAttribute("ModuleSet", set1);
            req.getSession().setAttribute("set", set);
            return lst;
        }
//        List<Module> modul = moduleService.queryModule(module);
        return null;
    }

    /**
     * 绑定zTree数据
     * @param module
     * @return
     */
    @RequestMapping("/zTree")
    @ResponseBody
    public List<Map<String,Object>> zTree(Module module){
        List<Module> modules = moduleService.queryModule(module);
        List<Map<String,Object>> lst = new ArrayList<Map<String, Object>>();
        Map<String,Object> map = null;
        for (Module m : modules) {
            map = new HashMap<String,Object>();
            map.put("id", m.getId());
            map.put("pId", m.getPid());
            map.put("name", m.getText());
            lst.add(map);
        }
        return lst;
    }








}
