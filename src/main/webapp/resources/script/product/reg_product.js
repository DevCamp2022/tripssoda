//textarea -> ckeditor
CKEDITOR.replace('prdIntro',
    {filebrowserUploadUrl:'/ckeditor/fileUploader'
});
CKEDITOR.replace('courseIntro',
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

//포함사항, 미포함사항, 추가사항 항목 추가 버튼이벤트
$("#add-inclusion").click(function(){
    let s = '<input type="text" name="inclusion" id="inclusion"/><br>';
    $(".td-inclusion").append(s);
});

$("#add-exclusion").click(function(){
    let s = '<input type="text" name="exclusion" id="exclusion"/><br>';
    $(".td-exclusion").append(s);
});

$("#add-additionalInfo").click(function(){
    let s = '<input type="text" name="additionalInfo" id="additionalInfo"/><br>';
    $(".td-additionalInfo").append(s);
});


//상품옵션-선택형-옵션추가 이벤트
$(document).on("click",".add-option", function() {
    let numOfParent = parseInt($(this).parent().attr('class').replace(/[^0-9]/g,''));

    let s = '';
    s += "<div class='content-wrapper'>";
    s += "<input name='regProductDtoList[" + numOfParent + "].content'>";
    s += "<input name='regProductDtoList[" + numOfParent + "].price'>";
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



//상품옵션 type선택 이벤트
let optionCnt = 1;
$(document).ready(function(){
    for(let i=0; i<optionCnt; i++){
        $(".type_ans_" + i).hide();

        $("input[name='regProductDtoList[" + i + "].type']").change(function(){
            if($("input[name='regProductDtoList[" + i + "].type']:checked").val() == "S") {
                $(".type_ans_" + i).hide();
                $(".type_sel_" + i).show();
            } else if ($("input[name='regProductDtoList[" + i + "].type']:checked").val() == "A") {
                $(".type_sel_" + i).hide();
                $(".type_ans_" + i).show();
            }
        })
    }
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
    s += '<input type="radio" name="regProductDtoList[' + optionCnt + '].type" value="S" checked>선택형';
    s += '<input type="radio" name="regProductDtoList[' + optionCnt + '].type" value="A">단답형';
    s += '<div class="type_sel_' + optionCnt + '">';
    s += '<table>';
    s += '<tr>';
    s += '<th>옵션명</th>';
    s += '<th>옵션 가격</th>';
    s += '</tr>';
    s += '<tr>';
    s += '<td>';
    s += '<input type="text" name="regProductDtoList[' + optionCnt + '].name">';
    s += '</td>';
    s += '<td class="td-option-content_'+optionCnt+'">';
    s += '<div class="option-content_'+optionCnt+'" name="regProductDtoList[' + optionCnt + '].content">';
    s += '<input type="text" name="regProductDtoList[' + optionCnt + '].content">';
    s += '<input type="number" name="regProductDtoList[' + optionCnt + '].price">';
    s += '<input type="text" name="regProductDtoList[' + optionCnt + '].orderNo" value="'+optionCnt+'">';
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
    s += '<input type="text" name="regProductDtoList[' + optionCnt + '].name">';
    s += '<input type="text" name="regProductDtoList[' + optionCnt + '].orderNo" value="'+optionCnt+'">';
    s += '</td>';
    s += '</tr>';
    s += '</table>';
    s += '</div>';
    s += '<button type="button" class="option-delBtn">상품옵션삭제</button>';
    s += '</div>';
    $(".product-option").append(s);

    $(document).ready(function(){
        for(let i=0; i<optionCnt; i++){
            $("input[name='regProductDtoList[" + i + "].type']").change(function(){
                if($("input[name='regProductDtoList[" + i + "].type']:checked").val() == "S") {
                    $(".type_ans_" + i).hide();
                    $(".type_sel_" + i).show();
                } else if ($("input[name='regProductDtoList[" + i + "].type']:checked").val() == "A") {
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

function valid() {
    if($("#title").val() == "") {
        alert("상품제목을 입력해 주세요");
        return false;
    }
    // 파일업로더 구현 후 추가할 것
    // if($("#thumbnail").val() == "") {
    //     alert("썸네일 이미지를 첨부해 주세요.");
    //     return false;
    // }

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

    console.log("모든 유효성을 통과함");
    return true;
}

