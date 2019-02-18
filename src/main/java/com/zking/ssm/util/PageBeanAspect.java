package com.zking.ssm.util;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
@Aspect
public class PageBeanAspect{
    @Around("execution(* *..*Service.*Page(..))")
    public Object invoke(ProceedingJoinPoint ars) throws Throwable {
        Object[] pare = ars.getArgs();
        PageBean pageBean = null;
        for (Object o : pare) {
            if(o instanceof PageBean){
                pageBean = (PageBean)o;
                break;
            }
        }

        //设置分页参数
        if(null!=pageBean&&pageBean.isPagination())
            PageHelper.startPage(pageBean.getPage(),pageBean.getRows());

        //执行方法
        Object proceed = ars.proceed(pare);
        if(null!=pageBean&&pageBean.isPagination()){
            List list = (List) proceed;
            PageInfo pageInfo = new PageInfo(list);
            pageBean.setTotal(pageInfo.getTotal()+"");
        }

        return proceed;
    }
}
