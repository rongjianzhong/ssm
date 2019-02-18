package com.zking.sale.controller;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.zking.personnel.model.Emp;
import com.zking.sale.model.OrderDetail;
import com.zking.sale.model.Orders;
import com.zking.sale.service.IOrderDetailMapperService;
import com.zking.sale.service.IOrdersMapperService;
import com.zking.ssm.util.PageBean;
import com.zking.warehouse.model.Storedetail;
import com.zking.warehouse.model.Storeoper;
import com.zking.warehouse.service.IStoredetailService;
import com.zking.warehouse.service.IStoreoperService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.*;

@Controller
@RequestMapping("/order")
public class OrdersController {

    @Autowired
    private IOrdersMapperService ordersMapperService;
    @Autowired
    private IOrderDetailMapperService orderDetailMapperService;
    @Autowired
    private IStoredetailService storedetailService;
    @Autowired
    private IStoreoperService iStoreoperService;

    //采购
    private  List<Map<String,Object>> lst;

    //查询
    @RequestMapping("/queryOrders")
    @ResponseBody
    public Map<String,Object> queryorders(Orders orders, HttpServletRequest req){
        PageBean pageBean=new PageBean();
        pageBean.setRequest(req);
        List<Orders> maps = ordersMapperService.queryOrdersPage(orders, pageBean);
        Map<String,Object> map=new HashMap<String,Object>();
        map.put("data",maps);
        map.put("count",pageBean.getTotal());
        map.put("code",0);
        return map;
    }

    //增加订单
    @RequestMapping("/addOrders")
    @ResponseBody
    public Map<String,Object> addOrders(Orders order,String items,String supplieruuid,HttpServletRequest req) throws  Exception{
        Emp user = (Emp) req.getSession().getAttribute("user");
        ObjectMapper mapper = new ObjectMapper();
        lst = mapper.readValue(items, new TypeReference<List<Map<String,Object>>>() {});
        //总金额
        float suma=0;
        for (Map<String, Object> map : lst) {
            suma+=Float.parseFloat(map.get("money").toString());
        }
        //增加订单
        //订单id
        order.setUuid(UUID.randomUUID().toString().replace("-","").trim());
        //创建时间
        order.setCreatetime(new Timestamp(System.currentTimeMillis()));
        //创建人（登陆的人）
        order.setCreater(user.getName());
        //供应商（下拉框）
        order.setSupplieruuid(supplieruuid);
        //类型
        order.setType("2");
        //总金额
        order.setTotalmoney(suma);
        //状态
        order.setState("3");
        int insert = ordersMapperService.insert(order);
        //增加订单项
        OrderDetail orderDetail = new OrderDetail();
        for (Map<String, Object> map : lst) {
            orderDetail.setUuid(UUID.randomUUID().toString().replace("-","").trim());
            orderDetail.setOrdersuuid(order.getUuid());
            orderDetail.setGoodsuuid(map.get("uuid").toString());
            orderDetail.setGoodsname(map.get("name").toString());
            orderDetail.setNum(Integer.parseInt(map.get("count").toString()));
            orderDetail.setMoney(Float.parseFloat(map.get("money").toString()));
            orderDetail.setPrice(Float.parseFloat(map.get("outprice").toString()));
            int insert1 = orderDetailMapperService.insert1(orderDetail);
        }
        Map<String,Object> map=new HashMap<String,Object>();
        map.put("flg",true);
        map.put("message","增加成功");
        return map;
    }

