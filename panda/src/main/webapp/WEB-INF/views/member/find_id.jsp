<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- 아이디 확인 입력창 --%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>


    <style>
        .total {
            margin: auto;
        }

        #btn1 {
            margin-top: 30px;
            border: none;
            background-color: black;
            color: white;
            height: 50px;
            width: 300px;
            font-size: 17px;
        }

        .find_id {
            text-align: center;
            margin: auto;
            padding: 5px;
            font-size: 22px;
            margin-bottom: 50px;
            margin-top: 100px;
        }

        .find_id2 {
            text-align: center;
            margin: auto;
            padding: 5px;
            font-size: 30px;
            margin-bottom: 50px;
            margin-top: 50px;
        }

        a {
            color: black;
            text-decoration: none;
        }

        .table {
            border: none;
            margin: auto;
            width: 50%;
            border: none;
            color: #555;
            border-collapse: collapse;
        }

        .table th {
            padding-bottom: 10px;
            border-bottom: 2px solid #555;
            font-size: 20px;
            font-weight: 600;
        }

        .b>input {
            width: 150px;
            height: 44px;
            min-width: 280px;
            font-size: 14px;
            margin-top: 5px;
            border: 1px #eee solid;
        }

        .form-control {
            margin: auto;
            width: 500px;
            height: 50px;
        }

        .a {
            font-size: 13px;
            padding: 0 0 0 20px;
            text-align: left;
            font-weight: 400;
            width: 25%;
        }

        .b {
            min-height: 40px;
            padding: 16px 20px;
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

        <c:if test="${not empty param.error}">
            <h4 class="find_id">
                입력하신 정보에 해당하는 회원이 존재하지 않습니다
            </h4>
        </c:if>

            <h4 class="find_id2">아이디 찾기</h4>
            <form action="find_id" method="post">

                <table class="table">
                    <tr>
                        <th class="a"></th>
                        <th></th>
                    </tr>
                    <tr>
                        <td class="a">이름 입력</td>
                        <td class="b"><input type="text" name="name" placeholder="  이름" required class="form-control"></td>
                    </tr>
                    <tr>
                        <td class="a">이메일 입력</td>
                        <td class="b"><input type="text" name="email" placeholder="  이메일" required class="form-control"></td>
                    </tr>
                    <tr>
                        <td class="a">전화번호 입력</td>
                        <td class="b"><input type="text" name="phone" placeholder="  전화번호" required class="form-control"></td>
                    </tr>
                </table>
                <div id="btn2div">
                        <input type="submit" value="아이디찾기" id="btn1">
                </div>
            </form>
                
        </div>
        
    </body>

</html>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>

