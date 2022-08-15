let toURL = $(".to-url").val();

$(".email-login-btn").click(function (){
   location.href='/login/emailLogin?toURL=' + toURL;
});

$(".register-btn").click(function (){
   location.href="/register";
})