    //销售出库
    @RequestMapping("/updateorders")
    @ResponseBody
    public Map<String,Object> updateorders(Orders record,String item,HttpServletRequest req) throws IOException {
        Emp user = (Emp) req.getSession().getAttribute("user");
        ObjectMapper mapper = new ObjectMapper();
        Storedetail storedetail = new Storedetail();//仓库库存
        Storeoper storeoper = new Storeoper();//库存记录
        //遍历订单项减仓库对应的库存数量
        List<Map<String,Object>> lst = mapper.readValue(item, new TypeReference<List<Map<String,Object>>>() {});
        for (Map<String, Object> l : lst) {
            //执行减少库存数量方法
            storedetail.setGoodsuuid(l.get("goodsname").toString());
            Storedetail storedetail1 = storedetailService.selectByPrimaryKey(storedetail.getGoodsuuid());//先查询对应商品的数量
            if(null!=storedetail1){
                storedetail.setNum(storedetail1.getNum()-Integer.parseInt(l.get("num").toString()));//得到数据库的数量减去购买的数量
                storedetailService.updateStoretai(storedetail);//执行减库存数量方法
            }
            //执行库存操作记录方法
            storeoper.setUuid(UUID.randomUUID().toString().trim().replace("-",""));
            storeoper.setType("2");//状态1为入库 2为出库
            storeoper.setOpertime(new Timestamp(System.currentTimeMillis()));
            storeoper.setGoodsuuid(l.get("goodsname").toString());
            storeoper.setNum(Integer.parseInt(l.get("num").toString()));
            storeoper.setEmpuuid(user.getName());//从session中获取当前登录的用户
            storeoper.setStoreuuid("食品仓库");
            iStoreoperService.insert(storeoper);
        }
        //确认时间
        record.setStarttime(new Timestamp(System.currentTimeMillis()));
        //确认人
        record.setStarter(user.getName());
        record.setState("4");
        ordersMapperService.updateorder(record);
        Map<String,Object> map=new HashMap<String, Object>();
        map.put("flg",true);
        map.put("message","出库成功");
        return map;
    }

    //销售退货申请
    @RequestMapping("/Salesreturn")
    @ResponseBody
    public Map<String,Object> Salesreturn(Orders record,HttpServletRequest req){
        Emp user = (Emp) req.getSession().getAttribute("user");
        //审核人（从session中获取当前登录用户）
        record.setChecker(user.getName());
        //审查时间
        record.setChecktime(new Timestamp(System.currentTimeMillis()));
        record.setState("6");
        ordersMapperService.updateByPrimaryKey(record);
        Map<String,Object> map=new HashMap<String, Object>();
        map.put("flg",true);
        map.put("message","申请成功，等待审核");
        return map;
    }

    //销售退货审核同意
    @RequestMapping("/Salesreturna")
    @ResponseBody
    public Map<String,Object> Salesreturna(Orders record,String item,HttpServletRequest req) throws IOException {
        Emp user = (Emp) req.getSession().getAttribute("user");
        ObjectMapper mapper = new ObjectMapper();
        Storedetail storedetail = new Storedetail();//仓库库存
        Storeoper storeoper = new Storeoper();//库存记录
        //遍历订单项加仓库对应的库存数量
        List<Map<String,Object>> lst = mapper.readValue(item, new TypeReference<List<Map<String,Object>>>() {});
        for (Map<String, Object> l : lst) {
            //执行加库存数量方法
            storedetail.setGoodsuuid(l.get("goodsname").toString());
            Storedetail storedetail1 = storedetailService.selectByPrimaryKey(storedetail.getGoodsuuid());//先查询对应商品的数量
            if(null!=storedetail1){
                storedetail.setNum(storedetail1.getNum()+Integer.parseInt(l.get("num").toString()));//得到数据库的数量减去购买的数量
                storedetailService.updateStoretai(storedetail);//执行加库存数量方法
            }
            //执行库存操作记录方法
            storeoper.setUuid(UUID.randomUUID().toString().trim().replace("-",""));
            storeoper.setType("3");//状态1为入库 2为出库 3为退货入库
            storeoper.setOpertime(new Timestamp(System.currentTimeMillis()));
            storeoper.setGoodsuuid(l.get("goodsname").toString());
            storeoper.setNum(Integer.parseInt(l.get("num").toString()));
            storeoper.setEmpuuid(user.getName());//从session中获取当前登录的用户
            storeoper.setStoreuuid("食品仓库");
            iStoreoperService.insert(storeoper);
        }
        record.setStarttime(new Timestamp(System.currentTimeMillis()));
        record.setStarter(user.getName());
        //结束
        record.setEndtime(new Timestamp(System.currentTimeMillis()));
        record.setEnder(user.getName());
        //修改订单状态
        record.setState("7");
        ordersMapperService.updateordera(record);
        Map<String,Object> map=new HashMap<String, Object>();
        map.put("flg",true);
        map.put("message","出库成功");
        return map;
    }




    //查询订单的方法
    @RequestMapping("/queryorder")
    @ResponseBody
    public Map<String,Object> queryGoods(Orders order, HttpServletRequest request){
        PageBean pageBean=new PageBean();
        pageBean.setRequest(request);
        List<Orders> orders = ordersMapperService.queryOrderPage(order, pageBean);
        Map<String,Object> map=new HashMap<String,Object>();
        map.put("data",orders);
        map.put("count",pageBean.getTotal());
        map.put("code",0);
        return map;
    }

