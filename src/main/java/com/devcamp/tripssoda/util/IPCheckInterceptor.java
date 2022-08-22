package com.devcamp.tripssoda.util;

import com.devcamp.tripssoda.mapper.IpBanListMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import java.util.List;
import java.util.logging.Logger;

public class IPCheckInterceptor implements HandlerInterceptor {
    private static final Logger logger = Logger.getLogger(String.valueOf(IPCheckInterceptor.class));
    @Autowired
    IpBanListMapper ipBanListMapper;

    @Override
    public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1,
                                Object arg2, Exception arg3) throws Exception {
    }

    @Override
    public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1,
                           Object arg2, ModelAndView arg3) throws Exception{
    }

    @Override
    public boolean preHandle(HttpServletRequest req, HttpServletResponse res, Object arg2) throws Exception{
        logger.info("client ip " + req.getRemoteAddr());//접속한 사용자의 IP
        System.out.println("client ip " + req.getRemoteAddr());
        List<String> list = ipBanListMapper.findIpBanList(); //오늘ip밴 당한사람 ip 가져온다.
        for(String li : list)
        {
            System.out.println("li = " + li.toString());
            logger.info("ban ip " + li);
            System.out.println("req.getRemoteAddr().matches(li) = " + req.getRemoteAddr().matches(li));

            if(req.getRemoteAddr().matches(li))
            {
                res.setContentType("text/html; charset=UTF-8");
                PrintWriter out = res.getWriter();
                out.println("<script>alert('도배 때문에 글 작성이 하루동안 제한됩니다.');history.go(-1);</script>");
                out.flush();
                return false;
            }//if
        }//for
        return true;
    }
}

