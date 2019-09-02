<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
    <style>
        * {
            box-sizing: border-box;
        }

        .table1 {
            border-collapse: collapse;
            width: 1128px;
            height: 222px;
            text-align: center;
            margin: top;
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
            margin-top: 50px;
        }

        .a {
            margin-top: 30px;
            border: none;
            color:white;
            height: 40px;
            width: 150px;
            margin-left: 10px;
            text-decoration: none;
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
                    <h4>회원님의 아이디는 [ ${id} ]입니다</h4>
                </td>

            </tr>
            <tr class="c">
                <td><a	href="find_pw" class="btn2">비밀번호찾기</a><br>
                <a	href="login" class="btn2">로그인 </a></td>
                <td></td>
            </tr>
        </table>
    </div>
</body>

</html>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>


