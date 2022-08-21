const URLSearch = new URLSearchParams(location.search);

function getDaysOfMonth(year, month) {
    let date = new Date(year, month, 0);
    return date.getDate();
}

$.ajax({
    url: "/payment/paymentDetail",
    method: "GET",
    data: {productId: URLSearch.get("productId"), scheduleId: URLSearch.get("scheduleId")},
    success: function (result) {
        updatePaymentInfo(result)
    },
    error: function () {
        alert("실패");
    }
});

//구매에 필요한 초기 정보를 업데이트
function updatePaymentInfo(paymentInfo) {
    const rsvr = paymentInfo.reserver;
    const optList = paymentInfo.optionList;
    const birth = rsvr.birthday.split('-');
    const year = $("input[name='reserverBirthYear']").val();
    const month = $("input[name='reserverBirthMonth']").val();

    const lastDate = getDaysOfMonth(year, month);
    for (let i = 1; i <= lastDate; i++) {
        let date = i <= 9 ? '0' + i : i;
        $("select[name='reserverBirthDate']").append(`<option value='${date}'>${date}</option>`)
    }

    selector("input[name='reserverName']").value = rsvr.name;
    selector("select[name='reserverGender']").value = rsvr.gender;
    selector("input[name='reserverBirthYear']").value = birth[0];
    selector("input[name='reserverBirthMonth']").value = birth[1];
    selector("select[name='reserverBirthDate']").value = birth[2];
    selector("input[name='reserverTel']").value = rsvr.tel;
    selector("input[name='reserverEmail']").value = rsvr.email;
    selector("div.reservation-detail > div.detail-header > strong.title").innerText = paymentInfo.title;
    selector("div.reservation-detail > div.detail-header > input[name='productTitle']").value = paymentInfo.title;

    selector("li.product-start-date > span.date").innerText = paymentInfo.startDate.replaceAll("-", ".");
    selector("li.product-amount > span.product-amount").setAttribute("data-unitPrice", paymentInfo.schedulePrice);
    selector("li.product-amount > span.product-amount").innerText = paymentInfo.schedulePrice;
    selector("li.product-amount > input[name='productAmount']").value = paymentInfo.schedulePrice;

    selector("li.total-amount > span.total-amount").innerText = paymentInfo.schedulePrice;

    selector("span.reserver-point").innerText = rsvr.point;
    selector("input[name='productQty']").setAttribute("data-limitQty", paymentInfo.limitQty);

    selector("input[name='productId']").value=URLSearch.get("productId");
    selector("input[name='scheduleId']").value=URLSearch.get("scheduleId");

    calTotalAmount();

    if (paymentInfo.pickupType !== null) {
        const pickupTitle = "<div class='payment-title'>픽업 정보<p>곧 모시러 갈께요! 부릉부릉 🚐💨💨</p></div><hr class='separator'>" +
            `<div class='row meeting_place'><span>${paymentInfo.meetingPoint}</span></div>`;
        selector('div.pickup-info').insertAdjacentHTML('beforeend', pickupTitle);
        //A == 단답형, S == 선택형, F == 고정형
        if (paymentInfo.pickupType === 'A') {
            const pickupOptionTag = "<input name='reserverPickup' class='reserver-pickup inp'/>";
            selector('div.pickup-info').insertAdjacentHTML('beforeend', pickupOptionTag);
        } else if (paymentInfo.pickupType === 'S') {
            const pickupOptionList = paymentInfo.pickupOption.split(",");
            let pickupOptionTag = "<select name='reserverPickup' class='reserver-pickup sel'>";
            for (let i = 0; i < pickupOptionList.length; i++) {
                pickupOptionTag += `<option value='${pickupOptionList[i]}'>${pickupOptionList[i]}</option>`
            }
            pickupOptionTag += "</select>";
            selector('div.pickup-info').insertAdjacentHTML('beforeend', pickupOptionTag);
        }
    }

    if (optList !== null) {
        const optionTitle = "<div class='payment-title'>추가 옵션 정보<p>추가 옵션을 선택해주세요! 🤔🎨</p></div><hr class='separator'>"
        selector("div.option-info").insertAdjacentHTML('beforeend', optionTitle);

        let optionTag = "<div class='option-wrap'>";

        for (let i = 0; i < optList.length; i++) {
            optionTag += `<div class="option">`;
            optionTag += `<h1>옵션 ${i + 1}.</h1>`;
            optionTag += `<input type="hidden" name="optionId" value="${optList[i].optionId}">`
            if (optList[i].type === 'A') {
                optionTag += `<input name='optionDetail' class='reserver-option ${optList[i].type === 'S' ? 'sel': optList[i].type === 'A' ? 'inp':''}'
                       placeholder='${optList[i].name} (${optList[i].price}원)' data-unitPrice='${optList[i].price}' data-id='${optList[i].optionId}' />`;
            } else if (optList[i].type === 'S') {
                const optArr = optList[i].content.split(",");
                const priceArr = optList[i].price.split(",");
                    optionTag += `<select name='optionDetail' class='reserver-option sel'  data-id='${optList[i].optionId}'/>`;

                optionTag += "<option value data-unitPrice='0'>옵션을 선택해주세요.</option>";
                for (let j = 0; j < optArr.length; j++) {
                    optionTag += `<option value='${optArr[j]}' data-unitPrice='${priceArr[j]}'>${optArr[j]}(${priceArr[j]}원)</option>`
                }
                optionTag += "</select>";
            }
            optionTag += "</div>";

        }
        selector('div.option-info').insertAdjacentHTML('beforeend', optionTag);

    }
}

