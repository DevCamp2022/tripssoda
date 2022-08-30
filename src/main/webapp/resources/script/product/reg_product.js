$(document).ready(function(){
    $(document).bind('keydown',function(e){
        if ( e.keyCode == 188) {
            e.preventDefault();
            e.returnValue = false;
        }
    });
});

let optCnt = 0;

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
	if (window.event.keyCode == 13) { // 엔터키가 눌렸을 때
        let keyword = $(".gen-key").val().replace(/(\s*)/g, "");
        if(keyword == '') {
            $(".gen-key").val("").focus();
            return;
        }
        let s = "";
        s += "<span class='hashes'>" + keyword;
        s += "<input type='hidden' class='hashes' name='keyword' value='" + keyword + "'>";
        s += "<span class='delBtn'>&nbsp;<span class='material-icons' style='font-size:12px;cursor:pointer;'>clear</span></span></span>";        
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
    s += '&nbsp;<button type="button" class="btnDel manGuide-delBtn">삭제</button><br></div>';
    $(".td-manGuide").append(s);
});

$("#add-refund").click(function(){
    let s = '<div class="refundPolicy">';
    s += '<input type="text" name="refundPolicy" id="refundPolicy"/>';
    s += '&nbsp;<button type="button" class="btnDel refundPolicy-delBtn">삭제</button><br></div>';
    $(".td-refund").append(s);
});

$("#add-inclusion").click(function(){
    let s = '<div class="inclusion">';
    s += '<input type="text" name="inclusion" id="inclusion"/>';
    s += '&nbsp;<button type="button" class="btnDel inclusion-delBtn">삭제</button><br></div>';
    $(".td-inclusion").append(s);
});

$("#add-exclusion").click(function(){
    let s = '<div class="exclusion">';
    s += '<input type="text" name="exclusion" id="exclusion"/>';
    s += '&nbsp;<button type="button" class="btnDel exclusion-delBtn">삭제</button><br></div>';
    $(".td-exclusion").append(s);
});

