<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
   <title>주문상세보기</title>
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
   <style>
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
            width: 100%;
            height: 222px;
            text-align: center;
        }

        .h4 {
            font-size: 30px;
            font-weight: 700px;
            margin: 20px;
        }
        #h3 {
            font-size: 20px;
            font-weight: 700px;
            margin-top: 100px;
        }
        #span1{
            font-size: 50px;
            margin: 20px; 
            color: #bbb;
        }

        .a1>th {
            height: 30px;
            border-bottom: 2px solid black;
            color: #bbb;
            text-align: right;
            font-size: 15px;
        }

        .b1>td {
            height: 5px;
            border-bottom: 1px solid #bbb;
            padding: 20px;
        }
        .img{
            width: 140px;
            height: 140px;
        }

        #td-d {
            text-align: left;
        }

        .table2 {
            border-collapse: collapse;
            width: 100%;
            height: 222px;
            text-align: center;
            border-left:1px solid #bbb;
            border-right:1px solid #bbb;
            border-top: 1px solid #bbb;
            border-bottom:1px solid #bbb;
        }

        .a2>th {
            height: 50px;
            border-bottom: 1px solid #bbb;
            color:black;
            text-align: center;
            font-size: 14px;
            padding: 10px;
        }

        .b2>td {
            width: 14.28%;
            padding: 25px;
        }
        .total {
            margin-left: 270px;
            margin-top: 150px;
            width: 1563px;
        }
        .table3{
            border-collapse: collapse;
            margin-bottom: 50px;
            width: 100%;
            text-align: left;
            background-color: #f7f7f7;;
        }
        .a3>th>p {
            border-left: 30px solid #f7f7f7;
            font-size: 15px;
        }

        .b3>td>p {
            border-left: 30px solid #f7f7f7;
            width: 50%;
            font-size: 15px;
        }

        .a3> th{
            border-right: 2px solid white;
        }
        .b3> td{
            border-right: 2px solid white;

        }
        .btn1 {
        margin-top: 30px;
        border: none;
        background-color: white;
        border: 1px solid black;
        color: black;
        height: 50px;
        width: 150px;
    }
        .btn2 {
        margin-top: 30px;
        border: none;
        background-color: black;
        color: #fff;
        height: 50px;
        width: 150px;
    }
        .btndiv{
            margin-left: 550px;
            margin-bottom: 50px;
    }
    a{
        color: #2e3039;
        text-decoration: none;
    }
    </style>
</head>

<body>
    <div id="container">
        <div id="sidebar">
            <div class="snbArea">
                <ul id="snb">
                    <li>
                        <h4 class="h4">MY PAGE</h4>
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

        <div style="margin-top: 50px">
            <span style="font-size: 15px">${orderview.order_dt}</span>
            <span style="color: #bbb">&nbsp&nbsp|&nbsp&nbsp</span>
            <span style="font-size: 15px">주문번호 2019082664883377</span>
            <span style="color: #bbb">&nbsp&nbsp|&nbsp&nbsp</span>
            <span style="font-size: 15px">주문 상품 1개</span>
        </div>
        <form action="">
            <table class="table1">
                <thead>
                    <tr class="a1">
                        <th></th>
                        <th></th>
                        <th></th>
                        <th></th>
                    </tr>
                </thead>
                <tr class="b1">
                    <c:forEach var="c" items="${cList}">
                        <td class="img">
                            <a href="#"><img src="http://placehold.it/140"></a>
                        </td>
                        <td id="td-d">
                            <a href="#"><div>${c.product_seller_id}</div></a>
                            <a href="#"><div>${c.product_name}</div></a>
                            <div>${c.product_price}</div>
                            <div>${c.sizes_sizes}</div>
                        </td>
                    </c:forEach>
                    <td>${c.product_price}</td>
                    <td id="td-d">입금전</td>
                </tr>
            </table>
        </form>
        <h3 id="h3">결제 내역</h3>
        <table class="table2">
            <tr class="a2">
                <th>결제수단 : 가상계좌(무통장)</th>
                <th></th>
                <th></th>
                <th></th>
                <th></th>
                <th></th>
                <th></th>
            </tr>
            <tr class="b2">
                <td><h3>${c.product_price}</h3><p>주문 금액</p></td>
                <td><span id="span1">+</sapn></td>
                <td><h3>0</h3><p>배송비</p></td>
                <td><sapn id="span1">-</sapn></td>
                <td><h3>마일리지 사용</h3><p>마일리지 사용</p></td>
                <td><sapn id="span1">=</sapn></td>
                <td><h3>19,900</h3><p>총 결제 금액</p></td>
            </tr>
            </table>
            <h3 id="h3">배송지 정보</h3>
            <table class="table3">
                <tr class="a3">
                    <th><p>주문하시는 분</p></th>
                    <th><p>받으시는 분</p></th>
                </tr>
                <tr class="b3">
                    <td><p>이름  김지원</p><p>휴대전화 123-1234-1234</p><p>주소    (303030)인천시</p></p>
                    <td><p>이름  김지원</p><p>휴대전화 123-1234-1234</p><p>주소    (303030)인천시</p></p>

            </table>

            <div class="btndiv">
                <a href="#"><button class="btn1">1:1문의</button></a> 
                <a href="#"><button class="btn2">전체취소</button></a>
                <a href="#"><button class="btn2">목록</button></a>
               </div>
   </div>

</html>