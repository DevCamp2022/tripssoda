//약관동의 체크박스 클릭이벤트
$("#termsAgreement").change(function() {
    if($("#termsAgreement").is(":checked")) {
        $("#termsAgreement").val("1");
        console.log($("#termsAgreement").val());
    } else {
        $("#termsAgreement").val("0");
        console.log($("#termsAgreement").val());
    }
});

function valid() {
    if($("#regNumber").val() == "") {
        alert("사업자번호를 입력해 주세요.");
        return false;
    }

    if($("#companyName").val() == "") {
        alert("사업자명 입력해 주세요.");
        return false;
    }

    if($("#intro").val() == "") {
        alert("사업자소개를 입력해 주세요.");
        return false;
    }

    if($("#serviceRegion").val() == "") {
        alert("서비스 지역 입력해 주세요.");
        return false;
    }

    if($("#productType").val() == "") {
        alert("상품유형을 입력해 주세요.");
        return false;
    }

    if($("#managerName").val() == "") {
        alert("담당자 성함을 입력해 주세요.");
        return false;
    }

    if($("#managerTel").val() == "") {
            alert("담당자 연락처를 입력해 주세요.");
            return false;
        }

    if($("#termsAgreement").val() == "0") {
        alert("약관에 동의해 주셔야 가입이 가능합니다.");
        return false;
    }

    console.log("모든 유효성을 통과함");
    return true;
}

//회사로고 파일명 바인딩
$("#uploadLogo").on('change',function(){
    let fileName = $("#uploadLogo").val();
    $(".uploadLogo").attr('value',fileName);
});

//회사소개 파일명 바인딩
$("#uploadAttach").on('change',function(){
    let fileName = $("#uploadAttach").val();
    $(".uploadAttach").attr('value',fileName);
});

CKEDITOR.replace('intro',
    {filebrowserUploadUrl:'/ckeditor/fileUploader'
});

// $(".submitBtn").click(function(){
//     let formData = new FormData();

// // ... formData.append("키이름", "값"); 생략

// for (let key of formData.keys()) {
// 	console.log(key, ":", formData.get(key));
// }
// })