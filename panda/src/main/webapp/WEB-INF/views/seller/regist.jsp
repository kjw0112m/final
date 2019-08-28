<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%--암호화 --%>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script
	src="${pageContext.request.contextPath}/js/cryptojs/components/core-min.js"></script>
<script
	src="${pageContext.request.contextPath}/js/cryptojs/components/sha256-min.js"></script>
<%--암호화 --%>

<style>
* {
	text-align: center;
	margin: auto;
}

input[type=submit] {
	align: center;
	color: white;
	background-color: #729a65;
	color: white;
	width: 50%;
}
input[type=button] {
	align: center;
	color: white;
	background-color: #729a65;
	color: white;
	width:30%;
}

input[type=text] {
	align: center;
	width:60%;
}
.table {
    width:55%;
	margin:auto;
    border: 1px solid black;
 
}


.table > thead > tr > th, 
.table > thead > tr > td, 
.table > tbody > tr > th, 
.table > tbody > tr > td,
.table > tfoot > tr > th, 
.table > tfoot > tr > td {
    border: 1px solid gray;
    padding: 0.6rem;
}


</style>
<script>

	$(function() {
		$("#registcheck").prop("disabled", true).css("background-color", " #729a65");
	    $("#idCheck").prop("disabled", true).css("background-color", " #729a65");
	});
		
	// 아이디 형식 검사
	$(function() {
		$(".id").on("blur", function() {
			var regex = /^@[a-zA-z0-9]{7,15}$/;
			var id = $(this).val();
			var result = regex.test(id);
			var span=document.querySelector(".sellerid");
			if (result) {
				span.innerHTML=""
	    $("#idCheck").prop("disabled", false).css("background-color", "#4790b8");
			}
			else {
		span.innerHTML = "<font color = '#de2195' size = '2'>@로시작하는 8~16자의 영문 소문자,대문자, 숫자로 입력해주세요</font>"
		 $("#idCheck").prop("disabled", true).css("background-color", "#729a65");
			}

		});
		
		//아이디 중복검사
	$(function() {
		$("#idCheck").click(function() {
				$.ajax({
				url : "idCheck",
				data : {
					id : $("input[name=id]").val()
				},
				dataType : "text",
				success : function(resp) {
					if (resp == "N") {
						window.alert("이미 사용중인 아이디입니다");
						$("input[name=id]").select();
					}
					//중복검사해서 사용할 수 있는 아이디이면 가입버튼 활성화
					else {
						window.alert("사용 가능한 아이디입니다")
						$("#registcheck").prop("disabled",false).css("background-color", "#4790b8");
					}
				}
			});
		});
	});
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
		
		
		//비밀 번호 확인 검사
		$(function() {
		var span=document.querySelector(".cpw");
			$('#user_pass').keyup(function() {
				span.innerHTML=""
			}); //#user_pass.keyup

			$('#chpass').keyup(function() {
				if ($('#user_pass').val() != $('#chpass').val()) {
				 span.innerHTML = "<font color = '#de2195' size = '2'>암호틀림</font>"
				} else {
				span.innerHTML = "<font color = '#de2195' size = '2'>암호맞음</font>"
				}
			}); //#chpass.keyup
		});
	});

	// 비밀번호 확인 숨기기
	$(function(){
		$("form").submit(function(e){
			e.preventDefault();	
			
			var pw = $("input[name=pw]").val();
			var encPw = CryptoJS.SHA256(pw).toString();
			var ck_pw = $("input[name=pw_check]").val();
			$("input[name=pw]").attr("name","");
			var newInput1 = $("<input/>").attr("name","pw").val(encPw).attr("type","hidden");
			$("input[name=pw_check]").attr("name","");
			$(this).append(newInput1);
			this.submit();
		});
	});
 		
 			
	
</script>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<body>
	<%-- 회원 가입 페이지의 내용을 구현 --%>
	<h1>판매자 가입</h1>
	<br>
	<form action="regist" method="post">
		<div>
			<table class="table">
				<tbody>

					<tr>
						<td rowspan="2">아이디</td>
						<td ><input class="id" type="text" name="id"
							placeholder="@로시작하는 8~16글자" required ><br> <span
							class="sellerid"></span></td></tr>
                     <tr>         
					<td colspan="2"><input type="button" id="idCheck" value="아이디 중복확인"></td>
					</tr>
                    

					<tr>
						<td>비밀번호</td>
						<td><input class="pw" type="password" name="pw"
							id="user_pass" placeholder="8~15자의 영문 대소문자, 숫자, 특수문자(!@#$-_)"
							required><br> <span class="spw"></span></td>
					</tr>
					<tr>
						<td>비밀번호 확인</td>
						<td><input type="password" id="chpass" name="pw_check"
							placeholder="비밀번호 확인" required><br> <span
							class="cpw"></span></td>
					</tr>

					<tr>
						<td>이름</td>
						<td><input type="text" name="name" placeholder="이름" required></td>
					</tr>


					<tr>
						<td>핸드폰번호</td>
						<td><input type="text" name="phone" placeholder="전화번호(- 제외)"></td>
					</tr>
			
					<tr>
						<td>닉네임</td>
						<td><input type="text" name="nickname" required></td>
					</tr>

					<tr>
						<td >이메일</td>
						<td><input type="text" name="email" required> </td>
							</tr>
							<tr>
						<td colspan="3">
							<input id="registcheck" type="submit" value="가입하기">
						</td>
					</tr>											

				

					<tr>
				</tbody>
			</table>
		</div>
	</form>
	<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>