<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

    <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>로그인실패</title>
    <style>
        * {
            box-sizing: border-box;
        }

        .table1 {
            border-collapse: collapse;
            width: 1128px;
            height: 222px;
            text-align: center;
            margin: auto;
        }

        .a>th {
            height: 50px;
            width: 100%;
            border-top: 3px solid #bbb;
        }

        .b>td {
            height: 50px;
            width: 100%;

        }
        .c>td {
            height: 50px;
            width: 100%;
            border-bottom: 3px solid #bbb;
        }

        h4 {
            font-size: 30px;
            margin: 20px;
        }

        .total {
            margin-top : 250px;
        }

        .a {
            margin-top: 30px;
            border: none;
            color: black;
            height: 40px;
            width: 150px;
            margin-left: 10px;
            text-decoration: none;
        }

        .btndiv {
            margin-top: 30px;
            margin-bottom: 400px;
            text-align: center;
            width: 100%;
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
               
                <td>
                    <h4>로그인 정보가 일치하지 않습니다</h4>
                </td>

            </tr>
            <tr class="c">
                <td></td>
                <td></td>
                <td></td>
            </tr>
        </table>
        <div class="btndiv">
            <a href="login" >LOGIN</a><br>
            <a href="find_id" >아이디 찾기</a><br>
            <a href="find_pw" >비밀번호 찾기</a><br>
            <a href="${pageContext.request.contextPath}">HOME</a>
        </div>
    </div>
</body>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>    