// let prevPrice;
//
// $('div.reservation-info').on("click", "[name='optionDetail']", function () {
//     if($(this).hasClass("sel")){
//         prevPrice = Number.parseInt($(this).children(':selected').data("unitprice"));
//         prevPrice = isNaN(prevPrice) ? 0: prevPrice;
//     } else if($(this).hasClass("inp")){
//         prevPrice= Number.parseInt($(this).data("unitprice"));
//     }})
//
// $('div.reservation-info').on("change", "[name='optionDetail']", function () {
//     let unitPrice;
//     if($(this).hasClass("sel")){
//         unitPrice = Number.parseInt($(this).children(':selected').data("unitprice"));
//         unitPrice = isNaN(unitPrice) ? 0: unitPrice;
//     } else if($(this).hasClass("inp")){
//         unitPrice= Number.parseInt($(this).data("unitprice"));
//     }
//         const currentAmount = Number.parseInt($("input[name='optionAmount']").val());
//     const qty = Number.parseInt($("input[name='productQty']").val());
//
//
//         // $(this).siblings("div.option-qty").remove();
//
//
//         if($(this).val()===''){
//             $("span.option-amount").text(currentAmount-prevPrice);
//             $("input[name='optionAmount']").val(currentAmount-prevPrice);
//             return;
//         } else {
//             $("span.option-amount").text((currentAmount-prevPrice)+unitPrice);
//             $("input[name='optionAmount']").val((currentAmount-prevPrice)+unitPrice);
//         }
//
//
//         // if ($(this).data("countable") === true) {
//         //     const optionCount = "<div class='option-qty'>" +
//         //         "<em class='detail-info-tit'>수량</em>" +
//         //         "<div class='qty-wrap'>" +
//         //         "<button type='button' class='btn-amount-minus' data-btn='option'>-</button>" +
//         //         "<input type='number' type='text' name='optionQty' value='1'>" +
//         //         "<button type='button' class='btn-amount-plus' data-btn='option'>+</button></div></div>";
//         //     $(this).parent().append(optionCount);
//         //
//         //     $("span.option-amount").text(unitPrice)
//         //     $("input[name='optionAmount']").val(unitPrice);
//         // }
//
//
//
//         calTotalAmount()
//
//
//     //옵션 선택 해제 했을 때 가격을 0원처리
//     //0원짜리 옵션일 경우 리셋안되게 처리.....
// })


$('div.reservation-info').on("change", "[name='optionDetail']", function () {

    $("span.option-amount").text(0);
    $("input[name='optionAmount']").val(0);


    let optionAmount = 0;
    const optList = $("div.option-wrap").children();
    for (let i = 0; i<optList.length; i++){
        let option = $(optList[i]).children("[name='optionDetail']");
        option = option.children(':selected').length === 0 ? option:option.children(':selected');
        optionAmount+=Number.parseInt(option.data("unitprice"));
    }

    $("span.option-amount").text(optionAmount);
    $("input[name='optionAmount']").val(optionAmount);

        calTotalAmount()

})
$("div.reservation-wrap").on("click", ".btn-amount-plus", function () {

    const buttonType = $(this).data("btn");
    const qtyInpElement = $(this).siblings(`input[name='${buttonType}Qty']`);
    const limitQty = Number.parseInt($(this).siblings("input[name='productQty']").data("limitqty"));
    if (qtyInpElement.val()>=limitQty){
        alert("최대 구매 수량을 초과했습니다.");
        qtyInpElement.val(limitQty);
        return;
    }
    let amountTxtElement = $(`span.${buttonType}-amount`);
    const amountInpElement = amountTxtElement.siblings(`input[name='${buttonType}Amount']`);
    let currentAmount;
    let unitPrice;

    unitPrice = amountTxtElement.data("unitprice");

    // if (buttonType === "product") {
    //     unitPrice = amountTxtElement.data("unitprice")+$(".reserver-option").data("unitprice");
    // } else if (buttonType === "option") {}
    // unitPrice += $(".reserver-option").data("unitprice");

    const currentQty = Number.parseInt(qtyInpElement.val());
    qtyInpElement.val(currentQty + 1)

    currentAmount = Number.parseInt(amountTxtElement.text());
    amountTxtElement.text(currentAmount + unitPrice);
    amountInpElement.val(currentAmount + unitPrice);
    calTotalAmount()
    appendOption();
})

