<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>주문실패</title>
    <style>
    * {
        box-sizing: border-box;
    }
    .table1 {
        border-collapse: collapse;
        width: 1128px;
        height: 222px;
        margin: auto;
        text-align: center;
        background-color:#bbb;
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

    .btn {
        margin-top: 30px;
        border: none;
        background-color: black;
        color: #fff;
        height: 40px;
        width: 150px;
        margin-top: 50px;
    }
    #top{
        margin-top: 150px;
        margin-bottom: 100px;
        text-align: center;
        font-size: 16px;
        line-height: 24px;
        color: black;
    }
    .total {
        margin: auto;
    }
    #btn2div {
            margin-top: 30px;
            text-align: center;
            width: 100%;
        }
    </style>
</head>
<body>
        
    <div class="total">
            <div id="top"><span>01 쇼핑백</span><span> > 02 주문결제</span><span style="font-weight: bold"> > 03 주문완료</span></div>
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
                                <h4>결제 오류 발생</h4>
                                <p>다시한번 결제를 진행하십시오</p>
                            </td>
                            <td></td>
                        </tr>
                        <tr class="c">
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                    </table>
                    <div id="btn2div">
                        <a href="#"><button class="btn">장바구니</button></a>
                    </div>
                </div>

</body>
</html>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>