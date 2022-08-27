package com.devcamp.tripssoda.service;

import java.util.HashMap;

public interface KakaoLoginService {
    String getKakaoAccessToken(String code);

    HashMap<String, String> createKaKaoUser(String token);
}
