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
    selector("img.thumbnail").src = "/image/thumbnail/" + paymentInfo.thumbnail;
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
    const productAmountHtml = `<span class="product-amount">${paymentInfo.schedulePrice}<span>원</span></span>`
    selector("li.product-amount > span.product-amount").innerHTML = productAmountHtml;
    selector("li.product-amount > input[name='productAmount']").value = paymentInfo.schedulePrice;

    selector("li.total-amount > span.total-amount").innerText = paymentInfo.schedulePrice;
    selector("li.total-amount > input[name='totalAmount']").value = paymentInfo.schedulePrice;
    selector("span.reserver-point").innerText = rsvr.point;
    selector("input[name='productQty']").setAttribute("data-limitQty", paymentInfo.limitQty);

    selector("input[name='productId']").value = URLSearch.get("productId");
    selector("input[name='scheduleId']").value = URLSearch.get("scheduleId");

    if (paymentInfo.pickupType !== null) {
        const pickupTitle = "<div class='payment-title'>픽업 정보<p>곧 모시러 갈께요! 부릉부릉 🚐💨💨</p></div><hr class='separator'>" +
            `<div class='rows meeting_place'><span>${paymentInfo.meetingPoint}</span></div>`;
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

    if (optList.length !== 0) {
        const optionTitle = "<div class='payment-title'>추가 옵션 정보<p>추가 옵션을 선택해주세요! 🤔🎨</p></div><hr class='separator'>"
        selector("div.option-info").insertAdjacentHTML('beforeend', optionTitle);

        let optionTag = "<div class='option-wrap'>";

        for (let i = 0; i < optList.length; i++) {
            optionTag += `<div class="option">`;
            // optionTag += `<h1>옵션 ${i + 1}.</h1>`;
            optionTag += `<input type="hidden" name="optionId" value="${optList[i].optionId}">`
            if (optList[i].type === 'A') {
                optionTag += `<input name='optionDetail' class='reserver-option ${optList[i].type === 'S' ? 'sel' : optList[i].type === 'A' ? 'inp' : ''}'
                       placeholder='${optList[i].name} (${optList[i].price}원)' data-unitPrice='${optList[i].price}' data-id='${optList[i].optionId}' />`;
            } else if (optList[i].type === 'S') {
                const optArr = optList[i].content.split(",");
                const priceArr = optList[i].price.split(",");
                optionTag += `<select name='optionDetail' class='reserver-option sel'  data-id='${optList[i].optionId}'/>`;

                optionTag += "<option value='' data-unitPrice='0'>옵션을 선택해주세요.</option>";
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

$('div.reservation-info').on("change", "[name='optionDetail']", function () {

    $("span.option-amount").text(0);
    $("input[name='optionAmount']").val(0);


    let optionAmount = 0;
    const optList = $("div.option-wrap").children();
    for (let i = 0; i < optList.length; i++) {
        let option = $(optList[i]).children("[name='optionDetail']");
        option = option.children(':selected').length === 0 ? option : option.children(':selected');
        optionAmount += Number.parseInt(option.data("unitprice"));
    }

    const optionAmountHtml = `<span class="option-amount">${optionAmount}<span>원</span></span>`;
    $("span.option-amount").html(optionAmountHtml);
    $("input[name='optionAmount']").val(optionAmount);

    calTotalAmount()

})
$("div.reservation-wrap").on("click", ".btn-amount-plus", function () {

    const buttonType = $(this).data("btn");
    const qtyInpElement = $(this).siblings(`input[name='${buttonType}Qty']`);
    const limitQty = Number.parseInt($(this).siblings("input[name='productQty']").data("limitqty"));
    if (qtyInpElement.val() >= limitQty) {
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
    const productAmountHtml = `<span class="product-amount">${currentAmount + unitPrice}<span>원</span></span>`
    amountTxtElement.html(productAmountHtml);
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
    for (let i = 0; i < optList.length; i++) {
        let option = $(optList[i]).children("[name='optionDetail']");
        option = option.children(':selected').length === 0 ? option : option.children(':selected');
        totalOptionAmount += Number.parseInt(option.data("unitprice"));
    }
    console.log(totalOptionAmount);

    const currentQty = Number.parseInt(qtyInpElement.val());
    qtyInpElement.val(currentQty - 1)

    currentProductAmount = Number.parseInt(amountTxtElement.text());
    const productAmountHtml = `<span class="product-amount">${currentProductAmount - unitPrice}<span>원</span></span>`
    amountTxtElement.html(productAmountHtml);
    amountInpElement.val(currentProductAmount - unitPrice);

    currentOptionAmount = Number.parseInt(optionTxtElement.text());

    const optionAmountHtml = `<span class="option-amount">${currentOptionAmount - totalOptionAmount}<span>원</span></span>`
    optionTxtElement.html(optionAmountHtml);
    optionInpElement.val(currentOptionAmount - totalOptionAmount);
    $("div.option-wrap").last().remove();
    calTotalAmount()
})

function selector(selectors) {
    return document.querySelector(selectors);
}

$("div.reservation-detail").on("propertychange change keyup paste input", "input[name='usedPoint']", function () {
    const availablePoint = Number.parseInt($("span.reserver-point").text());
    const productAmount = Number.parseInt($("input[name='productAmount']").val());
    const optionAmount = Number.parseInt($("input[name='optionAmount']").val());
    const totalAmount = productAmount + optionAmount;

    if (Number.parseInt($(this).val()) > availablePoint) {
        alert("사용 가능한 포인트를 초과했습니다.");
        if (totalAmount - 100 > availablePoint) {
            $(this).val(availablePoint);
        } else {
            $(this).val(totalAmount - 100);
        }
        calTotalAmount()
        return;
    }

    if (Number.parseInt($(this).val()) < 0) {
        $(this).val(0);
        calTotalAmount()
        return;
    }

    // const totalAmount = Number.parseInt($("input[name='totalAmount']").val());
    // const totalAmount = productAmount+optionAmount;
    if (Number.parseInt($("input[name='totalAmount']").val()) < 100) {
        alert("최소 결제 금액은 100원입니다.");
        $(this).val(totalAmount - 100);
        calTotalAmount();
        return;
    }

    calTotalAmount();
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

    const totalAmountHtml = `<span class="total-amount">${totalAmount}<span>원</span></span>`
    $("span.total-amount").html(totalAmountHtml);
    $("input[name='totalAmount']").val(totalAmount);
}

function appendOption() {
    if($("div.option-wrap").length!==0) {
        let optionElement = "<div class='option-wrap'>";
        optionElement += $("div.option-wrap").html();
        optionElement += "</div>";

        $("div.option-info").append(optionElement);
    }
}

function objectifyForm(formArray) {
    //serialize data function
    let returnArray = {};
    for (let i = 0; i < formArray.length; i++) {
        returnArray[formArray[i]['name']] = formArray[i]['value'];
    }
    return returnArray;
}

function objectifyPaymentDetail() {
    let reserverBirthday = $("input[name='reserverBirthYear']").val() + "-" + $("input[name='reserverBirthMonth']").val() + "-" + $("select[name='reserverBirthDate']").val();

    let formObj = objectifyForm(selector("#frm"));

    let optionDetail = $("[name=optionDetail]");
    if(optionDetail.length!=0) {
        let optStr = '{';
        for (let i = 0; i < optionDetail.length; i++) {
            if ($(optionDetail[i]).hasClass("inp")) {
                optStr += `"${i}":"${optionDetail[i].dataset.id}#(단답형)${optionDetail[i].value}",`;
            } else {
                optStr += `"${i}":"${optionDetail[i].dataset.id}#${optionDetail[i].value}",`;
            }
        }
        optStr = optStr.slice(0, optStr.length - 1);
        optStr += "}"
        formObj.optionDetail = JSON.parse(optStr);
    }

    formObj.reserverBirthday = reserverBirthday;
    return formObj;
}

function checkEmptyForm() {
    const optionTags = $("div.option-wrap").children();
    for (let i = 0; i < optionTags.length; i++) {
        if ($(optionTags[i]).children("[name='optionDetail']").val() === '') {
            alert("입력하지 않은 옵션 정보가 있습니다.");
            $(optionTags[1]).children("[name='optionDetail']").focus();
            return false;
        }
    }
    return true;
}

$("ul.detail-info").on("click", "button[name='btnPayMethod']", function () {
    const checkedpayMethod = $(this).children("input[type='radio']").prop('checked', true);
    $("input[name='payMethod']").val(checkedpayMethod.val());
})
