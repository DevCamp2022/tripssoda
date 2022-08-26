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

//사이드 리모콘 애니메이션
$(document).ready(function(){
  var currentPosition = parseInt($("#chase").css("top"));
  $(window).scroll(function() {
  // var currentPosition = 677;
  var scroll_top = $(document).scrollTop();
  if(scroll_top>0) {
      var position = $(window).scrollTop(); 
      $("#chase").stop().animate({"top":position+currentPosition+(-100)+"px"},500);
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

//출발일이 다른 동일투어 상태표시
$(document).ready(function(){
  $(".show-list-startDate-0").append("<span style='color:rgb(0, 206, 124);'>(현재)</span>");
  let len = $("#list-length").val(); //list길이

  for(let i=0; i<len; i++) {
    let curr = $(".list-currentMember-"+i).val();
    let min = $(".list-minMember-"+i).val();
    let max = $(".list-maxMember-"+i).val();
    let gap = $(".list-min-current-"+i).val();

    console.log('curr',curr);
    if(gap <= 0 && curr < max) {
      $(".show-list-min-current-"+i).text("지금 구매시");
    } else if(gap > 0 && gap == 1) {
      $(".show-list-min-current-"+i).text("지금 구매시");
    } else if(gap > 0 && gap != 1) {
      $(".show-list-min-current-"+i).text(gap+"명 더 모이면");
    } else if(gap <= 0 && curr == max) {
      $(".show-list-min-current-"+i).text("마감되었습니다.");
      $(".show-list-min-current-"+i).css('color','gray');
      $(".show-list-result-"+i).remove();
    }
  }


})