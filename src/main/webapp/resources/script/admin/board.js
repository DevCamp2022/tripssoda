$('#boardTitle').on('click',function(){
    $.ajax({
        type: 'get',
        url: '/admin/boardContent?id=1',
        success: function(data){
            console.log('data='+data);
            $('#boardContent').html(data);
        },
        error: function(err){
            console.log(err);
        }
    })
})

//개별삭제
$('#bDelBtn').click(function(){

    var form=document.boardListForm;
    var boo=false;

    if(document.getElementsByName('row_check').length>0){
        for(var i=0; i<document.getElementsByName('row_check').length; i++){
            if(document.getElementsByName('row_check')[i].checked==true){
                    boo = true;
                    break;
            }
        }
    }

    if(!boo){
        alert("삭제할 항목을 체크해주세요");
    }else{
        if(!confirm("정말로 삭제하시겠습니까?")){
            return;
        }
        else{
            var checkArr = new Array();
            var menuCode = $('#menuCode').attr("data-menu-code");

            $(".row_check:checked").each(function(){
                checkArr.push($(this).attr("data-user-id"));
            });
            console.log("길이는??" + checkArr.length);

            for(var i=0; i<checkArr.length; i++){
                console.log("뭐들었냥"+checkArr[i]);
            }

            $.ajax({
                type: "post",
                url : '/admin/removeRows',
                traditional: true,
                data : { idArr : checkArr ,
                         menuCode : menuCode },
                success : function(data){
                    alert("글이 삭제되었습니다");
                    location.href = "/admin/boardList";
                },
                error : function(){
                    console.log(err);
                }
            })
        }
    }
})



$('table.combined-list-tb').on('click', "#writeBtn", function() {
    location.href = '/admin/write';

});



//전체삭제

//전체선택

// $('#all_check').change(function(){
//     console.log("sddfdlkfdjlfdf");
//     alert("kk");
//     var is_check = $(this).is(':checked');
//     console.log('is_check =' + is_check);
//
//     $('.row_check').prop('checked',is_check);
// })