    //增加订单
    @RequestMapping("/addorder")
    @ResponseBody
    public Map<String, Object> addorder(Orders order, OrderDetail orderDetail,String data,String supplieruuid,HttpServletRequest req) throws Exception{
        Emp user = (Emp) req.getSession().getAttribute("user");
        ObjectMapper mapper = new ObjectMapper();
        lst = mapper.readValue(data, new TypeReference<List<Map<String,Object>>>() {});
        //总金额
        float sum=0;
        for (Map<String, Object> map : lst) {
            sum+=Float.parseFloat(map.get("money").toString());
        }
        //增加订单
        //订单id
        order.setUuid(UUID.randomUUID().toString().replace("-","").trim());
        //创建时间
        order.setCreatetime(new Timestamp(System.currentTimeMillis()));
        //创建人（登陆的人）
        order.setCreater(user.getName());
        //供应商（下拉框）
        order.setSupplieruuid(supplieruuid);
        //总金额
        order.setTotalmoney(sum);
        //状态
        order.setState("1");
        //类型 1为采购 2为销售
        order.setType("1");

        int insert = ordersMapperService.insert(order);

        lst = mapper.readValue(data, new TypeReference<List<Map<String,Object>>>() {});

        for (Map<String, Object> map : lst) {
            orderDetail.setUuid(UUID.randomUUID().toString().replace("-","").trim());
            orderDetail.setOrdersuuid(order.getUuid());
            orderDetail.setState("1");

            orderDetail.setEndtime(new Timestamp(System.currentTimeMillis()));
            orderDetail.setGoodsuuid(map.get("uuid")+"");
            orderDetail.setGoodsname(map.get("name")+"");
            orderDetail.setMoney(Float.parseFloat(map.get("money").toString()));
            orderDetail.setNum(Integer.parseInt(map.get("COUNT").toString()));
            orderDetail.setPrice(Float.parseFloat(map.get("outprice").toString()));
            int insertorderitem = ordersMapperService.insertorderitem(orderDetail);
        }

        Map<String,Object> map=new HashMap<String,Object>();
        map.put("flg",true);
        map.put("message","增加成功");
        return map;
    }

    //修改（审查的）
    @RequestMapping("/updatecheck")
    @ResponseBody
    public Map<String,Object> updateGoods(Orders order,String uuid,HttpServletRequest req){
        Emp user = (Emp) req.getSession().getAttribute("user");
        order.setUuid(uuid);
        order.setState("2");
        //审核人（从session中获取当前登录用户）
        order.setChecker(user.getName());
        //审查时间
        order.setChecktime(new Timestamp(System.currentTimeMillis()));
        int insert = ordersMapperService.updateByPrimaryKey(order);
        Map<String,Object> map=new HashMap<String,Object>();
        map.put("flg",true);
        map.put("message","审核成功");
        return map;
    }
    //修改（确认的，入库）
    @RequestMapping("/updatecheck1")
    @ResponseBody
    public Map<String,Object> updateaa(Orders order, String uuid, String data, Storedetail storedetail, OrderDetail orderDetail, Storeoper storeoper,HttpServletRequest req,String store) throws Exception{
        Emp user = (Emp) req.getSession().getAttribute("user");
        ObjectMapper mapper = new ObjectMapper();
        lst = mapper.readValue(data, new TypeReference<List<Map<String,Object>>>() {});
        for (Map<String, Object> l : lst) {
            //先查询所有库存
            Storedetail storedetail1 = storedetailService.selectByPrimaryKey(l.get("goodsname").toString());
            if(null!=storedetail1){
                //如果有数据就在原来的数据中修改数量
                //数量(原来的数量+现在的)
                storedetail.setNum(storedetail1.getNum()+Integer.parseInt(l.get("num").toString()));
                storedetail.setGoodsuuid(l.get("goodsname").toString());
                int update = storedetailService.update(storedetail);
            }
            else{
                //编号
                storedetail.setUuid(UUID.randomUUID().toString().replace("-",""));
                storedetail.setGoodsuuid(l.get("goodsname")+"");
                //数量
                storedetail.setNum(Integer.parseInt(l.get("num").toString()));
                //仓库id
                storedetail.setStoreuuid(store);
                //调用增加的方法
                storedetailService.insert(storedetail);
            }
        }
        //确认人（开始人）
        order.setStarter(user.getName());
        //结束人
        order.setEnder(user.getName());
        //开始时间
        order.setStarttime(new Timestamp(System.currentTimeMillis()));
        //结束时间
        order.setEndtime(new Timestamp(System.currentTimeMillis()));
        order.setUuid(uuid);
        //修改订单已入库
        int insert = ordersMapperService.updatea(order);

        //修改订单项为已入库
        for (Map<String, Object> map : lst) {
            orderDetail.setUuid(map.get("uuid")+"");
            orderDetail.setState("2");
            orderDetailMapperService.updateByPrimaryKey(orderDetail);
        }
        //增加记录
        for (Map<String, Object> map : lst) {
            //编号
            storeoper.setUuid(UUID.randomUUID().toString().replace("-",""));
            //员工id
            storeoper.setEmpuuid(user.getName());
            //操作时间
            storeoper.setOpertime(new Timestamp(System.currentTimeMillis()));
            //仓库
            storeoper.setStoreuuid("2");
            //商品名称
            storeoper.setGoodsuuid(map.get("goodsname")+"");
            //数量
            storeoper.setNum(Integer.parseInt(map.get("num").toString()));
            //类型
            storeoper.setType("1");
            System.out.println(storeoper);

            int inserta=iStoreoperService.insert(storeoper);
        }
        Map<String,Object> map=new HashMap<String,Object>();
        map.put("flg",true);
        map.put("message","修改成功");
        return map;
    }


