//next, prev버튼이벤트(현재 사용안하고있음)
$(document).ready(function(){
  for(let i=0; i<10; i++) {
    if(i>4){
      $(".div-editor-" + i).hide();
    }
  }
})

let cnt = 1;
let starter = 1;
function handleList() {
  let from = cnt;
  let to = cnt+3;
  while(starter<=10){
    
    if(starter>=from && starter<=to) {
      $(".div-editor-" + starter).show();
    } else {
      $(".div-editor-" + starter).hide();
    }
    starter++
  }
}

$(".nextBtn").click(function(){
  if(cnt==2) return;
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

//카테고리 버튼 클릭 이벤트(스크롤이동)
//에디터 388, 프라이빗 748
$(document).on('click', '#category-editor', function(){
  window.scrollTo(0, 388);

});

$(document).on('click', '#category-private', function(){
  window.scrollTo(0, 748);

});