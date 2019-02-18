package com.zking.ssm.controller;

import com.zking.basicInfo.model.GoodStype;
import com.zking.basicInfo.model.Goods;
import com.zking.ssm.model.SysRole;
import com.zking.ssm.model.SysRolePermission;
import com.zking.ssm.model.SysUserRole;
import com.zking.ssm.service.ISysRoleService;
import com.zking.ssm.util.PageBean;
import com.zking.ssm.vo.SysVo;
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
@RequestMapping("sysRole")
public class SysRoleController {
    @Autowired
    private ISysRoleService sysRoleService;
    @RequestMapping("querySysRole")
    @ResponseBody
    public Map<String,Object> queryGoodStypePage(SysRole sysRole, HttpServletRequest req,String lx){
        if ("用户角色".equals(lx)){
            List<SysRole> sysRoles = sysRoleService.querySysRolePage(sysRole, null);
            Map<String,Object> map = new HashMap<String, Object>();
            map.put("data",sysRoles);
            return map;
        }
        else{
            PageBean pageBean = new PageBean();
            pageBean.setRequest(req);
            List<SysRole> sysRoles = sysRoleService.querySysRolePage(sysRole, pageBean);
            Map<String,Object> map = new HashMap<String, Object>();
            map.put("data",sysRoles);
            map.put("count",pageBean.getTotal());
            map.put("code",0);
            return map;
        }
    }

    @RequestMapping("addSysRole")
    @ResponseBody
    public Map<String,Object> addSysRole(SysRole sysRole){
        sysRoleService.insert(sysRole);
        Map<String,Object> map=new HashMap<String,Object>();
        map.put("flg",true);
        map.put("message","增加成功");
        return map;
    }

    @RequestMapping("delSysRole")
    @ResponseBody
    public Map<String,Object> delSysRole(SysRole sysRole){
        sysRoleService.deleteByPrimaryKey(sysRole.getRoleid());
        Map<String,Object> map=new HashMap<String,Object>();
        map.put("flg",true);
        map.put("message","删除成功");
        return map;
    }

    @RequestMapping("editSysRole")
    @ResponseBody
    public Map<String,Object> editSysRole(SysRole sysRole){
        sysRoleService.updateByPrimaryKey(sysRole);
        Map<String,Object> map=new HashMap<String,Object>();
        map.put("flg",true);
        map.put("message","修改成功");
        return map;
    }
    //保存角色信息
    @RequestMapping("saveRole")
    @ResponseBody
    public Map<String,Object> saveRole(SysVo sysVo){
        sysRoleService.insertSysRolePermission(sysVo);
        Map<String,Object> map=new HashMap<String,Object>();
        map.put("flg",true);
        return map;
    }

    @RequestMapping("queryRolePermission")
    @ResponseBody
    public List<SysRolePermission> queryRolePermission(SysRolePermission sysRolePermission){
        List<SysRolePermission> sysRolePermissions = sysRoleService.queryRolePermission(sysRolePermission);
        return sysRolePermissions;
    }

    @RequestMapping("addSysUserRole")
    @ResponseBody
    public Map<String,Object> addSysRole(SysUserRole sysUserRole){
        sysRoleService.insertUserRole(sysUserRole);
        Map<String,Object> map=new HashMap<String,Object>();
        map.put("message","修改成功");
        return map;
    }





}
