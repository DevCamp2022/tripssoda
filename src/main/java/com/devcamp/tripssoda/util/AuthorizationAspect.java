package com.devcamp.tripssoda.util;

import com.devcamp.tripssoda.controller.AdminController;
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

    @Around("execution(* com.devcamp.tripssoda.controller.AdminController.*(..)) ||" +
            "execution(* com.devcamp.tripssoda.controller.PartnerController.*(..)) " +
            "&& !@annotation(com.devcamp.tripssoda.util.SkipChecking)" )

    public Object idCheck(ProceedingJoinPoint joinPoint) throws Throwable {
        logger.info("### {}: before", joinPoint.getSignature().getName());
        System.out.println("\"AOP - Member Login Check Started\" = " + "AOP - Member Login Check Started");


        HttpSession session = ((ServletRequestAttributes)(RequestContextHolder.currentRequestAttributes())).getRequest().getSession();
        Integer userId = SessionUtil.getLoginMemberId(session);

        if(userId==null){
            logger.info("sessionId is not present. Go to login page");
            System.out.println("sessionId is not present. Go to login page");
//            AdminController.toLoginPage();
            return "redirect:/";
        }

        logger.info("### {}: after\n", joinPoint.getSignature().getName());
        Object result = joinPoint.proceed();
        return result;
    }

}
