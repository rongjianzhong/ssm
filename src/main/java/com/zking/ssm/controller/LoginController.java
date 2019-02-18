package com.zking.ssm.controller;

import com.zking.personnel.model.Emp;
import com.zking.personnel.service.IEmpService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/user")
public class LoginController {
    @Autowired
    private IEmpService empService;

    @RequestMapping("/login")
    @ResponseBody
    public Map<String,Object> login(String username,String pwd,HttpServletRequest req){
        Emp emp = new Emp();
        emp.setUsername(username);
        emp.setPwd(pwd);
        Map<String,Object> map = new HashMap<String, Object>();
        Emp emp1 = empService.selectByPrimaryKey(emp);
        req.getSession().setAttribute("user",emp1);
        Object user = req.getSession().getAttribute("user");
        if(null!=emp1){
            map.put("success",true);
        }
        return map;
    }

    @RequestMapping("/loginout")
    public String loginout(HttpServletRequest req){
        req.getSession().invalidate();
        return "login";
    }
    @RequestMapping("/index")
    public String index(HttpServletRequest req){
        return "layui";
    }

}
