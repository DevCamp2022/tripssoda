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

//회사로고 미리보기 기능
$("#uploadLogo").change(function(){
    var f = $(this)[0].files[0];
    
    var reader = new FileReader();
    reader.onload = function(e){
        let newImg = document.createElement('img');
        newImg.setAttribute("src", e.target.result);
        newImg.setAttribute("width",300);
        $(".pvUploadLogo").html(newImg);
    }
    reader.readAsDataURL($(this)[0].files[0]);
});


function valid() {
    if(CKEDITOR.instances.intro.getData() =='' || CKEDITOR.instances.intro.getData().length ==0) {
        alert("회사소개를 입력해 주세요.");
        return false;
    }

    if($("input[name='productType']:checked").val() == '' || $("input[name='productType']:checked").val() == undefined || $("input[name='productType']:checked").val() == null) {
        alert("최소 1개이상의 상품유형을 선택해 주세요.");
        return false;
    }
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
















///////////////////update//////////////////////
$(document).ready(function(){
    //파트너 로고 
    let logoName = $(".partnerLogo").val();
    let reName = logoName.replace('resized_','');
    let modLogoName = reName.substr(36);
    $(".uploadLogo").attr("value",modLogoName);

    //첨부문서 
    let attachName = $(".introAttachment").val();
    let modAttachName = attachName.substr(36);
    $(".uploadAttach").attr("value",modAttachName);

    //체크박스
    let productType = $(".productType").val();
    let productTypeArr = productType.split(',');
    for(let i=0; i<productTypeArr.length; i++) {
        if(productTypeArr[i] == 'C002') {
            $("#private").attr('checked','checked');
            continue;
        }
        if(productTypeArr[i] == 'C003') {
            $("#smallDay").attr('checked','checked');
        }
        if(productTypeArr[i] == 'C004') {
            $("#busDay").attr('checked','checked');
        }
        if(productTypeArr[i] == 'C005') {
            $("#unusual").attr('checked','checked');
        }
    }
})
