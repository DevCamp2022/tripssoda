

//thumbnail upload
$("#uploadThumb").change(function(){
    //정규표현식
    // var reg = /(.*?)\/(jpg|jpeg|png|bmp)$/;
    var f = $(this)[0].files[0]; //현재 선택한 파일
    // if(!f.type.match(reg)){
    //     alert("유효한 확장자가 아닙니다.");
    //     return;
    // }
    
    var reader = new FileReader();
    reader.onload = function(e){
        let newImg = document.createElement('img');
        newImg.setAttribute("src", e.target.result);
        newImg.setAttribute("width",500);
        $(".div-thumbnail").html(newImg);
    }
    reader.readAsDataURL($(this)[0].files[0]);
});

//textarea -> ckeditor
CKEDITOR.replace('prdIntro',
    {filebrowserUploadUrl:'/ckeditor/fileUploader'
});
CKEDITOR.replace('courseIntro',
    {filebrowserUploadUrl:'/ckeditor/fileUploader'
});
CKEDITOR.replace('meetingPoint',
    {filebrowserUploadUrl:'/ckeditor/fileUploader'
});

//검색키워드 key이벤트
function handleKeyword() {
	if (window.event.keyCode == 13) {
    	// 엔터키가 눌렸을 때
        let s = "";
        s += "<span class='hashes'>" + $(".gen-key").val()
        s += "<input type='text' class='hashes' name='keyword' value='" + $(".gen-key").val() + "'>";
        // 나중에 'X'키 이쁘게 바꿀것!!
        s += "<span class='delBtn'>X</span></span>";
        $(".word-list").append(s);
        $(".gen-key").val("").focus();
    }
}

//keyword 삭제이벤트
$(document).on("click",".hashes .delBtn",function(){
    let idx = $(".hashes .delBtn").index(this);
    $(".hashes .delBtn").eq(idx).parent().remove();
});

//필수안내, 환불정책, 포함사항, 미포함사항, 추가사항 항목 추가 버튼이벤트
$("#add-manGuide").click(function(){
    let s = '<div class="manGuide">';
    s += '<input type="text" name="mandatoryGuidance"/>';
    s += '<button type="button" class="manGuide-delBtn">삭제하기</button><br></div>';
    $(".td-manGuide").append(s);
});

$("#add-refund").click(function(){
    let s = '<div class="refundPolicy">';
    s += '<input type="text" name="refundPolicy" id="refundPolicy"/>';
    s += '<button type="button" class="refundPolicy-delBtn">삭제하기</button><br></div>';
    $(".td-refund").append(s);
});

$("#add-inclusion").click(function(){
    let s = '<div class="inclusion">';
    s += '<input type="text" name="inclusion" id="inclusion"/>';
    s += '<button type="button" class="inclusion-delBtn">삭제하기</button><br></div>';
    $(".td-inclusion").append(s);
});

$("#add-exclusion").click(function(){
    let s = '<div class="exclusion">';
    s += '<input type="text" name="exclusion" id="exclusion"/>';
    s += '<button type="button" class="exclusion-delBtn">삭제하기</button><br></div>';
    $(".td-exclusion").append(s);
});

$("#add-additionalInfo").click(function(){
    let s = '<div class="additionalInfo">';
    s += '<input type="text" name="additionalInfo" id="additionalInfo"/>';
    s += '<button type="button" class="additionalInfo-delBtn">삭제하기</button><br></div>';
    $(".td-additionalInfo").append(s);
});

//필수안내, 환불정책, 포함사항, 미포함사항, 추가사항 항목 삭제 이벤트
$(document).on("click",".manGuide .manGuide-delBtn",function(){
    let idx = $(".manGuide .manGuide-delBtn").index(this);
    $(".manGuide .manGuide-delBtn").eq(idx).parent().remove();
});

$(document).on("click",".refundPolicy .refundPolicy-delBtn",function(){
    let idx = $(".refundPolicy .refundPolicy-delBtn").index(this);
    $(".refundPolicy .refundPolicy-delBtn").eq(idx).parent().remove();
});

$(document).on("click",".inclusion .inclusion-delBtn",function(){
    let idx = $(".inclusion .inclusion-delBtn").index(this);
    $(".inclusion .inclusion-delBtn").eq(idx).parent().remove();
});

$(document).on("click",".exclusion .exclusion-delBtn",function(){
    let idx = $(".exclusion .exclusion-delBtn").index(this);
    $(".exclusion .exclusion-delBtn").eq(idx).parent().remove();
});

$(document).on("click",".additionalInfo .additionalInfo-delBtn",function(){
    let idx = $(".additionalInfo .additionalInfo-delBtn").index(this);
    $(".additionalInfo .additionalInfo-delBtn").eq(idx).parent().remove();
});

