const URLSearch = new URLSearchParams(location.search);


//키워드 스플릿
$(document).ready(function(){
  if($("#keywords").val() != '' && $("#keywords").val() != null) {
    let keyArr = $("#keywords").val().split(',');
    for(let i=0; i<keyArr.length; i++) {
      let kw = document.createElement('span');
      kw.innerHTML = "#" + keyArr[i];
      kw.className = "detail-keyword";

      $(".keywords-wrap").append(kw);
    }
  }
});

//포함 스플릿
$(document).ready(function(){
  if($("#inclusion").val() != '' && $("#inclusion").val() != null) {
    let keyArr = $("#inclusion").val().split(',');
    // console.log('keyArr',keyArr);
    for(let i=0; i<keyArr.length; i++) {
      let kw = document.createElement('p');
      kw.style.color = "#6A6A6A";
      kw.innerHTML = "• " + keyArr[i];
      // kw.className = "detail-keyword";

      $(".inclusion-content").append(kw);
    }
  }
});

//미포함 스플릿
$(document).ready(function(){
  if($("#exclusion").val() != '' && $("#exclusion").val() != null) {
    let keyArr = $("#exclusion").val().split(',');
    console.log('exclusion.keyArr',keyArr);
    for(let i=0; i<keyArr.length; i++) {
      let kw = document.createElement('p');
      kw.style.color = "#6A6A6A";
      kw.innerHTML = "• " + keyArr[i];
      // kw.className = "detail-keyword";

      $(".exclusion-content").append(kw);
    }
  }
});

//추가정보 스플릿
$(document).ready(function(){
  if($("#additionalInfos").val() != '' && $("#additionalInfos").val() != null) {
    let keyArr = $("#additionalInfos").val().split(',');
    // console.log('keyArr',keyArr);
    for(let i=0; i<keyArr.length; i++) {
      let kw = document.createElement('p');
      kw.style.color = "#6A6A6A";
      kw.innerHTML = "• " + keyArr[i];
      // kw.className = "detail-keyword";

      $(".additionalInfo-content").append(kw);
    }
  }
});

//필수안내 스플릿
$(document).ready(function(){
  if($("#mandatoryGuidance").val() != '' && $("#mandatoryGuidance").val() != null) {
    let keyArr = $("#mandatoryGuidance").val().split(',');
    // console.log('keyArr',keyArr);
    for(let i=0; i<keyArr.length; i++) {
      let kw = document.createElement('p');
      kw.style.color = "#6A6A6A";
      kw.innerHTML = "• " + keyArr[i];
      // kw.className = "detail-keyword";

      $(".mandatoryGuidance-content").append(kw);
    }
  }
});

//환불정책 스플릿
$(document).ready(function(){
  if($("#refundPolicy").val() != '' && $("#refundPolicy").val() != null) {
    let keyArr = $("#refundPolicy").val().split(',');
    // console.log('keyArr',keyArr);
    for(let i=0; i<keyArr.length; i++) {
      let kw = document.createElement('p');
      kw.style.color = "#6A6A6A";
      kw.innerHTML = "• " + keyArr[i];
      // kw.className = "detail-keyword";

      $(".refundPolicy-content").append(kw);
    }
  }
});

$(document).ready(function(){
  if($("#currentMember").val() == '' || $("#currentMember").val() == null) {
    $(".show-currentMember").html('0');
  }

  if($("#min-current").val() > 0 && $("#minMember").val() != 1) {
    let str = $("#min-current").val() + "명 더 구매시";
    $(".show-min-current").html(str);
  }

  if($("#min-current").val() > 0 && $("#minMember").val() == 1) {
    let str = "지금 구매 시";
    $(".show-min-current").html(str);
  }

  if($("#min-current").val() <= 0 && $("#currentMember").val() < $("maxMember").val()) {
    let str = "지금 구매 시";
    $(".show-min-current").html(str);
  }



  if($("#list-currentMember").val() == '' || $("#list-currentMember").val() == null) {
    $(".show-list-currentMember").html('0');
  }

  if($("#list-min-current").val() > 0 && $("#list-minMember").val() != 1) {
    let str = $("#list-min-current").val() + "명 더 구매시";
    $(".show-list-min-current").html(str);
  }

  if($("#list-min-current").val() > 0 && $("#list-minMember").val() == 1) {
    let str = "지금 구매 시";
    $(".show-list-min-current").html(str);
  }

  if($("#list-min-current").val() <= 0 && $("#list-currentMember").val() < $("#list-maxMember").val()) {
    let str = "지금 구매 시";
    $(".show-list-min-current").html(str);
  }

});

//사이드 리모콘 애니메이션
$(document).ready(function(){
  var currentPosition = parseInt($("#chase").css("top"));
  $(window).scroll(function() {
  // var currentPosition = 677;
  var scroll_top = $(document).scrollTop();
  if(scroll_top>677) {
      var position = $(window).scrollTop(); 
      $("#chase").stop().animate({"top":position+currentPosition+(-630)+"px"},500);
    }
  });
});

//출발일이 다른 동일투어 prev, next 버튼이벤트
$(document).ready(function(){
  for(let i=1; i<(len+1); i++) {
    if(i>3){
      $(".date-wrapper-" + i).hide();
    }
  }
})
let len = $("#list-length").val();
let cnt = 1;
let starter = 1;
function handleList() {
  let from = cnt;
  let to = cnt+2;
  while(starter<=len){
    
    if(starter>=from && starter<=to) {
      $(".date-wrapper-" + starter).show();
    } else {
      $(".date-wrapper-" + starter).hide();
    }
    starter++
  }
}

$(".nextBtn").click(function(){
  if(cnt==(len-2)) return;
  cnt++;
  starter = 1;
  handleList();
})

$(".prevBtn").click(function(){
  if(cnt==1) return;
  cnt--;
  starter = 1;
  handleList();
})

$("#approvalSelection").on("change", function (){
  if($(this).val()==0){
    $("#reason").css("display","");
  } else  {
    $("#reason").css("display","none");
  }
})


$("#btnApprove").click(function (){

  const reason = $("#reason").val();
  const approval = $("#approvalSelection").val();

  if (approval==="0" && reason===""){
    alert("사유를 작성하세요.")
    return;
  }


  $.ajax({
    url: "/admin/product/approval",
    method: "GET",
    data: {productId: URLSearch.get("productId"), reason: reason, approval:approval},
    success: function (result) {
      if (result===success){
        alert("처리가 완료되었습니다.")

      }
    },
    error: function (result) {
      alert(result);
    }
  });
})