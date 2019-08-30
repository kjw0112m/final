<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <style>
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
        border-top: 3px solid #bbb;
    }

    .c>td {
        height: 50px;
        width: 33.33%;
        border-bottom: 3px solid #bbb;
    }
    h4 {
        font-size: 30px;
        font-weight: 700px;
        margin: 20px;
    }
    .total{
        margin-left: 270px;
        margin-top: 200px;
    }
    .btn {
        margin-top: 30px;
        border: none;
        background-color: black;
        color: #fff;
        height: 40px;
        width: 150px;
        margin-left: 50px;
    }
    .btndiv{
        margin-left: 320px;
    }
    </style>
</head>
<body>
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
                <td></td>
                <td>
                    <h4>KAKAO PAY 취소</h4>
                    <p>요청하신 결제가 취소되었습니다</p>
                </td>
                <td></td>
            </tr>
            <tr class="c">
                <td></td>
                <td></td>
                <td></td>
            </tr>
        </table>
        <div class="btndiv">
                <a href="#"><button class="btn">목록</button></a> <a href="#"><button class="btn">1:1문의</button></a>
        </div>
    </div>
</body>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
