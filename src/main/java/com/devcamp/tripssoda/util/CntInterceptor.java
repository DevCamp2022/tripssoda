package com.devcamp.tripssoda.util;

import com.devcamp.tripssoda.mapper.AccompanyMapper;
import com.devcamp.tripssoda.mapper.IpBanListMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Logger;

public class CntInterceptor implements HandlerInterceptor {
    private static final Logger logger = Logger.getLogger(String.valueOf(CntInterceptor.class));
    @Autowired
    IpBanListMapper ipBanListMapper;
    @Autowired
    AccompanyMapper accompanyMapper;

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

        logger.info("#### cnt ####");
        System.out.println("#### cnt ####");

        HttpSession session = ((ServletRequestAttributes)(RequestContextHolder.currentRequestAttributes())).getRequest().getSession();


//        if(SessionUtil.getLoginUserId(session)==null) {
//            System.out.println("없다없다없다cnt아디없음");
//            PrintWriter out = res.getWriter();
//            out.println("<script>alert('로긴해라 아이디없다.');history.go(-1);</script>");
//            out.flush();
//            return false;
//        }
//        if(SessionUtil.getLoginUserId(session)==null){
//            res.setContentType("text/html; charset=UTF-8");
//            PrintWriter out = res.getWriter();
//            out.println("<script>alert('zzzzzzzzzzzzzzzzzzzzzzzz.');history.go(-1);</script>");
//            out.flush();
//        }else{}
        System.out.println("S??????????????essionUtil.getLoginUserId(session) = " + SessionUtil.getLoginUserId(session));
        System.out.println("SessionUtil.getLoginUserId(session) = " + SessionUtil.getLoginUserId(session).getClass());


        if(SessionUtil.getLoginUserId(session)=="null"){
            res.setContentType("text/html; charset=UTF-8");
            PrintWriter out = res.getWriter();
            System.out.println("\"안됨\" = " + "안됨");
            out.println("<script>alert('로그인이 필요한 페이지입니다.');history.go(-1);</script>");
            out.flush();
        }else{
            System.out.println("\"로긴됨 이제 ip체크가자 왜\" = " + "왜왜");

        Integer userId = Integer.valueOf(SessionUtil.getLoginUserId(session));

        System.out.println("cnt inter###userId = " + userId);

        int count = accompanyMapper.selectUserAccompanyCntToday(userId);
        System.out.println("cnt inter###인터셉 count = " + count);

        if(count >=3) {
            try {
                res.setContentType("text/html; charset=UTF-8");
                PrintWriter out = res.getWriter();
                out.println("<script>alert('하루 글 작성 가능 개수는 3개까지입니다.');history.go(-1);</script>");
                out.flush();
                System.out.println(" ########## getRemoteAddr ##########" + req.getRemoteAddr());
                logger.info(req.getRemoteAddr());
                Map<String, String> map = new HashMap<>();
                map.put("ip", req.getRemoteAddr());

                int rowCnt = ipBanListMapper.insertIpBan(map);

                if (rowCnt != 1)
                    throw new Exception("ban insert error");

            } catch (Exception e) {
                System.out.println(e);
            }
        }
        }
        return true;
    }
}

