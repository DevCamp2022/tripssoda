const URLSearch = new URLSearchParams(location.search);

$("#approvalSelection").on("change", function (){
    if($(this).val()==2){
        $("#reason").css("display","");
    } else  {
        $("#reason").css("display","none");
    }
})


$("#btnApprove").click(function (){

    const reason = $("#reason").val();
    const approval = $("#approvalSelection").val();

    if (approval==="2" && reason===""){
        alert("사유를 작성하세요.")
        return;
    }


    $.ajax({
        url: "/admin/partner/approval",
        method: "GET",
        data: {partnerId: URLSearch.get("partnerId"), reason: reason, approval:approval},
        success: function (result) {
            if (result==="success"){
                alert("처리가 완료되었습니다.")

            }
        },
        error: function (result) {
            alert(result);
        }
    });
})