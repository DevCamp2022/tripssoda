<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<title>여행관심사 선택</title>
<link rel="stylesheet" href="<c:url value="/css/user/selectInterest.css"/>">

<div class="main">
    <form class="contents" action="" method="post" onsubmit="return formCheck()">
        <h2 class="title">여행 관심사를 선택해 주세요.</h2>
        <p class="sub-title">(대표 관심사를 포함한 선호 관심사 3개, 중복선택 불가)</p>

        <div class="interest-list">
            <c:forEach var="tourInterestCodeDto" items="${tourInterestCodeDtoList}" varStatus="order">
                <div class="interest">
                    <img class="img" src="${pageContext.request.contextPath}/user/tourInterestImg/tourInterest${order.count}.jpg">
                    <div class="interest-info-wrap">
                        <h3 class="keyword"><span>#</span> ${tourInterestCodeDto.tourIntrKeyword}</h3>
                        <p class="interest-info">${tourInterestCodeDto.tourIntrDescription}</p>
                    </div>
                    <p class="interest-code">${tourInterestCodeDto.tourIntrCode}</p>
                </div>
            </c:forEach>
        </div>
    </form>
    <div class="button-wrap">
        <button class="register-btn">${pageContext.request.session.getAttribute('id') == null ? "회원가입 완료" : "여행관심사 수정"}</button>
    </div>
</div>
<script>

    let interestArr = [];
    let $interestArr = [];

    function formCheck() {
        let firstInterest = interestArr[0];
        let secondInterest = interestArr[1];
        let thirdInterest = interestArr[2];

        if (firstInterest == undefined || secondInterest == undefined || thirdInterest == undefined) {
            alert("관심사를 3개 선택해주세요")
            return false;
        } else if (firstInterest == secondInterest || firstInterest == thirdInterest || secondInterest == thirdInterest) {
            alert("중복되는 관심사를 선택할 수 없습니다. 다시 선택해주세요");
            return false;
        }
        return true;
    }


    $(".interest").on("click", function () {
        // 관심사 코드를 저장할 변수
        let interest = $(this).children("p[class=interest-code]").text();
        // 관심사 코드가 배열에 존재하는지 체크하는 변수
        let chk = interestArr.indexOf(interest);
        // 클릭한 관심사 요소를 저장하는 변수
        let $interest = $(this);


        if(chk != -1) {
            console.log(chk);

            interestArr.splice(chk, 1); // 값이 있으면 배열에서 삭제
            $interestArr.splice(chk, 1);

            console.log(interestArr);
            console.log($interestArr);

            $(".interest").css("background","none");
            $(".interest").css("color", "black");
            for(let i = 0; i < $interestArr.length; i++) {
                if(i == 0) {
                    $($interestArr[i]).css("background", "green");
                    $($interestArr[i]).css("color", "white");
                    // $($interestArr[i]).removeClass("red");
                    // $($interestArr[i]).removeClass("blue");
                    // $($interestArr[i]).addClass("green");
                } else if (i == 1) {
                    $($interestArr[i]).css("background", "blue");
                    $($interestArr[i]).css("color", "white");
                    // $($interestArr[i]).removeClass("red");
                    // $($interestArr[i]).removeClass("green");
                    // $($interestArr[i]).addClass("blue");
                } else if (i == 2) {
                    $($interestArr[i]).css("background", "red");
                    $($interestArr[i]).css("color", "black");
                    // $($interestArr[i]).removeClass("green");
                    // $($interestArr[i]).removeClass("blue");
                    // $($interestArr[i]).addClass("red");
                }
            }

        } else if(interestArr.length < 3) {
            interestArr.push(interest); // 값이 없고 배열 길이가 3보다 작으면 배열의 마지막에 추가
            $interestArr.push($interest);

            console.log(interestArr);
            console.log($interestArr);
            if(interestArr[0] == interest) {
                $(this).css("background", "green");
                $(this).css("color", "white");
                // $interestArr[0].addClass("green");
            } else if (interestArr[1] == interest) {
                $(this).css("background", "blue");
                $(this).css("color", "white");
                // $interestArr[1].addClass("blue");
            } else if (interestArr[2] == interest) {
                $(this).css("background", "red");
                $(this).css("color", "white");
                // $interestArr[2].addClass("red");
            }
        } else {
            alert("관심사는 최대 3개까지 선택가능");
        }

    });

    $(".register-btn").on("click", function () {
       let form = $(".contents");
        form.attr("action", "<c:url value='/register/submit'/>" + "?firstInterest=" + interestArr[0] + "&secondInterest=" + interestArr[1] + "&thirdInterest=" + interestArr[2]);
        form.attr("method", "post");
        if(formCheck())
            form.submit();
    });

</script>
