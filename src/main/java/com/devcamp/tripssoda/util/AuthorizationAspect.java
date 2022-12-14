package com.devcamp.tripssoda.util;

import com.devcamp.tripssoda.controller.AdminController;
import com.devcamp.tripssoda.mapper.UserMapper;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpSession;


@Aspect
@Component
public class AuthorizationAspect {

    private static final Logger logger = LoggerFactory.getLogger(AuthorizationAspect.class);

    @Around("execution(* com.devcamp.tripssoda.controller.AdminController.*(..))" +
            "&& !@annotation(com.devcamp.tripssoda.util.annotations.SkipChecking)")
    public Object AdminCheck(ProceedingJoinPoint joinPoint) throws Throwable {
        logger.info("### {}: before", joinPoint.getSignature().getName());
        System.out.println("\"AOP - Admin Login Check Started\" = " + "AOP - Admin Login Check Started");

        HttpSession session = ((ServletRequestAttributes)(RequestContextHolder.currentRequestAttributes())).getRequest().getSession();
        String userCode = SessionUtil.getLoginUserCode(session);

        if(userCode==null || !userCode.equals("U003")){
            logger.info("AdminCode is not present. Go to login page");
            System.out.println("AdminCode Code is not present. Go to login page");
            return "redirect:/";
        }
        logger.info("### {}: after\n", joinPoint.getSignature().getName());
        Object result = joinPoint.proceed();
        return result;
    }


    @Around("execution(* com.devcamp.tripssoda.controller.PartnerController.*(..)) " +
            "&& !@annotation(com.devcamp.tripssoda.util.annotations.SkipChecking)")
    public Object partnerCheck(ProceedingJoinPoint joinPoint) throws Throwable {
        logger.info("### {}: before", joinPoint.getSignature().getName());
        System.out.println("\"AOP - Partner Login Check Started\" = " + "AOP - Partner Login Check Started");

        HttpSession session = ((ServletRequestAttributes)(RequestContextHolder.currentRequestAttributes())).getRequest().getSession();
        String userCode = SessionUtil.getLoginUserCode(session);

        if(userCode==null || !( userCode.equals("U002") || userCode.equals("U003") ) ){
            logger.info("partnerCode is not present. Go to login page");
            System.out.println("partnerCode Code is not present. Go to login page");
            return "redirect:/";
        }
        logger.info("### {}: after\n", joinPoint.getSignature().getName());
        Object result = joinPoint.proceed();
        return result;
    }


    @Around("execution(* com.devcamp.tripssoda.controller.AccompanyController.*(..))" +
            "&& @annotation(com.devcamp.tripssoda.util.annotations.AuthChecking)")
    public Object authCheck(ProceedingJoinPoint joinPoint) throws Throwable {
        logger.info("### {}: before", joinPoint.getSignature().getName());
        System.out.println("\"AOP - Auth Login Check Started\" = " + "AOP - Auth Login Check Started");

        HttpSession session = ((ServletRequestAttributes)(RequestContextHolder.currentRequestAttributes())).getRequest().getSession();
        String userCode = SessionUtil.getLoginUserId(session);

        if(userCode==null){
            logger.info("Auth is not present. Go to login page");
            System.out.println("user Code is not present. Go to login page");
            return "redirect:/";
        }
        logger.info("### {}: after\n", joinPoint.getSignature().getName());
        Object result = joinPoint.proceed();
        return result;
    }



}
