let msg = $("input[name=msg]").val();
if(msg=="LIST_ERR")  alert("게시물 목록을 가져오는데 실패했습니다. 다시 시도해 주세요.");
if(msg=="READ_ERR")  alert("삭제되었거나 없는 게시물입니다.");
if(msg=="DEL_ERR")   alert("삭제되었거나 없는 게시물입니다.");
if(msg=="DEL_OK")    alert("성공적으로 삭제되었습니다.");
if(msg=="MOD_OK")    alert("성공적으로 수정되었습니다.");