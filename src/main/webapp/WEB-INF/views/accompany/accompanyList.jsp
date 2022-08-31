<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>동행메인페이지</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css">
    <link rel="stylesheet" href="<c:url value='/css/accompany/accompanyList.css'/>">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
</head>
<body>
<input type="hidden" name="msg" value="${msg}">
<c:if test="${mode ne 'waiting'}">
    <form name="frm" method="get" action="<c:url value='/accompany/list'/>">
</c:if>
<c:if test="${mode eq 'waiting'}">
    <form name="frm" method="get" action="<c:url value='/accompany/waiting'/>">
</c:if>
<div class="main-img">

</div>
<div class="main-group">
    <div class="select-region-box">
            <select id="area1" name="area1" class="area1" onChange="cat1_change(this.value,area2)" required>
                <option disabled>-선택-</option>
                <option value='1' selected>동아시아</option>
                <option value='2'>동남아시아</option>
                <option value='3'>서남아시아</option>
                <option value='4'>유럽</option>
                <option value='5'>아메리카</option>
                <option value='6'>오세아니아</option>
                <option value='7'>아프리카</option>
            </select>
            <select id="area2" name="area2" class="area2" onChange="cat2_change(this.value,area3)" required>
                <option disabled="disabled">-선택-</option>
                <option value='8' selected>한국</option>
                <option value='9'>일본</option>
                <option value='10'>홍콩</option>
                <option value='11'>마카오</option>
                <option value='12'>대만</option>
                <option value='13'>중국</option>
                <option value='14'>몽골</option>
            </select>
            <select id="area3" name="area3" class="area3" required>
                <option disabled>-선택-</option>
                <option value='51' selected>서울</option>
                <option value='52'>강원도</option>
                <option value='53'>제주도</option>
                <option value='54'>부산</option>
                <option value='55'>경기도</option>
                <option value='56'>인천</option>
                <option value='57'>충청도</option>
                <option value='58'>경상도</option>
                <option value='59'>전라도</option>
            </select>
        <input type="submit" class="search-button" value="검색">
    </div>

    <div class="sort-bar2">
        <a href="<c:url value='/accompany/write'/>">
        <div class="new-write-btn">
            글쓰기
        </div>
        </a>
        <div class="sort-text">
<%--            정렬--%>
        </div>
        <div class="sort-button">
            <select class="search-option" name="option" onchange="this.form.submit()">
                <option value="none" disabled selected>정렬선택</option>
                <option value="time">최신순</option>
                <option value="view">조회순</option>
            </select>
        </div>
        <c:if test="${mode ne 'waiting'}">
            <div class="only-recruit" onclick="location.href='<c:url value="/accompany/waiting"/>'">
            모집중인 글만 보기
        </div>
        </c:if>
        <c:if test="${mode eq 'waiting'}">
            <div class="only-recruit" onclick="location.href='<c:url value="/accompany/list"/>'">
                모든 글 보기
            </div>
        </c:if>
    </div>
    <div class="list-group">
        <c:forEach var="accompanyDto" items="${list}">
            <a class="a-tag" href="<c:url value='/accompany/read?id=${accompanyDto.id}&page=${ph.page}&pageSize=${ph.pageSize}'/>">
                <div class="list-one">
                    <div class="list-thumbnail2">
                        <img class="list-thumbnail" src="/image/thumbnail/${accompanyDto.thumbnail}" alt="">
                        <div class="thumbnail-text"><div class="location-img-area"><img src="/image/accompany/location-icon.svg"></div><div class="location-text">${accompanyDto.cityName}</div></div>
                    </div>
                    <div class="list-title-line">
                        <div class="recruit-on-off">
                            <c:if test="${accompanyDto.status eq 0}">
                                모집중
                            </c:if>
                            <c:if test="${accompanyDto.status eq 1}">
                                <span class="recruit-off-text">지난여행</span>
                            </c:if>
                        </div>
                        <div class="list-title">
                            ${accompanyDto.title}
                        </div>
                    </div>
                    <div class="list-content-line">
                        ${accompanyDto.content}
                    </div>
                    <div class="list-nickname-line">
                        <div class="profile-img">
                            <img class="profile-img2" src="${pageContext.request.contextPath}/user/profileImg/${accompanyDto.profileImg}">
                        </div>
                        <div class="nickname">
                            ${accompanyDto.nickname}
                        </div>
                        <div class="view-cnt-line">
                            <div class="view-cnt-icon">

                            </div>
                            <div class="view-cnt">
                                    ${accompanyDto.viewCnt}
                            </div>
                        </div>
                    </div>
                </div>
            </a>
        </c:forEach>
    </div>
    <%-- 페이징 --%>

    <c:if test="${mode ne 'waiting'}">
            <div class="paging-container">
                <div class="paging">
                    <%--  area3이 있을 때 --%>
                    <c:if test="${area3 ne null}">
                        <%-- option이 있을 때--%>
                        <c:if test="${option ne null}">
                            <c:if test="${ph.showPrev}">
                                <a class="paging-prev-next" href="<c:url value='/accompany/list?area3=${area3}&page=${ph.beginPage-1}&pageSize=${ph.pageSize}&option=${option}'/>">&lt;</a>
                            </c:if>
                            <c:forEach var="i" begin="${ph.beginPage}" end="${ph.endPage}">
                                <a class="paging-active" href="<c:url value='/accompany/list?area3=${area3}&page=${i}&pageSize=${ph.pageSize}&option=${option}'/>">${i}</a>
                            </c:forEach>
                            <c:if test="${ph.showNext}">
                                <a class="paging-prev-next" href="<c:url value='/accompany/list?area3=${area3}&page=${ph.endPage+1}&pageSize=${ph.pageSize}&option=${option}'/>">&gt;</a>
                            </c:if>
                        </c:if>
                        <%-- option이 없을 때 --%>
                        <c:if test="${option eq null}">
                            <c:if test="${ph.showPrev}">
                                <a class="paging-prev-next" href="<c:url value='/accompany/list?area3=${area3}&page=${ph.beginPage-1}&pageSize=${ph.pageSize}'/>">&lt;</a>
