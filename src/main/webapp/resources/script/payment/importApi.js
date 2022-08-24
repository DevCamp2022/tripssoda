var IMP = window.IMP; // 생략 가능
IMP.init("imp98050032"); // 예: imp00000000

$("#payBtn").click(function () {
    if (checkEmptyForm()) {
// IMP.request_pay(param, callback) 결제창 호출
        const payMethod = $("input[name='payMethod']").val();
        if (payMethod===''){
            alert("결제 수단을 선택해주시기 바랍니다.")
            return;
        }
        IMP.request_pay({ // param
            pg: payMethod,
            pay_method: "card",
            merchant_uid: 'merchant_' + new Date().getTime(),
            name: $("input[name='productTitle']").val(),
            amount: $("input[name='totalAmount']").val(),
            buyer_email: $("input[name='reserverEmail']").val(),
            buyer_name: $("input[name='reserverName']").val(),
            buyer_tel: $("input[name='reserverTel']").val()
        }, function (rsp) { // callback
            console.log(rsp);
            const paymentDetailObj = objectifyPaymentDetail();
            paymentDetailObj.impUid = rsp.imp_uid;
            paymentDetailObj.merchantUid = rsp.merchant_uid;
            paymentDetailObj.receiptUrl = rsp.receipt_url;
            if (rsp.success) { // 결제 성공 시: 결제 승인 또는 가상계좌 발급에 성공한 경우
                // jQuery로 HTTP 요청
                jQuery.ajax({
                    url: "/payment/complete", // 예: https://www.myservice.com/payments/complete
                    method: "POST",
                    headers: {"Content-Type": "application/json; charset=UTF-8"},
                    data: JSON.stringify(paymentDetailObj),
                }).done(function (data) {
                    if(data.message!=="payment success"){
                        alert("결제에 실패했습니다. 다시 시도해주시기 바랍니다.");
                    }
                    location.href="/payment/success?paymentId="+data.paymentId;
                })
            } else {
                alert("결제에 실패하였습니다. 에러 내용: " + rsp.error_msg);
            }
        })
    }
});