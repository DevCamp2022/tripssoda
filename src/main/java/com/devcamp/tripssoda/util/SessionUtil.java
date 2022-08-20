package com.devcamp.tripssoda.util;

import javax.servlet.http.HttpSession;

public class SessionUtil {
    private static final String LOGIN_MEMBER_ID = "LOGIN_MEMBER_ID";
    private static final String LOGIN_OWNER_ID = "LOGIN_OWNER_ID";

    // 인스턴스화 방지
    private SessionUtil() {}

    public static Integer getLoginMemberId(HttpSession session) {
//        return (String) session.getAttribute(LOGIN_MEMBER_ID);
        System.out.println("String.valueOf(session.getAttribute(\"id\")) = " + String.valueOf(session.getAttribute("id")));

        return (Integer) session.getAttribute("id");
    }
    public static void setLoginMemberId(HttpSession session, String id) {
        session.setAttribute(LOGIN_MEMBER_ID, id);
    }
}