$("div.reservation-wrap").on("click", ".btn-amount-minus", function () {
    const buttonType = $(this).data("btn");
    const qtyInpElement = $(this).siblings(`input[name='${buttonType}Qty']`);

    let amountTxtElement = $(`span.${buttonType}-amount`);
    const amountInpElement = amountTxtElement.siblings(`input[name='${buttonType}Amount']`);

    let optionTxtElement = $(`span.option-amount`);
    const optionInpElement = amountTxtElement.siblings(`input[name='optionAmount']`);


    let currentProductAmount;
    let unitPrice = amountTxtElement.data("unitprice");

    // if (buttonType === "product") {
    //     unitPrice = amountTxtElement.data("unitprice");
    // } else if (buttonType === "option") {
    //     unitPrice = $(".reserver-option").data("unitprice");
    // }

    if (Number.parseInt(qtyInpElement.val()) <= 1) {
        return;
    }

    let currentOptionAmount;
    let totalOptionAmount = 0;
    const optList = $("div.option-wrap").last().children();
    for (let i = 0; i<optList.length; i++){
        let option = $(optList[i]).children("[name='optionDetail']");
        option = option.children(':selected').length === 0 ? option:option.children(':selected');
        totalOptionAmount+=Number.parseInt(option.data("unitprice"));
    }
    console.log(totalOptionAmount);
    
    const currentQty = Number.parseInt(qtyInpElement.val());
    qtyInpElement.val(currentQty - 1)

    currentProductAmount = Number.parseInt(amountTxtElement.text());
    amountTxtElement.text(currentProductAmount - unitPrice);
    amountInpElement.val(currentProductAmount - unitPrice);

    currentOptionAmount = Number.parseInt(optionTxtElement.text());
    optionTxtElement.text(currentOptionAmount - totalOptionAmount);
    optionInpElement.val(currentOptionAmount - totalOptionAmount);
    $("div.option-wrap").last().remove();
    calTotalAmount()
})

function selector(selectors) {
    return document.querySelector(selectors);
}

$("div.reservation-detail").on("propertychange change keyup paste input", "input[name='usedPoint']", function () {
    const availablePoint = Number.parseInt($("span.reserver-point").text());

    if (Number.parseInt($(this).val()) > availablePoint) {
        alert("사용가능한 포인트를 초과했습니다.");
        $(this).val(availablePoint)
    } else if (Number.parseInt($(this).val()) < 0) {
        $(this).val(0);
    }
    calTotalAmount()
});

function calTotalAmount() {
    const productAmount = Number.parseInt($("input[name='productAmount']").val());
    const totalOptionAmount = Number.parseInt($("input[name='optionAmount']").val());
    const usedPoint = $("input[name='usedPoint']").val();
        $("input[name='totalAmount']").val(0)

    let totalAmount = productAmount + totalOptionAmount;

    if (usedPoint !== '') {
        totalAmount -= Number.parseInt(usedPoint);
    }

    $("span.total-amount").text(totalAmount);
    $("input[name='totalAmount']").val(totalAmount);
}

function appendOption(){
    let optionElement = "<div class='option-wrap'>";
    optionElement+=$("div.option-wrap").html();
        optionElement+="</div>";

    $("div.option-info").append(optionElement);
}

function objectifyForm(formArray) {
    //serialize data function
    let returnArray = {};
    for (let i = 0; i < formArray.length; i++){
        returnArray[formArray[i]['name']] = formArray[i]['value'];
    }
    return returnArray;
}

function objectifyPaymentDetail(){
    let optionDetail = $("[name=optionDetail]");

    let reserverBirthday = $("input[name='reserverBirthYear']").val()+"-"+$("input[name='reserverBirthMonth']").val()+"-"+$("select[name='reserverBirthDate']").val();

    let optStr = '{';
    for (let i = 0; i<optionDetail.length; i++){
        if($(optionDetail[i]).hasClass("inp")){
            optStr += `"${i}":"${optionDetail[i].dataset.id}#(단답형)${optionDetail[i].value}",`;
        } else {
            optStr += `"${i}":"${optionDetail[i].dataset.id}#${optionDetail[i].value}",`;
        }
    }
    optStr = optStr.slice(0,optStr.length-1);
    optStr+="}"

    let formObj = objectifyForm(selector("#frm"));

    formObj.optionDetail=JSON.parse(optStr);
    formObj.reserverBirthday=reserverBirthday;
    return formObj;
}