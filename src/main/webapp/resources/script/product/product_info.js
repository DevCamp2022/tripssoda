//출발일이 다른 동일투어 상태표시
$(document).ready(function(){
  let len = $(".dto-length").val(); //list길이

  for(let i=0; i<len; i++) {
    let curr = $(".currentMember-"+i).val();
    let min = $(".minMember-"+i).val();
    let max = $(".maxMember-"+i).val();
    let gap = $(".min-current-"+i).val();

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

let pListSize = $(".pListSize").val();
// let cnt = 1;
// let starter = 1;


//출발일이 다른 동일투어 prev, next 버튼이벤트
$(document).ready(function(){

  for(let i=0; i<pListSize; i++) {
    let scheduleSize = $(".scheduleSize-"+i).val();
    let cntArr = [];
    cntArr.push(i);

    let starterArr = [];
    starterArr.push(i);

    for(let j=0; j<scheduleSize; j++) {
      if(j>2){
        $(".schedule-wrap-" + i + "-" + j).hide();
      }
    }
    cntArr[i] = 1;
    function handleList() {
      let starter = 1;
      let from = cnt;
      let to = cnt+2;
      while(starter<=pListSize) {
        
        if(starter>=from && starter<=to) {
          $(".date-wrapper-" + starter).show();
        } else {
          $(".date-wrapper-" + starter).hide();
        }
        starter++
      }
    }

    $(".nextBtn-"+i).click(function() {
      if(cnt==(scheduleSize-2)) return;
      cntArr[i]++;
      starterArr[i] = 1;
      handleList();
    })

    $(".prevBtn-"+i).click(function() {
      if(cnt==1) return;
      cntArr[i]--;
      starterArr[i] = 1;
      handleList();
    })
  }
})

$(document).ready(function(){
  for(let i=0; i<pListSize; i++){
    let app = $(".hid-approval-"+i).val();
    $(".approval-"+i).text("지랄");
    if(app == "0") {
      str = "승인대기중";
      $(".approval-"+i).text(str);
      $(".approval-"+i).css("background-color","orange");
    }

    else if(app == "1") {
      str = "판매중";
      $(".approval-"+i).text(str);
      $(".approval-"+i).css("background-color","navy");
    }

    else if(app == "2") {
      str = "반려";
      $(".approval-"+i).text(str);
      $(".approval-"+i).css("background-color","gray");
    }
  }
})
