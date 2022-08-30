$("#send-email").click(function (){
    $.ajax({
        url:"/admin/email/send",
        method:"post",
        // headers: {"Content-Type": "text/plain; charset=UTF-8"},
        // data:JSON.stringify($("#email-sender-frm").serialize()),
        data:`receiver=${$("select[name='receiver']").val()}
             &title=${$("input[name='title']").val()}
             &content=${$("textarea[name='content']").val()}`,
        success:function (result){
            console.log(result);
        },
        error:function (result){
            alert(result);
        }
    })
})