//픽업정보 타입선택 이벤트
$("input[name='pickupType']").change(function(){
    if($("input[name='pickupType']:checked").val() == "S") {
        console.log("픽업타입 : 선택형");
        $(".tr-pickupOption").show();
        $("input[name=pickupOption]").attr("disabled", false);
    };
    if($("input[name='pickupType']:checked").val() == "A") {
        console.log("픽업타입 : 단답형");
        $(".tr-pickupOption").hide();
        $("input[name=pickupOption]").attr("disabled", true);
    };
    if($("input[name='pickupType']:checked").val() == "F") {
        console.log("픽업타입 : 고정형");
        $(".tr-pickupOption").hide();
        $("input[name=pickupOption]").attr("disabled", true);
    };
})
// $(document).on("click", ".pickOption-addBtn", function(){
$(".pickOption-addBtn").click(function(){
    let s = "";
    s += "<tr class='optional-pickupOption'>"
    s += "<td class='td-additional-option' colspan='3'>";
    s += "<input type='text' name='pickupOption'>";
    s += "<button type='button' class='pickupOption-delBtn'>삭제</button>";
    s += "</td>";
    s += "</tr>";
    $(".table-pickupInfo").append(s);
})
$(document).on("click",".optional-pickupOption .pickupOption-delBtn",function(){
    let idx = $(".optional-pickupOption .pickupOption-delBtn").index(this);
    $(".optional-pickupOption .pickupOption-delBtn").eq(idx).parent().remove();
});

//상품옵션-선택형-옵션추가 이벤트
$(document).on("click",".add-option", function() {
    let numOfParent = parseInt($(this).parent().attr('class').replace(/[^0-9]/g,''));

    let s = '';
    s += "<div class='content-wrapper'>";
    s += "<input name='regProductOptionListDto[" + numOfParent + "].content'>";
    s += "<input name='regProductOptionListDto[" + numOfParent + "].price'>";
    s += '<button type="button" class="content-delBtn">옵션삭제</button>';
    s += '<br></div>';
    $('.option-content_' + numOfParent).append(s);

    
    //test
    var a = $(this).parent();
    console.log(a.attr('class'));
    console.log('numOfparent',numOfParent);
})

//상품옵션 선택형 옵션 삭제이벤트
$(document).on("click",".content-wrapper .content-delBtn",function(){
    let idx = $(".content-wrapper .content-delBtn").index(this);
    $(".content-wrapper .content-delBtn").eq(idx).parent().remove();
});

//초기 상품옵션 넣기 버튼이벤트
$(".init-option-addBtn").click(function(){
    $(this).hide();
    $(".init-option-delBtn").show();
    $(".init-product-option").show();
    $("#init-type-s").attr("disabled",false);
    $("#init-type-a").attr("disabled",false);
})

$(".init-option-delBtn").click(function(){
    $(this).hide();
    $(".init-option-addBtn").show();
    $(".init-product-option").hide();
    $("#init-type-s").attr("disabled",true);
    $("#init-type-a").attr("disabled",true);
});

//상품옵션 type선택 이벤트
let optionCnt = 1;
$(document).ready(function(){
    $(".init-product-option").hide();
    $(".type_ans_0").hide();
    $(".init-option-delBtn").hide();
    $("#init-type-s").attr("disabled",true);
    $("#init-type-a").attr("disabled",true);
    $("input[name='regProductOptionListDto[0].type']").change(function(){
        if($("input[name='regProductOptionListDto[0].type']:checked").val() == "S") {
            // $("#init-type-a").attr("disabled",true);
            // $("#init-type-s").attr("disabled",false);
            $(".input-option-a-name_0").attr("disabled",true);
            $(".input-option-s-name_0").attr("disabled",false);
            $(".input-option-s-content_0").attr("disabled",false);
            $(".input-option-s-price_0").attr("disabled",false);
            $(".type_ans_0").hide();
            $(".type_sel_0").show();
        } else if ($("input[name='regProductOptionListDto[0].type']:checked").val() == "A") {
            // $("#init-type-a").attr("disabled",false);
            // $("#init-type-s").attr("disabled",true);
            $(".input-option-a-name_0").attr("disabled",false);
            $(".input-option-s-name_0").attr("disabled",true);
            $(".input-option-s-content_0").attr("disabled",true);
            $(".input-option-s-price_0").attr("disabled",true);
            $(".type_sel_0").hide();
            $(".type_ans_0").show();
        }
    })
});

//test
// $("input[name='regProductDtoList[0].type']").change(function(){
//     let test = $("input[name='regProductDtoList[0].type']:checked").val();
//     alert(test);
// })