<%--                                <a class="paging-prev-next" href="<c:url value='/accompany/list?page=${ph.beginPage-1}&pageSize=${ph.pageSize}'/>">&lt;</a>--%>
                            </c:if>
                            <c:forEach var="i" begin="${ph.beginPage}" end="${ph.endPage}">
                                <a class="paging-active" href="<c:url value='/accompany/list?area3=${area3}&page=${i}&pageSize=${ph.pageSize}'/>">${i}</a>
<%--                                <a class="paging-active" href="<c:url value='/accompany/list?page=${i}&pageSize=${ph.pageSize}'/>">${i}</a>--%>
                            </c:forEach>
                            <c:if test="${ph.showNext}">
                                <a class="paging-prev-next" href="<c:url value='/accompany/list?area3=${area3}&page=${ph.endPage+1}&pageSize=${ph.pageSize}'/>">&gt;</a>
<%--                                <a class="paging-prev-next" href="<c:url value='/accompany/list?page=${ph.endPage+1}&pageSize=${ph.pageSize}'/>">&gt;</a>--%>
                            </c:if>
                        </c:if>
                    </c:if>
                    <%-- area3이 없을 때 --%>
                    <c:if test="${area3 eq null}">
                        <%-- option이 없을 때 --%>
                        <c:if test="${option eq null}">
                            <c:if test="${ph.showPrev}">
                                <a class="paging-prev-next" href="<c:url value='/accompany/list?page=${ph.beginPage-1}&pageSize=${ph.pageSize}'/>">&lt;</a>
                            </c:if>
                            <c:forEach var="i" begin="${ph.beginPage}" end="${ph.endPage}">
                                <a class="paging-active" href="<c:url value='/accompany/list?page=${i}&pageSize=${ph.pageSize}'/>">${i}</a>
                            </c:forEach>
                            <c:if test="${ph.showNext}">
                                <a class="paging-prev-next" href="<c:url value='/accompany/list?page=${ph.endPage+1}&pageSize=${ph.pageSize}'/>">&gt;</a>
                            </c:if>
                        </c:if>
                        <%-- option이 있을 때 --%>
                        <c:if test="${option ne null}">
                            <c:if test="${ph.showPrev}">
                                <a class="paging-prev-next" href="<c:url value='/accompany/list?page=${ph.beginPage-1}&pageSize=${ph.pageSize}&option=${option}'/>">&lt;</a>
                            </c:if>
                            <c:forEach var="i" begin="${ph.beginPage}" end="${ph.endPage}">
                                <a class="paging-active" href="<c:url value='/accompany/list?page=${i}&pageSize=${ph.pageSize}&option=${option}'/>">${i}</a>
                            </c:forEach>
                            <c:if test="${ph.showNext}">
                                <a class="paging-prev-next" href="<c:url value='/accompany/list?page=${ph.endPage+1}&pageSize=${ph.pageSize}&option=${option}'/>">&gt;</a>
                            </c:if>
                         </c:if>
                    </c:if>
                </div>
            </div>
    </c:if>
