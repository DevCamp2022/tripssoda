let toURL = $(".to-url").val();

$(".email-login-btn").click(function (){
   location.href='/login/emailLogin?toURL=' + toURL;
});

$(".register-btn").click(function (){
   location.href="/register";
})

$(".kakao-login-btn").click(function () {
   location.href="https://kauth.kakao.com/oauth/authorize?client_id=14e9d6ef452789427cedaabc6c66ee98&redirect_uri=http://localhost:9100/login/kakao&response_type=code";
})