<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <script src="https://code.jquery.com/jquery-latest.js"></script>
    <script>
            $(function () {
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
    ul, li{
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

    a {
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
        height: 222px;
        text-align: center;
    }

    .a>th {
        height: 50px;
        border-top: 3px solid black;
    }

    .c>td {
        height: 50px;
        width: 33.33%;
        border-bottom: 3px solid black;
    }

    #td-b {
        border-right: 1px solid #bbb;
        border-left: 1px solid #bbb;
    }

    h4 {
        font-size: 30px;
        font-weight: 700px;
        margin: 20px;
    }

    #top {
        margin-top: 50px;
        margin-bottom: 50px;
        margin-left: 180px;
        text-align: center;
        font-size: 16px;
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
        height: 222px;
        text-align: center;
        margin-bottom: 50px;
    }

    .a2 {
        width: 100%;
    }
    .total{
        margin-left: 270px;
    }
</style>

<body>
    <div id="container">
        <div id="sidebar">
            <div class="snbArea">
                <ul id="snb">
                    <li><h4>MY PAGE</h4></li>
                    <li>
                        <a id="" href="#none" class="product">
                            좋아요
                        </a>
                    </li>
                    <li>
                        <a href="#none" class="order">
                            주문 관리
                        </a>
                        <ul class="hide">
                            <li class="">
                                <a href="#">
                                    주문 배송 조회
                                </a>
                            </li>
                            <li class="">
                                <a href="#">
                                    취소/교환/반품/환불
                                </a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="#" class="member">
                            회원 혜택
                        </a>
                    </li>
                    <li>
                        <a href="#" class="board">
                            정보 관리
                        </a>
                        <ul class="hide">
                            <li class="">
                                <a href="#">
                                    회원정보 수정
                                </a>
                            </li>
                            <li class="">
                                <a href="#">
                                    회원 탈퇴
                                </a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="#" class="promotion">
                            문의내역
                        </a>
                        <ul class="hide">
                            <li class="">
                                <a href="#">
                                    통합 문의
                                </a>
                            </li>
                            <li class="">
                                <a href="#">
                                    상품 문의
                                </a>
                            </li>
                            <li class="">
                                <a href="#">
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

    <div id="top"><span>01 쇼핑백</span><span> > 02 주문결제</span><span style="font-weight: bold"> > 03 주문완료</span></div>
    <div class="total">

        <table class="table1">
            <thead>
                <tr class="a">
                    <th></th>
                    <th></th>
                    <th></th>
                </tr>
            </thead>
            <tr class="b">
                <td>
                    <h4>FAMILY</h4>
                    <p>회원 등급</p>
                </td>
                <td id="td-b">
                    <h4>1</h4>
                    <p>사용가능 쿠폰</p>
                </td>
                <td>
                    <h4>0</h4>
                    <p>사용가능 마일리지</p>
                </td>
            </tr>
            <tr class="c">
                <td></td>
                <td></td>
                <td></td>
            </tr>
        </table>
        <div style="margin-top: 50px">
                <span style="font-size: 15px">${orderview.order_dt}</span>
                <span style="color: #bbb">&nbsp&nbsp|&nbsp&nbsp</span>
                <span style="font-size: 15px">주문번호 2019082664883377</span>
                <span style="color: #bbb">&nbsp&nbsp|&nbsp&nbsp</span>
                <span style="font-size: 15px">주문 상품 1개</span>
            </div>
            <form action="">
                <table class="table2">
                    <thead>
                        <tr class="a1">
                            <th></th>
                            <th></th>
                            <th></th>
                            <th>상세내역 -></th>
                        </tr>
                    </thead>
                    <tr>
                        <c:forEach var="c" items="${cList}">
                            <td tr class="b1">
                                <a href="#">
                                    <img src="http://placehold.it/100"></a>
                                </td>
                                <td id="td-d">
                                    <a href="#"><span>${c.product_seller_id}<span></a>
                                        <a href="#"><span>${c.product_name}<span></a>
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
                            <tr>
                                <td><img src="주문설명.png" class="a2"></td>
                                <td></td>
                                <td></td>
                                <td></td>
                            </tr>
                        </table>
                        
                    </div>
                    </body>
                    </html>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>