$("#add-additionalInfo").click(function(){
    let s = '<div class="additionalInfo">';
    s += '<input type="text" name="additionalInfo" id="additionalInfo"/>';
    s += '&nbsp;<button type="button" class="btnDel additionalInfo-delBtn">삭제</button><br></div>';
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
$(".pickOption-addBtn").click(function(){
    let s = "";
    s += "<tr class='tr-pickupOption'>";
    s += "<td class='td-additional-option' colspan='3'>";
    s += "<input type='text' name='pickupOption'>&nbsp;";
    s += "<button type='button' class='btnDel pickupOption-delBtn'>삭제</button>";
    s += "</td>";
    s += "</tr>";
    $(".table-pickupInfo").append(s);
})
$(document).on("click",".tr-pickupOption .pickupOption-delBtn",function(){
    let idx = $(".tr-pickupOption .pickupOption-delBtn").index(this);
    $(".tr-pickupOption .pickupOption-delBtn").eq(idx).parent().parent().remove();
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

    let scheduleCnt = 0;
    while(startDate <= endDate) {

        let realStart = startDate.toISOString().split("T")[0];

        let s = "";
        s += "<tr class='tr-schedule'>";
        s += "<td>" + (scheduleCnt + 1) + "</td>";
        s += "<td>";
        s += realStart + " " + startDate.toString().slice(0, 3);
        s += "<input type='hidden' name='regProductScheduleListDto[" + scheduleCnt + "].scheduleStartDate' value='" + realStart + "'>";
        s += "</td>";
        s += "<td>";
        s += "<input type='text' class='schedulePrice_"+scheduleCnt+"' name='regProductScheduleListDto[" + scheduleCnt + "].schedulePrice' required='required'>";
        s += "</td>";
        s += "<td>";
        s += "<input type='text' class='scheduleMinMember_"+scheduleCnt+"' name='regProductScheduleListDto[" + scheduleCnt + "].scheduleMinMember' required='required'>";
        s += "</td>";
        s += "<td>";
        s += "<input type='text' class='scheduleMaxMember_"+scheduleCnt+"' name='regProductScheduleListDto[" + scheduleCnt + "].scheduleMaxMember' required='required'>";
        s += "</td>";
        s += "<td><button class='btnDel schedule-delBtn'>삭제</button></td>";
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
    if($("#sel-category").val() == "" || $("#sel-category").val() == undefined || $("#sel-category").val() == null) {
        alert("카테고리를 선택해 주세요.");
        return false;
    }

    if($("input[name=keyword]").val() == "" || $("input[name=keyword]").val() == undefined) {
        alert("검색키워드를 입력해 주세요.");
        return false;
    }

    if($("#minMember").val() - $("#maxMember").val() < 0) {
        alert("총 기간이 최소 1일 이상이어야 합니다.");
        return false;
    }

    // if(CKEDITOR.instances.prdIntro.getData() =='' || CKEDITOR.instances.prdIntro.getData().length ==0) {
    //     alert("상품소개를 입력해 주세요.");
    //     return false;
    // }

    if(CKEDITOR.instances.courseIntro.getData() =='' || CKEDITOR.instances.courseIntro.getData().length ==0) {
        alert("코스소개란을 작성해 주세요.");
        return false;
    }

    if(CKEDITOR.instances.meetingPoint.getData() =='' || CKEDITOR.instances.meetingPoint.getData().length ==0) {
        alert("만나는 장소를 입력해 주세요.");
        return false;
    }

    if($("#dayCnt").val() <= 0) {
        alert("여행 시작일이 여행 종료일보다 뒤에 놓일 수 없습니다.");
        return false;
    }


    return true;
}


//상품옵션 추가하기
$(document).on("click",".add-tr-option",function(){
    let numOfParent = parseInt($(this).parent().parent().parent().parent().attr('class').replace(/[^0-9]/g,''));
    console.log('num',numOfParent);
    let str = "";
        str += '<tr class="tr-option">';
        str += '<td width="40%">';
        str += '</td>';
        str += '<td width="30%" class="td-option-content-'+numOfParent+'">';
        str += '<input class="input-option-s-content_'+numOfParent+'" type="text" name="regProductOptionListDto['+numOfParent+'].content">';
        str += '</td>';
        str += '<td width="20%" class="td-option-price-'+numOfParent+'">';
        str += '<input class="input-option-s-price_'+numOfParent+'" type="text" name="regProductOptionListDto['+numOfParent+'].price">';
        str += '</td>';
        str += '<td>';
        str += '<button class="btnDel del-tr-option" type="button">옵션삭제</button>';
        str += '</td>';
        str += '</tr>';
    $(".table-type-s-" + numOfParent).append(str);
})

//상품옵션 삭제하기
$(document).on("click",".table-option .option-delBtn",function(){
    let idx = $(".table-option .option-delBtn").index(this);
    $(".table-option .option-delBtn").eq(idx).parent().parent().parent().parent().remove();
});

//상품옵션의 옵션 삭제하기
$(document).on("click",".tr-option .del-tr-option",function(){
    let idx = $(".tr-option .del-tr-option").index(this);
    $(".tr-option .del-tr-option").eq(idx).parent().parent().remove();
});


//상품옵션 타입 선택이벤트
$(document).ready(function(){
    for(let i=0; i<optCnt; i++) {
        $("input[name='regProductOptionListDto["+i+"].type']").change(function(){
            if($("input[name='regProductOptionListDto["+i+"].type']:checked").val() == "S"){
                $(".table-type-s-" + i).show();
                $(".table-type-a-" + i).hide();
                $(".input-option-a-name_"+i).attr("disabled",true);
                $(".input-option-s-name_"+i).attr("disabled",false);
                $(".input-option-s-content_"+i).attr("disabled",false);
                $(".input-option-s-price_"+i).attr("disabled",false);
            } 
            else if($("input[name='regProductOptionListDto["+i+"].type']:checked").val() == "A"){
                $(".table-type-s-" + i).hide();
                $(".table-type-a-" + i).show();
                $(".input-option-a-name_"+i).attr("disabled",false);
                $(".input-option-s-name_"+i).attr("disabled",true);
                $(".input-option-s-content_"+i).attr("disabled",true);
                $(".input-option-s-price_"+i).attr("disabled",true);
            }
        })
    }
});


//상품옵션 추가하기 버튼이벤트
$(".add-option-btn").click(function(){
    let str = ""
        str += '<table class="table table-option">';
        str += '<tr>';
        str += '<th>옵션#'+(parseInt(optCnt)+1)+'</th>'
        str += '<th>';
        str += '<div class="btn-group">';
        str += '<input type="radio" id="option-type-s-'+optCnt+'" class="btn-check option-type-s-'+optCnt+'" name="regProductOptionListDto['+optCnt+'].type" value="S" checked>'
        str += '<label class="btn btn-outline-warning" for="option-type-s-'+optCnt+'">선택형</label>';
        str += '<input type="radio" id="option-type-a-'+optCnt+'" class="btn-check option-type-a-'+optCnt+'" name="regProductOptionListDto['+optCnt+'].type" value="A">';
        str += '<label class="btn btn-outline-warning" for="option-type-a-'+optCnt+'">단답형</label>';
        // str += '</div>';
        str += '&nbsp;&nbsp;&nbsp;&nbsp;<button class="btnDel option-delBtn" type="button">상품옵션 제거</button>';
        str += '</div>';
        str += '</th>';
        str += '</tr>';
        str += '<tr>';
        str += '<td colspan="2">';
        str += '<table class="table table-type-s-'+optCnt+'">';
        str += '<tr>';
        str += '<th>옵션명</th>';
        str += '<th>옵션</th>';
        str += '<th>옵션가격</th>';
        str += '<th>비고</th>';
        str += '</tr>';
        str += '<tr class="del-tr-option">';
        str += '<td width="40%">';
        str += '<input class="input-option-s-name_'+optCnt+'" type="text" name="regProductOptionListDto['+optCnt+'].name">';
        str += '</td>';
        str += '<td width="30%"class="td-option-content-'+optCnt+'">';
        str += '<input class="input-option-s-content_'+optCnt+'" type="text" name="regProductOptionListDto['+optCnt+'].content">';
        str += '</td>';
        str += '<td width="20%"class="td-option-price-'+optCnt+'">';
        str += '<input class="input-option-s-price_'+optCnt+'" type="text" name="regProductOptionListDto['+optCnt+'].price">';
        str += '</td>';
        str += '<td>';


        str += '<button class="btnAdd add-tr-option" type="button" class="add-option">옵션추가</button>';
        str += '<input type="hidden" name="regProductOptionListDto[' + optCnt + '].orderNo" value="'+optCnt+'">';
        str += '</td>';
        str += '</tr>';
        str += '</table>';
        str += '<table class="table table-type-a-'+optCnt+'">';
        str += '<tr>';
        str += '<th>옵션명</th>';
        str += '</tr>';
        str += '<tr>';
        str += '<td>';
        str += '<input class="input-option-a-name_'+optCnt+'" type="text" name="regProductOptionListDto['+optCnt+'].name">';
        str += '</td>';
        str += '</tr>';
        str += '</table>';
        str += '</td>';
        str += '</tr>';
        str += '</table>';

        $(document).ready(function(){
            for(let i=0; i<optCnt; i++) {
                $("input[name='regProductOptionListDto["+i+"].type']").change(function(){
                    if($("input[name='regProductOptionListDto["+i+"].type']:checked").val() == "S"){
                        $(".table-type-s-" + i).show();
                        $(".table-type-a-" + i).hide();
                        $(".input-option-a-name_"+i).attr("disabled",true);
                        $(".input-option-s-name_"+i).attr("disabled",false);
                        $(".input-option-s-content_"+i).attr("disabled",false);
                        $(".input-option-s-price_"+i).attr("disabled",false);
                    } 
                    else if($("input[name='regProductOptionListDto["+i+"].type']:checked").val() == "A"){
                        $(".table-type-s-" + i).hide();
                        $(".table-type-a-" + i).show();
                        $(".input-option-a-name_"+i).attr("disabled",false);
                        $(".input-option-s-name_"+i).attr("disabled",true);
                        $(".input-option-s-content_"+i).attr("disabled",true);
                        $(".input-option-s-price_"+i).attr("disabled",true);
                    }
                })
            }
        });

    $(".product-option").append(str);
    $(".table-type-s-" + optCnt).show();
    $(".table-type-a-" + optCnt).hide();
    $(".input-option-a-name_"+optCnt).attr("disabled",true);
    $(".input-option-s-name_"+optCnt).attr("disabled",false);
    $(".input-option-s-content_"+optCnt).attr("disabled",false);
    $(".input-option-s-price_"+optCnt).attr("disabled",false);
    optCnt++;
})

//썸네일 파일명 바인딩
$("#uploadThumb").on('change',function(){
    let fileName = $("#uploadThumb").val();
    $(".uploadThumb").attr('value',fileName);
});