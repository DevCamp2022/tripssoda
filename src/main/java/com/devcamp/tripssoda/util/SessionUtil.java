package com.devcamp.tripssoda.util;

import javax.servlet.http.HttpSession;

public class SessionUtil {
    private static final String LOGIN_MEMBER_ID = "LOGIN_MEMBER_ID";
    private static final String LOGIN_OWNER_ID = "LOGIN_OWNER_ID";

    private SessionUtil() {}

    public static String getLoginUserId(HttpSession session) {
        System.out.println("String.valueOf(session.getAttribute(\"id\")) = " + String.valueOf(session.getAttribute("id")));

        return String.valueOf(session.getAttribute("id"));
    }

    public static String getLoginUserCode(HttpSession session) {
        System.out.println("String.valueOf(session.getAttribute(\"userCode\")) = " + (String)session.getAttribute("userCode"));

        return (String)session.getAttribute("userCode");
    }
    public static void setLoginMemberId(HttpSession session, String id) {
        session.setAttribute(LOGIN_MEMBER_ID, id);
    }
}
