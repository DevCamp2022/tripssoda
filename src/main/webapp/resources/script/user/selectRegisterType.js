$(".email-register-btn").click(function (){
   // location.href="<c:url value='register/write'/>";
   location.href="/register/write";
});

$(".login-btn").click(function() {
   location.href="/login";
});

$(".kakao-register-btn").click(function () {
   location.href="https://kauth.kakao.com/oauth/authorize?client_id=14e9d6ef452789427cedaabc6c66ee98&redirect_uri=http://localhost:9100/login/kakao&response_type=code";
})

// <a href="https://kauth.kakao.com/oauth/authorize?client_id=14e9d6ef452789427cedaabc6c66ee98&redirect_uri=http://localhost:9100/login/kakao&response_type=code">카카오</a>