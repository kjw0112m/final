<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
                margin-top: 50px;
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
                        <h4>그동안이용해주셔서감사합니다</h4>
                        <p>다음에 더 멋진 모습으로 만나요</p>
                    </td>
    
                </tr>
                <tr class="c">
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
            </table>
            <div class="btndiv">
                <a href="${pageContext.request.contextPath}" >메인으로 갈래요?</a>
            </div>
        </div>
    </body>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>    
