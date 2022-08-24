const URLSearch = new URLSearchParams(location.search);

$.ajax({
    url: "/payment/successInfo?paymentId="+URLSearch.get("paymentId"),
    method: "GET",
    // data: {paymentId: URLSearch.get("paymentId")},
    success: function (result) {
        console.log(result)
        updateSuccessInfo(result);
    },
    error: function () {
        alert("결제 정보를 가져오는데에 실패했습니다.");
        location.href="/";
    }
});

function updateSuccessInfo(paymentInfo){
    $("img.thumbnail").attr("src","/image/thumbnail/" + paymentInfo.thumbnail);
    $("strong.product-title").text(paymentInfo.title);
    $("span.date").text(paymentInfo.startDate);
    $("span.product-qty").html(`<span class="product-qty">${paymentInfo.qty}<span>개</span></span>`)
    $("span.product-price").html(`<span class="product-price">${paymentInfo.productPrice}<span>원</span></span>`)
    $("span.option-amount").html(`<span class="option-amount">${paymentInfo.optionAmount}<span>원</span></span>`)
    $("span.used-point").html(`<span class="used-point">${paymentInfo.usedPoint}<span>원</span></span>`)
    $("span.total-amount").html(`<span class="total-amount">${paymentInfo.totalAmount}<span>원</span></span>`)

}