<%--    <a class="paging-prev-next" href="<c:url value='/accompany/waiting?area3=${area3}&page=${ph.beginPage-1}&pageSize=${ph.pageSize}'/>">&lt;</a>--%>
    <c:if test="${mode eq 'waiting'}">
        <div class="paging-container">
            <div class="paging">
                    <%--  area3이 있을 때 --%>
                <c:if test="${area3 ne null}">
                    <%-- option이 있을 때--%>
                    <c:if test="${option ne null}">
                        <c:if test="${ph.showPrev}">
                            <a class="paging-prev-next" href="<c:url value='/accompany/waiting?area3=${area3}&page=${ph.beginPage-1}&pageSize=${ph.pageSize}&option=${option}'/>">&lt;</a>
                        </c:if>
                        <c:forEach var="i" begin="${ph.beginPage}" end="${ph.endPage}">
                            <a class="paging-active" href="<c:url value='/accompany/waiting?area3=${area3}&page=${i}&pageSize=${ph.pageSize}&option=${option}'/>">${i}</a>
                        </c:forEach>
                        <c:if test="${ph.showNext}">
                            <a class="paging-prev-next" href="<c:url value='/accompany/waiting?area3=${area3}&page=${ph.endPage+1}&pageSize=${ph.pageSize}&option=${option}'/>">&gt;</a>
                        </c:if>
                    </c:if>
                    <%-- option이 없을 때 --%>
                    <c:if test="${option eq null}">
                        <c:if test="${ph.showPrev}">
                            <a class="paging-prev-next" href="<c:url value='/accompany/waiting?area3=${area3}&page=${ph.beginPage-1}&pageSize=${ph.pageSize}'/>">&lt;</a>
                            <%--                                <a class="paging-prev-next" href="<c:url value='/accompany/list?page=${ph.beginPage-1}&pageSize=${ph.pageSize}'/>">&lt;</a>--%>
                        </c:if>
                        <c:forEach var="i" begin="${ph.beginPage}" end="${ph.endPage}">
                            <a class="paging-active" href="<c:url value='/accompany/waiting?area3=${area3}&page=${i}&pageSize=${ph.pageSize}'/>">${i}</a>
                            <%--                                <a class="paging-active" href="<c:url value='/accompany/list?page=${i}&pageSize=${ph.pageSize}'/>">${i}</a>--%>
                        </c:forEach>
                        <c:if test="${ph.showNext}">
                            <a class="paging-prev-next" href="<c:url value='/accompany/waiting?area3=${area3}&page=${ph.endPage+1}&pageSize=${ph.pageSize}'/>">&gt;</a>
                            <%--                                <a class="paging-prev-next" href="<c:url value='/accompany/list?page=${ph.endPage+1}&pageSize=${ph.pageSize}'/>">&gt;</a>--%>
                        </c:if>
                    </c:if>
                </c:if>
                    <%-- area3이 없을 때 --%>
                <c:if test="${area3 eq null}">
                    <%-- option이 없을 때 --%>
                    <c:if test="${option eq null}">
                        <c:if test="${ph.showPrev}">
                            <a class="paging-prev-next" href="<c:url value='/accompany/waiting?page=${ph.beginPage-1}&pageSize=${ph.pageSize}'/>">&lt;</a>
                        </c:if>
                        <c:forEach var="i" begin="${ph.beginPage}" end="${ph.endPage}">
                            <a class="paging-active" href="<c:url value='/accompany/waiting?page=${i}&pageSize=${ph.pageSize}'/>">${i}</a>
                        </c:forEach>
                        <c:if test="${ph.showNext}">
                            <a class="paging-prev-next" href="<c:url value='/accompany/waiting?page=${ph.endPage+1}&pageSize=${ph.pageSize}'/>">&gt;</a>
                        </c:if>
                    </c:if>
                    <%-- option이 있을 때 --%>
                    <c:if test="${option ne null}">
                        <c:if test="${ph.showPrev}">
                            <a class="paging-prev-next" href="<c:url value='/accompany/waiting?page=${ph.beginPage-1}&pageSize=${ph.pageSize}&option=${option}'/>">&lt;</a>
                        </c:if>
                        <c:forEach var="i" begin="${ph.beginPage}" end="${ph.endPage}">
                            <a class="paging-active" href="<c:url value='/accompany/waiting?page=${i}&pageSize=${ph.pageSize}&option=${option}'/>">${i}</a>
                        </c:forEach>
                        <c:if test="${ph.showNext}">
                            <a class="paging-prev-next" href="<c:url value='/accompany/waiting?page=${ph.endPage+1}&pageSize=${ph.pageSize}&option=${option}'/>">&gt;</a>
                        </c:if>
                    </c:if>
                </c:if>
            </div>
        </div>
    </c:if>
