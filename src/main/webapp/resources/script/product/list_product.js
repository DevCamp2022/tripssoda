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