    //修改（放弃采购）
    @RequestMapping("/updatecheck2")
    @ResponseBody
    public Map<String,Object> updateab(Orders order,String uuid){
        order.setUuid(uuid);
        int insert = ordersMapperService.updateb(order);
        Map<String,Object> map=new HashMap<String,Object>();
        map.put("flg",true);
        map.put("message","修改成功");
        return map;
    }


    //修改（结束采购）
    @RequestMapping("/updatecheck3")
    @ResponseBody
    public Map<String,Object> updatea(Orders order,String uuid){
        order.setUuid(uuid);
        int insert = ordersMapperService.updatec(order);
        Map<String,Object> map=new HashMap<String,Object>();
        map.put("flg",true);
        map.put("message","修改成功");
        return map;

    }


    //统计
    //全部商品销售额
    @RequestMapping("/queryybtj")
    @ResponseBody
    public Map<String,Object> queryybtj(Orders orders,String ks){
        List<Integer> queryybtj = ordersMapperService.queryybtj(orders,ks);
        Map<String,Object> map=new HashMap<String,Object>();
        map.put("name","全部商品");
        map.put("data",queryybtj);
        map.put("code",0);
        return map;
    }

    //统计表格查询
    @RequestMapping("/querybgtj")
    @ResponseBody
    public Map<String,Object> querybgtj(Orders orders,String ks){
        List<Map<String,Object>> maps=new ArrayList<Map<String,Object>>();
        List<Integer> queryybtj = ordersMapperService.queryybtj(orders,ks);
        int i=1;
        for (Integer integer : queryybtj) {
            Map<String,Object> map = new HashMap<>();
            map.put("month",i+"月");
            map.put("money",integer);
            maps.add(map);
            i++;
        }
        Map<String,Object> map=new HashMap<String,Object>();
        map.put("data",maps);
        map.put("code",0);
        return map;
    }

    //商品类型销售额
    @RequestMapping("/queryxstj")
    @ResponseBody
    public Map<String,Object> queryxstj(Map<String,Object> xstj){

        List<Map<String, Object>> queryxstj = ordersMapperService.queryxstj(xstj);
        List<Map<String, Object>> lst = new ArrayList<Map<String, Object>>();
        Map<String,Object> m = new HashMap<String, Object>();

        Map<String,Object> map=new HashMap<String,Object>();

        List<Map<String, Object>> root = new ArrayList<>();
        Map<String,Object> mac=new HashMap<String,Object>();

        float sum = 0 ;
        for (Map<String, Object> stringObjectMap : queryxstj) {
            sum = sum + (float)stringObjectMap.get("totalmoney");
        }
        for (Map<String, Object> stringObjectMap : queryxstj) {
            mac=new HashMap<String,Object>();
            mac.put("y",(float)stringObjectMap.get("totalmoney")/sum) ;
            mac.put("name",stringObjectMap.get("name")) ;
            root.add(mac);
        }

        map.put("data",queryxstj);
        map.put("ljga",root);
        map.put("code",0);
        return map;
    }


















}