//상품옵션 추가하기
//let optionCnt = 1; //위에서 선언중
$("#add-product-option").click(function(){
    //let s = '<table><tr><th>옵션명</th><th>옵션</th></tr><tr><td><input type="text" name="name"></td><td class="td-option-content"><input type="text" name="content"><button type="button" id="add-option">옵션추가</button><br></td></tr><tr><td><button type="button" id="add-product-option">상품옵션추가하기</button></td></tr></table>';
    let s = '';
    s += '<div class="option-wrap">'
    s += '<input type="radio" name="regProductOptionListDto[' + optionCnt + '].type" value="S" checked>선택형';
    s += '<input type="radio" name="regProductOptionListDto[' + optionCnt + '].type" value="A">단답형';
    s += '<div class="type_sel_' + optionCnt + '">';
    s += '<table>';
    s += '<tr>';
    s += '<th>옵션명</th>';
    s += '<th>옵션 가격</th>';
    s += '</tr>';
    s += '<tr>';
    s += '<td>';
    s += '<input type="text" class="input-option-s-name_' + optionCnt + '" name="regProductOptionListDto[' + optionCnt + '].name">';
    s += '</td>';
    s += '<td class="td-option-content_'+optionCnt+'">';
    s += '<div class="option-content_'+optionCnt+'" name="regProductOptionListDto[' + optionCnt + '].content">';
    s += '<input type="text" class="input-option-s-content_' + optionCnt + '" name="regProductOptionListDto[' + optionCnt + '].content">';
    s += '<input type="number" class="input-option-s-price_' + optionCnt + '" name="regProductOptionListDto[' + optionCnt + '].price">';
    s += '<input type="text" name="regProductOptionListDto[' + optionCnt + '].orderNo" value="'+optionCnt+'">';
    s += '<button type="button" class="add-option">옵션추가</button><br>';
    s += '</div>';
    s += '</td>';
    s += '</tr>';
    s += '</table>';
    s += '</div>';

    s += '<div class="type_ans_' + optionCnt + '">';
    s += '<table>';
    s += '<tr>';
    s += '<th>옵션명</th>';
    s += '</tr>';
    s += '<tr>';
    s += '<td>';
    s += '<input type="text" class="input-option-a-name_' + optionCnt + '" name="regProductOptionListDto[' + optionCnt + '].name">';
    s += '<input type="text" name="regProductOptionListDto[' + optionCnt + '].orderNo" value="'+optionCnt+'">';
    s += '</td>';
    s += '</tr>';
    s += '</table>';
    s += '</div>';
    s += '<button type="button" class="option-delBtn">상품옵션삭제</button>';
    s += '</div>';
    $(".product-option").append(s);

    $(document).ready(function(){
        for(let i=0; i<optionCnt; i++){
            $("input[name='regProductOptionListDto[" + i + "].type']").change(function(){
                if($("input[name='regProductOptionListDto[" + i + "].type']:checked").val() == "S") {
                    $(".input-option-a-name_"+i).attr("disabled",true);
                    $(".input-option-s-name_"+i).attr("disabled",false);
                    $(".input-option-s-content_"+i).attr("disabled",false);
                    $(".input-option-s-price_"+i).attr("disabled",false);
                    $(".type_ans_" + i).hide();
                    $(".type_sel_" + i).show();
                } else if ($("input[name='regProductOptionListDto[" + i + "].type']:checked").val() == "A") {
                    $(".input-option-a-name_"+i).attr("disabled",false);
                    $(".input-option-s-name_"+i).attr("disabled",true);
                    $(".input-option-s-content_"+i).attr("disabled",true);
                    $(".input-option-s-price_"+i).attr("disabled",true);
                    $(".type_sel_" + i).hide();
                    $(".type_ans_" + i).show();
                }
            })
        }
    });

    $(".type_ans_" + optionCnt).hide();

    optionCnt++;
})

//상품옵션 삭제하기
$(document).on("click",".option-wrap .option-delBtn",function(){
    let idx = $(".option-wrap .option-delBtn").index(this);
    $(".option-wrap .option-delBtn").eq(idx).parent().remove();
    console.log("=======================");
});

//상품일정(start-end)선택 후 일정list 출력
$(document).on("change","#startDate",function(){
    if($("#endDate").val() == null || $("#endDate").val() == '') {
        return
    };
    getScheduleList();
})

$(document).on("change","#endDate",function(){
    if($("#startDate").val() == null || $("#startDate").val() == '') {
        return
    };
    getScheduleList();
})