</div>
</form>
    <script>
        var cat1_num = new Array(1,2,3,4,5,6,7);
        var cat1_name = new Array('동아시아','동남아시아','서남아시아','유럽','아메리카','오세아니아','아프리카');

        var cat2_num = new Array();
        var cat2_name = new Array();

        cat2_num[1] = new Array(8,9,10,11,12,13,14);
        cat2_name[1] = new Array('한국','일본','홍콩','마카오','대만','중국','몽골');

        cat2_num[2] = new Array(15,16,17,18,19,20,21);
        cat2_name[2] = new Array('싱가포르','베트남','태국','인도네시아','말레이시아','필리핀','라오스');

        cat2_num[3] = new Array(22,23,24,25,26,27);
        cat2_name[3] = new Array('아랍에미리트','오만','인도','네팔','이스라엘','카타르');

        cat2_num[4] = new Array(28,29,30,31,32,33,34);
        cat2_name[4] = new Array('프랑스','이탈리아','터키','스페인','영국','오스트리아','네덜란드');

        cat2_num[5] = new Array(35,36,37,38,39,40,41);
        cat2_name[5] = new Array('미국','캐나다','멕시코','페루','볼리비아','칠레','아르헨티나');

        cat2_num[6] = new Array(42,43);
        cat2_name[6] = new Array('호주','뉴질랜드');

        cat2_num[7] = new Array(44,45,46,47,48,49,50);
        cat2_name[7] = new Array('이집트','남아프리카공화국','탄자니아','에티오피아','케냐','나미비아','모로코');


        var cat3_num = new Array();
        var cat3_name = new Array();

        cat3_num[1] = new Array(51,52,53,54,55,56,57,58,59);
        cat3_name[1] = new Array('서울','강원도','제주도','부산','경기도','인천','충청도','경상도','전라도');

        cat3_num[2] = new Array(60,61,62,63,64,65,66,67);
        cat3_name[2] = new Array('도쿄','오사카','후쿠오카','오키나와','나고야','교토','홋카이도','히로시마');

        cat3_num[3] = new Array();
        cat3_num[3][0] = 68;
        cat3_name[3] = new Array('홍콩');

        cat3_num[4] = new Array();
        cat3_num[4][0] = 69;
        cat3_name[4] = new Array('마카오');

        cat3_num[5] = new Array(70,71,72);
        cat3_name[5] = new Array('타이페이','타이중','가오슝');

        cat3_num[6] = new Array(73,74,75,76,77,78,79,80,81,82);
        cat3_name[6] = new Array('상하이','베이징','칭다오','청두','광저우','하이난','항저우','장가계','충칭','서안');

        cat3_num[7] = new Array();
        cat3_num[7][0] = 83;
        cat3_name[7] = new Array('울란바토르');

        cat3_num[8] = new Array();
        cat3_num[8][0] = 84;
        cat3_name[8] = new Array('싱가포르');

        cat3_num[9] = new Array(85,86,87,88,89,90,91,92,93);
        cat3_name[9] = new Array('호치민','하노이','후에','호이안','다낭','푸꾸옥','달랏','나트랑','사파');

        cat3_num[10] = new Array(94,95,96,97,98,99,100,101,102,103);
        cat3_name[10] = new Array('방콕','파타야','치앙마이','푸켓','코사무이','끄라비','후아힌','코창','피피섬','치앙라이');

        //11
        cat3_num[11] = new Array(104,105,106,107,108,109,110);
        cat3_name[11] = new Array('발리','자카르타','롬복','바탐','족자카르타','반둥','수라바야');

        cat3_num[12] = new Array(111,112,113,114,115,116);
        cat3_name[12] = new Array('쿠알라룸푸르','페낭','코타키나발루','랑카위','조호바루','켄팅 하이랜드');

        cat3_num[13] = new Array(117,118,119,120,121,122);
        cat3_name[13] = new Array('보라카이','마닐라','세부','팔라완','보홀','수빅 & 클락');

        cat3_num[14] = new Array(123,124,125);
        cat3_name[14] = new Array('루앙프라방','비엔티안','방비엥');

        cat3_num[15] = new Array(126,127);
        cat3_name[15] = new Array('두바이','아부다비');

        cat3_num[16] = new Array();
        cat3_num[16][0] = 128;
        cat3_name[16] = new Array('무스카트');

        cat3_num[17] = new Array(129,130,131,132,133,134);
        cat3_name[17] = new Array('뭄바이','델리','자이푸르','우다이푸르','바라나시','아그라');

        cat3_num[18] = new Array(135,136);
        cat3_name[18] = new Array('카트만두','포카라');

        cat3_num[19] = new Array(137,138);
        cat3_name[19] = new Array('예루살렘','텔아비브');

        cat3_num[20] = new Array();
        cat3_num[20][0] = 139;
        cat3_name[20] = new Array('도하');

        //21
        cat3_num[21] = new Array(140,141,142,143);
        cat3_name[21] = new Array('파리','니스','마르세유','알자스');

        cat3_num[22] = new Array(144,145,146,147,148,149);
        cat3_name[22] = new Array('로마','피렌체','베네치아','밀라노','나폴리','피사');

        cat3_num[23] = new Array(150,151);
        cat3_name[23] = new Array('이스탄불','카파도키아');

        cat3_num[24] = new Array(152,153,154,155,156,);
        cat3_name[24] = new Array('마드리드','바르셀로나','톨레도','세비야','그라나다');

        cat3_num[25] = new Array(157,158,159,160);
        cat3_name[25] = new Array('런던','에딘버러','멘체스터','리버풀');

        cat3_num[26] = new Array();
        cat3_num[26][0] = 161;
        cat3_name[26] = new Array('비엔나');

        cat3_num[27] = new Array();
        cat3_num[27][0] = 162;
        cat3_name[27] = new Array('암스테르담');

        cat3_num[28] = new Array(163,164,165,166,167,168,169,170,171,172,173,174,175);
        cat3_name[28] = new Array('뉴욕','라스베가스','로스앤젤레스','샌프란시스코','시카고','올랜도','필라델피아','마이애미','시애틀','보스턴','워싱턴 D.C.','샌디에이고','하와이');

        cat3_num[29] = new Array(176,177,178,179);
        cat3_name[29] = new Array('벤쿠버','토론토','캘거리','퀘백');

        cat3_num[30] = new Array();
        cat3_num[30][0] = 180;
        cat3_name[30] = new Array('칸쿤');

        //31
        cat3_num[31] = new Array();
        cat3_num[31][0] = 181;
        cat3_name[31] = new Array('리마');

        cat3_num[32] = new Array(182,183);
        cat3_name[32] = new Array('라파스','우유니');

        cat3_num[33] = new Array(184,185);
        cat3_name[33] = new Array('산티아고','산페드로데아타카마');

        cat3_num[34] = new Array();
        cat3_num[34][0] = 186;
        cat3_name[34] = new Array('부에노스아이레스');

        cat3_num[35] = new Array(187,188,189,190,191);
        cat3_name[35] = new Array('시드니','브리즈번','멜버른','케언즈','퍼스');

        cat3_num[36] = new Array(192,193,194,195);
        cat3_name[36] = new Array('퀸즈타운','오클랜드','로토루아','크라이스트처치');

        cat3_num[37] = new Array(196,197,198,199);
        cat3_name[37] = new Array('카이로','룩소르','아스완','후루가다');

        cat3_num[38] = new Array(200,201);
        cat3_name[38] = new Array('케이프타운','요하네스버그');

        cat3_num[39] = new Array(202,203,204,205);
        cat3_name[39] = new Array('아루샤','킬리만자로','다르에스살람','잔지바르');

        cat3_num[40] = new Array();
        cat3_num[40][0] = 206;
        cat3_name[40] = new Array('아디스아바바');

        //41
        cat3_num[41] = new Array();
        cat3_num[41][0] = 207;
        cat3_name[41] = new Array('나이로비');

        cat3_num[42] = new Array(208,209);
        cat3_name[42] = new Array('빈트후크','스와콥문트');

        cat3_num[43] = new Array(210,211,212);
        cat3_name[43] = new Array('카사블랑카','마라케시','페스');


        function cat1_change(key,sel){
            if(key == '') return;
            var name = cat2_name[key];
            var val = cat2_num[key];

            for(i=sel.length-1; i>=0; i--)
                sel.options[i] = null;
            sel.options[0] = new Option('-선택-','', '', 'true');
            for(i=0; i<name.length; i++){
                sel.options[i+1] = new Option(name[i],val[i]);
            }
        }

        function cat2_change(key,sel){
            if(key == '') return;
            var name = cat3_name[key-7];
            var val = cat3_num[key-7];

            for(i=sel.length-1; i>=0; i--)
                sel.options[i] = null;
            sel.options[0] = new Option('-선택-','', '', 'true');
            for(i=0; i<name.length; i++){
                sel.options[i+1] = new Option(name[i],val[i]);
            }
        }

    </script>
<script type="text/javascript" src="${pageContext.request.contextPath}/script/accompany/accompany_list.js"></script>
</body>
</html>