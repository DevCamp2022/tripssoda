//폰번호 양식에 맞게 조합하기
$(document).ready(function(){
    let tel = $(".managerTel").val();
    let one = tel.substring(0, 3);
    let two = tel.substring(3, 7);
    let three = tel.substring(7, 11);
    let str = one+"-"+two+"-"+three;
    
    $(".tel").text(str);
})

$(document).ready(function(){
    //다운로드 링크
    let dwn = $(".attachment").val();
    let dwnStr = dwn.substr(36);
    $(".down-name").text(dwnStr);

    //상품유형 스플릿
    let productType = $("#productType").val();
    productTypeArr = productType.split(',');
    for(let i=0; i<productTypeArr.length; i++) {
        if(productTypeArr[i] == "C002") {
            let pt = "프라이빗투어";
            let str = "<span class='productType-wrap'>" + pt + "</span>";
            $(".show-productType").append(str);
        }
        else if(productTypeArr[i] == "C003") {
            let pt = "소규모 데이투어";
            let str = "<span class='productType-wrap'>" + pt + "</span>";
        $(".show-productType").append(str);
        }
        else if(productTypeArr[i] == "C004") {
            let pt = "버스데이투어";
            let str = "<span class='productType-wrap'>" + pt + "</span>";
        $(".show-productType").append(str);
        }
        else if(productTypeArr[i] == "C005") {
            let pt = "이색투어";
            let str = "<span class='productType-wrap'>" + pt + "</span>";
        $(".show-productType").append(str);
        }
    }

    //파트너쉽 체결여부
    let ops = $("#onPartnership").val();
    if(ops == '0' || ops == 0) {
        let str = "<span class='awaiting'>심사대기중</span>";
        $(".show-onPartnership").html(str);
    } else {
        let str = "<span class='approved'>협력관계</span>";
        $(".show-onPartnership").html(str);
    }
})

//회원정보수정 버튼이벤트
$(".update-info").click(function(){
    let ans = "파트너 정보를 수정하시면 재심사과정을 거치게 됩니다. 진행하시려면 [확인]버튼을 눌러주세요."
    if(confirm(ans)) {
        location.href = "/partner/info/update";
    } return;
})
