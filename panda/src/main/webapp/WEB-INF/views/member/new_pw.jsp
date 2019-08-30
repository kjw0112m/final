<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<%--암호화 --%>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script src="${pageContext.request.contextPath}/js/cryptojs/components/core-min.js"></script>
<script src="${pageContext.request.contextPath}/js/cryptojs/components/sha256-min.js"></script>
<%--암호화 --%>
<script>
//  비밀번호 형식 검사
		$(".pw").on("blur", function() {
			var regex = /^[a-zA-Z0-9!@#$\-_]{8,15}$/;
			var pw = $(this).val();
			var result = regex.test(pw);
			var span=document.querySelector(".spw");
			if (result) {
				span.innerHTML=""
			} else {
		 span.innerHTML = "<font color = '#de2195' size = '2'>8~15자의 영문 대소문자, 숫자, 특수문자(!@#$-_)로 입력해주세요</font>"
			}
		});
		
		//비밀번호 암호화
		$(function(){
			$("form").submit(function(e){
				e.preventDefault();	
				
				var pw = $("input[name=pw]").val();
				var encPw = CryptoJS.SHA256(pw).toString();
				
				$("input[name=pw]").attr("name","");
				var newInput = $("<input/>").attr("name","pw").val(encPw).attr("type","hidden");
				
				$(this).append(newInput);
				this.submit();
			});
		});
		</script>


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

        .new_pw2 {
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

        .pw {
            width: 100%;
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
            text-align: right;
            font-weight: 400;
            width: 30%;
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
            <h4 class="new_pw2">비밀번호 변경</h4>
            <form class="form" action="new_pw" method="post">
            <%-- hidden은 사용자에게 표시되지 않으면서 전송이 가능 --%>
            <input type="hidden" name="id" value="${id}">
                <table class="table">
                    <tr>
                        <th class="a"></th>
                        <th></th>
                    </tr>
                    <tr>
                        <td class="a">새로운 비밀번호</td>
                        <td class="b"><input class="pw" type="password" name="pw"
							placeholder="  8~15자의 영문 대소문자, 숫자, 특수문자(!@#$-_)" required class="form-control"><br>
                       <span class="spw"></span>
                        </td>class="form-control"
                    </tr>
                </table>
            </form>
            <div id="btn2div">
                    <input type="submit" value="변경하기" id="btn1">
            </div>
        </form>
    </div>

</body>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>







