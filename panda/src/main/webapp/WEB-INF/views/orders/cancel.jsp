<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<script src="https://code.jquery.com/jquery-latest.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script>
        $(function () {
            $.datepicker.setDefaults({
                dateFormat: 'yy-mm-dd',
                showOtherMonths: true // 빈 공간에 현재월의 앞뒤월의 날짜를 표시
                    ,
                showMonthAfterYear: true // 년도 먼저 나오고, 뒤에 월 표시
                    ,
                changeYear: true // 콤보박스에서 년 선택 가능
                    ,
                changeMonth: true // 콤보박스에서 월 선택 가능
                    ,
                showOn: "button",

                buttonImage: "cal.png" // 버튼 이미지 경로
                    ,
                buttonImageOnly: true // 기본 버튼의 회색 부분을 없애고, 이미지만 보이게 함
                    ,
                buttonText: "선택" // 버튼에 마우스 갖다 댔을 때 표시되는 텍스트
                    ,
                yearSuffix: "년" // 달력의 년도 부분 뒤에 붙는 텍스트
                    ,
                monthNamesShort: ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10',
                        '11', '12'
                    ] // 달력의 월 부분 텍스트
                    ,
                monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월',
                        '10월', '11월', '12월'
                    ] // 달력의 월 부분 Tooltip 텍스트
                    ,
                dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'] // 달력의 요일 부분 텍스트
                    ,
                dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'] // 달력의
                    // 요일 부분
                    // Tooltip
                    // 텍스트
                    ,
                minDate: "-1Y" // 최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
                    ,
                maxDate: "0" // 최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)
            });

            $('#startDate').datepicker();
            $('#endDate').datepicker();
            $('#startDate').datepicker('setDate', 'today-1M');
            $('#endDate').datepicker('setDate', 'today');
            var target = $(".product, .order, .member, .promotion, .stat, .board");
            target.click(function () {
                $(this).next().toggle();
                $(this).parent().toggleClass("bc_w");
                target.not($(this)).next().hide();
                target.not($(this)).parent().removeClass("bc_w");
            });

            target.next().find("a").click(function () {
                $(this).addClass("a_bold");
                target.next().find("a").not($(this)).removeClass("a_bold");
                console.log(this);
            });
        });
    </script>
</head>
<style>
    .gBreak {
        display: inline-block;
        margin: 1px 0 0;
    }

    .ui-datepicker-trigger {
        width: 22px;
        height: 22px;
        margin-left: 5px;
        vertical-align: -3px;
        cursor: pointer;
    }

    .bc_g {
        background: #dedede;
    }

    ul,
    li {
        list-style: none;
    }

    #container {
        position: relative;
    }

    #sidebar {
        position: fixed;
        z-index: 201;
        top: 0;
        left: 0;
        width: 220px;
        height: 100%;
        margin-left: 30px;
        padding: 150px 0 0;
        box-sizing: border-box;
        vertical-align: top;
    }

    #sidebar .snbArea {
        display: flex;
        flex-direction: column;
        height: 100%;
    }

    #snb {
        margin: 0 0 auto;
        padding: 0;
    }

    #a {
        text-decoration: none;
        color: black;
        line-height: 50px;
    }

    #snb>li {
        position: relative;
    }

    #snb>li>ul {
        margin-bottom: 10px;
    }

    #snb>li>a {
        margin-left: 15px;
    }

    .bc_w {
        background-color: whitesmoke;
    }

    .hide {
        display: none;
    }

    .a_bold {
        font-weight: bold;
        color: #5fa5fe;
    }

    #sidebar .snbArea .customer {
        padding: 18px 20px;
        border-top: 1px solid #eaeeef;
        background: url(//img.echosting.cafe24.com/ec/mode/influencer/common/bg_snb_customer.png) no-repeat 156px 20px;
    }

    #sidebar .snbArea .customer .title {
        font-size: 12px;
        color: #2e3039;
    }

    #sidebar .snbArea .customer .tel {
        margin: 7px 0 0;
        line-height: 24px;
        font-size: 24px;
        color: #2e3039;
        letter-spacing: -0.5px;
    }

    #sidebar .snbArea .customer .tel .dot {
        display: inline-block;
        margin: -5px 5px 0;
        vertical-align: top;
    }

    * {
        box-sizing: border-box;
    }

    .table1 {
        border-collapse: collapse;
        width: 1128px;
        height: 150px;
        border: 1px solid #bbb;
        text-align: center;
    }

    .img {
        width: 140px;
        height: 140px;
    }

    .table2 {
        border-collapse: collapse;
        width: 1128px;
        height: 222px;
        text-align: center;
    }

    .a1>th {
        height: 30px;
        border-bottom: 1px solid #bbb;
        color: #bbb;
        text-align: right;
        font-size: 15px;
    }

    .b1>td {
        padding: 20px
    }

    .c1>td {
        height: 5px;
        border-bottom: 1px solid #bbb;
    }

    #td-d {
        text-align: left;
    }

    .table3 {
        border: 1px solid #bbb;
        width: 1128px;
        text-align: center;
        margin-top: 50px;
        margin-bottom: 50px;
    }

    .total {
        margin-top: 200px;
        margin-left: 270px;
    }

    a {
        color: black;
        text-decoration: none;
    }

    h4 {
        font-size: 30px;
    }

    #p {
        font-size: 25px;
        margin: 20px;
    }

    #middle {
        margin-top: 50px;
    }