function getScheduleList() {
    $(".table-schedule").html("");
    let v = "";
    v += "<tr>";
    v += "<th>번호</th>";
    v += "<th>시작여행일</th>";
    v += "<th>가격</th>";
    v += "<th>모집 최소인원</th>";
    v += "<th>모집 최대인원</th>";
    v += "<th>일정 삭제</th>";
    $(".table-schedule").html(v);
    

    const start = $("#startDate").val();
    const end = $("#endDate").val();

    const startDate = new Date(start);
    const endDate = new Date(end);

    const durMilis = endDate.getTime() - startDate.getTime();
    const durDays = durMilis/(1000*60*60*24);

    $('input[name=dayCnt]').attr('value',`${durDays+1}`);

    // const req = $("#reqTime").val();
    // const reqMilis = new Date(req).getTime();

    let scheduleCnt = 0;
    while(startDate <= endDate) {

        let realStart = startDate.toISOString().split("T")[0];

        let s = "";
        s += "<tr class='tr-schedule'>";
        s += "<td>" + (scheduleCnt + 1) + "</td>";
        s += "<td>";
        s += realStart + " " + startDate.toString().slice(0, 3);
        s += "<input type='text' name='regProductScheduleListDto[" + scheduleCnt + "].scheduleStartDate' value='" + realStart + "'>";
        s += "</td>";
        s += "<td>";
        s += "<input type='text' class='schedulePrice_"+scheduleCnt+"' name='regProductScheduleListDto[" + scheduleCnt + "].schedulePrice'>";
        s += "</td>";
        s += "<td>";
        s += "<input type='text' class='scheduleMinMember_"+scheduleCnt+"' name='regProductScheduleListDto[" + scheduleCnt + "].scheduleMinMember'>";
        s += "</td>";
        s += "<td>";
        s += "<input type='text' class='scheduleMaxMember_"+scheduleCnt+"' name='regProductScheduleListDto[" + scheduleCnt + "].scheduleMaxMember'>";
        s += "</td>";
        s += "<td><span class='schedule-delBtn'>X<span></td>";
        s += "</tr>";
        $(".table-schedule").append(s);
		startDate.setDate(startDate.getDate() + 1);
        scheduleCnt++;
	}
}

//상품상세일정 삭제하기
$(document).on("click",".tr-schedule .schedule-delBtn",function(){
    let idx = $(".tr-schedule .schedule-delBtn").index(this);
    $(".tr-schedule .schedule-delBtn").eq(idx).parent().parent().remove();
});


//상품상세일정 첫번째 일정 입력값을 전체 기본값으로 설정
$(document).on("keyup",".schedulePrice_0",function(){
    let len = $('input[name=dayCnt]').val();
    let repeater = $(".schedulePrice_0").val();
    for(let i=1; i<=len; i++) {
        $(".schedulePrice_"+i+"").attr('value',repeater);
    }
});
$(document).on("keyup",".scheduleMinMember_0",function(){
    let len = $('input[name=dayCnt]').val();
    let repeater = $(".scheduleMinMember_0").val();
    for(let i=1; i<=len; i++) {
        $(".scheduleMinMember_"+i+"").attr('value',repeater);
    }
});
$(document).on("keyup",".scheduleMaxMember_0",function(){
    let len = $('input[name=dayCnt]').val();
    let repeater = $(".scheduleMaxMember_0").val();
    for(let i=1; i<=len; i++) {
        $(".scheduleMaxMember_"+i+"").attr('value',repeater);
    }
});





function valid() {
    if($("#title").val() == "") {
        alert("상품제목을 입력해 주세요");
        return false;
    }

    if($("#thumbnail").val() == "") {
        alert("썸네일 이미지를 첨부해 주세요.");
        return false;
    }

    if($("#reqTime").val() == "") {
        alert("여행소요시간을 입력해 주세요.");
        return false;
    }

    if($("#serviceRegion").val() == "") {
        alert("서비스 지역 입력해 주세요.");
        return false;
    }

    if($("#keyword").val() == "") {
        alert("검색키워드를 입력해 주세요.");
        return false;
    }

    if($("#dayCnt").val() == "") {
        alert("총 기간을 설정해 주세요.");
        return false;
    }

    if($("#minMember").val() == "") {
        alert("모집 최소인원을 입력해 주세요.");
        return false;
    }

    if($("#maxMember").val() == "") {
        alert("모집 최대인원을 입력해 주세요.");
        return false;
    }

    if($("#prdIntro").val() == "") {
        alert("상품소개란을 작성해 주세요.");
        return false;
    }

    if($("#courseIntro").val() == "") {
        alert("코스소개란을 작성해 주세요.");
        return false;
    }

    if($("#meetingPoint").val() == "") {
        alert("만나는 장소를 입력해 주세요.");
        return false;
    }

    if($("#mandatoryGuidance").val() == "") {
        alert("필수안내를 입력해 주세요.");
        return false;
    }

    if($("#refundPolicy").val() == "") {
        alert("환불정책을 입력해 주세요.");
        return false;
    }

    return true;
}

