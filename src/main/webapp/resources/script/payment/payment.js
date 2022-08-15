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
        $("select[name='reserverBirthDay']").append(`<option value='${date}'>${date}</option>`)
    }

    selector("input[name='reserverName']").value = rsvr.name;
    selector("select[name='reserverGender']").value = rsvr.gender;
    selector("input[name='reserverBirthYear']").value = birth[0];
    selector("input[name='reserverBirthMonth']").value = birth[1];
    selector("select[name='reserverBirthDay']").value = birth[2];
    selector("input[name='reserverTel']").value = rsvr.tel;
    selector("input[name='reserverEmail']").value = rsvr.email;
    selector("div.reservation-detail > div.detail-header > strong.title").innerText = paymentInfo.title;
    selector("div.reservation-detail > div.detail-header > input[name='productTitle']").value = paymentInfo.title;

    selector("li.product-start-date > span.date").innerText = paymentInfo.startDate.replaceAll("-", ".");
    selector("li.product-price > span.product-price").setAttribute("data-unitPrice", paymentInfo.schedulePrice);
    selector("li.product-price > span.product-price").innerText = paymentInfo.schedulePrice;
    selector("li.product-price > input[name='productPrice']").value = paymentInfo.schedulePrice;

    selector("li.total-price > span.total-price").innerText = paymentInfo.schedulePrice;

    selector("span.reserver-point").innerText = rsvr.point;
    selector("input[name='productQty']").setAttribute("data-limitQty", paymentInfo.limitQty);
    totalPrice();
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
        for (let i = 0; i < optList.length; i++) {
            if (optList[i].type === 'A') {
                const optionInputTag = `<div class="option"><h1>옵션 ${i + 1}.</h1><input name='optionDetail' class='reserver-option inp' placeholder='${optList[i].name}' data-unitPrice='${optList[i].price}' /></div>`;
                selector('div.option-info').insertAdjacentHTML('beforeend', optionInputTag);
            } else if (optList[i].type === 'S') {
                const optArr = optList[i].content.split(",");
                let optionSelectTag = `<div class="option"><h1>옵션 ${i + 1}.</h1><select name='optionDetail' class='reserver-option sel' data-unitPrice='${optList[i].price}' /></div>`;
                optionSelectTag += "<option value>옵션을 선택해주세요.</option>";
                for (let j = 0; j < optArr.length; j++) {
                    optionSelectTag += `<option value='${optArr[j]}' data-countable='${optList[i].countable}'>${optArr[j]}</option>`
                }
                optionSelectTag += "</select>";
                selector('div.option-info').insertAdjacentHTML('beforeend', optionSelectTag);
            }
        }
    }
}

$('div.reservation-info').on("change", "[name='optionDetail']", function () {
    const selected = $("[name='optionDetail'] option:selected");
    $(this).siblings("div.option-qty").remove();
    $("span.option-price").text(0);
    $("input[name='optionPrice']").val(0);

    if (selected.data("countable") === true) {
        const optionCount = "<div class='option-qty'>" +
            "<em class='detail-info-tit'>수량</em>" +
            "<div class='qty-wrap'>" +
            "<button type='button' class='btn-amount-minus' data-btn='option'>-</button>" +
            "<input type='number' type='text' name='optionQty' value='1'>" +
            "<button type='button' class='btn-amount-plus' data-btn='option'>+</button></div></div>";
        $(this).parent().append(optionCount);
        // selector('div.option-info').insertAdjacentHTML('beforeend', optionCount)
        const unitPrice = Number.parseInt($(".reserver-option").data("unitprice"));

        $("span.option-price").text(unitPrice)
        $("input[name='optionPrice']").val(unitPrice);

    }
    totalPrice()
})

$("div.reservation-wrap").on("click", ".btn-amount-plus", function () {
    const buttonType = $(this).data("btn");
    const qtyInpElement = $(this).siblings(`input[name='${buttonType}Qty']`);
    let priceTxtElement = $(`span.${buttonType}-price`);
    const priceInpElement = priceTxtElement.siblings(`input[name='${buttonType}Price']`);

    let currentPrice;
    let unitPrice;
    if (buttonType === "product") {
        unitPrice = priceTxtElement.data("unitprice");
    } else if (buttonType === "option") {
        unitPrice = $(".reserver-option").data("unitprice");
    }
    const currentQty = Number.parseInt(qtyInpElement.val());
    qtyInpElement.val(currentQty + 1)

    currentPrice = Number.parseInt(priceTxtElement.text());
    priceTxtElement.text(currentPrice + unitPrice);
    priceInpElement.val(currentPrice + unitPrice);
    totalPrice()
})

$("div.reservation-wrap").on("click", ".btn-amount-minus", function () {
    const buttonType = $(this).data("btn");
    const qtyInpElement = $(this).siblings(`input[name='${buttonType}Qty']`);

    let priceTxtElement = $(`span.${buttonType}-price`);
    const priceInpElement = priceTxtElement.siblings(`input[name='${buttonType}Price']`);

    let currentPrice;
    let unitPrice;
    if (buttonType === "product") {
        unitPrice = priceTxtElement.data("unitprice");
    } else if (buttonType === "option") {
        unitPrice = $(".reserver-option").data("unitprice");
    }

    if (Number.parseInt(qtyInpElement.val()) <= 1) {
        return;
    }

    const currentQty = Number.parseInt(qtyInpElement.val());
    qtyInpElement.val(currentQty - 1)

    currentPrice = Number.parseInt(priceTxtElement.text());
    priceTxtElement.text(currentPrice - unitPrice);
    priceInpElement.val(currentPrice - unitPrice);
    totalPrice()
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
    totalPrice()
});

function totalPrice() {
    const productPrice = Number.parseInt($("input[name='productPrice']").val());
    const optionPrice = Number.parseInt($("input[name='optionPrice']").val());
    const usedPoint = $("input[name='usedPoint']").val();
    $("input[name='totalPrice']").val(0)

    let totalPrice = productPrice + optionPrice;

    if (usedPoint !== '') {
        totalPrice -= Number.parseInt(usedPoint);
    }

    $("span.total-price").text(totalPrice);
    $("input[name='totalPrice']").val(totalPrice);
}

$("#payBtn").click(function (){
    let frm = $("#frm")
    console.log(frm);
})