</style>

<body>
    <div id="container">
        <div id="sidebar">
            <div class="snbArea">
                <ul id="snb">
                    <li>
                        <h4>MY PAGE</h4>
                    </li>
                    <li>
                        <a id="a" href="#none" class="product">
                            좋아요
                        </a>
                    </li>
                    <li>
                        <a id="a" href="#none" class="order">
                            주문 관리
                        </a>
                        <ul class="hide">
                            <li class="">
                                <a id="a" href="#">
                                    주문 배송 조회
                                </a>
                            </li>
                            <li class="">
                                <a id="a" href="#">
                                    취소/교환/반품/환불
                                </a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a id="a" href="#" class="member">
                            회원 혜택
                        </a>
                    </li>
                    <li>
                        <a id="a" href="#" class="board">
                            정보 관리
                        </a>
                        <ul class="hide">
                            <li class="">
                                <a id="a" href="#">
                                    회원정보 수정
                                </a>
                            </li>
                            <li class="">
                                <a id="a" href="#">
                                    회원 탈퇴
                                </a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a id="a" href="#" class="promotion">
                            문의내역
                        </a>
                        <ul class="hide">
                            <li class="">
                                <a id="a" href="#">
                                    통합 문의
                                </a>
                            </li>
                            <li class="">
                                <a id="a" href="#">
                                    상품 문의
                                </a>
                            </li>
                            <li class="">
                                <a id="a" href="#">
                                    1:1 문의
                                </a>
                            </li>
                        </ul>
                    </li>
                </ul>
                <div class="customer">
                    <strong class="title">고객센터 <span class="info">(평일 9~18시)</span></strong>
                    <div class="tel">8080<span class="dot">.</span>8080</div>
                </div>
            </div>
        </div>
    </div>

    <div class="total">
        <p id="p">취소/교환/반품</p>
        <table class="table1">
            <tr>
                <td><span class="gBreak"> <input type="text" id="startDate" name="start_dt" class="fText gDate"
                            value=""> ~
                        <input type="text" id="endDate" name="end_dt" class="fText gDate" readonly="readOnly"></span>
                </td>
            </tr>
        </table>
        <div id="middle">
            <span style="font-size: 15px">${orderview.order_dt}</span>
            <span style="color: #bbb">  |  </span>
            <span style="font-size: 15px">주문번호 2019082664883377</span>
            <span style="color: #bbb">  |  </span>
            <span style="font-size: 15px">주문 상품 1개</span>
        </div>
        <form action="">
            <table class="table2">
                <thead>
                    <tr class="a1">
                        <th></th>
                        <th></th>
                        <th></th>
                        <th><a href="#" style="color: #bbb">상세내역 →</a></th>
                    </tr>
                </thead>
                <tr class="b1">
                    <c:forEach var="c" items="${cList}">
                        <td class="img">
                            <a href="#">
                                <img src="http://placehold.it/140"></a>
                        </td>
                        <td id="td-d">
                            <a href="#">
                                <div>${c.product_seller_id}</div>
                            </a>
                            <a href="#">
                                <div>${c.product_name}</div>
                            </a>
                            <div>${c.product_price}</div>
                            <div>${c.sizes_sizes}</div>
                        </td>
                    </c:forEach>
                    <td class="text-center">${c.product_price}</td>
                    <td>입금전</td>
                </tr>
                <tr class="c1">
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
            </table>
        </form>
        <table class="table3">
            <tr class="a2">
                <td><img src="취소교환반품절차1.png"></td>
            </tr>
            <tr>
                <td><img src="취소교환반품절차.png"></td>
            </tr>
        </table>

    </div>
</body>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>