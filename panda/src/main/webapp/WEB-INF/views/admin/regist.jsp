<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%--암호화 --%>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script
	src="${pageContext.request.contextPath}/js/cryptojs/components/core-min.js"></script>
<script
	src="${pageContext.request.contextPath}/js/cryptojs/components/sha256-min.js"></script>

<style>
#container {
	margin: 200px;
}

.regist_form {
	height: 300px;
	background-color: white;
	width: 900px;
	margin: auto;
	border: 1px solid #ddd;
}

.table {
	border: none;
	margin: auto;
	width: 700px;
	border-collapse: collapse;
}

.table th, .table td {
	border-width: 0 0 1px;
	border-style: solid;
	border-color: #eee;
}

.a {
	font-size: 13px;
	padding: 0 0 0 20px;
	text-align: left;
	font-weight: 400;
	width: 20%;
}

.b {
	min-height: 40px;
	width: 80%;
	padding: 16px 20px;
}

.iText {
	width: 250px;
	height: 44px;
	padding: 0 39px 0 15px;
	min-width: 280px;
	font-size: 14px;
	margin-top: 5px;
	border: 1px #eee solid;
}

.b button {
	width: 150px;
	height: 45px;
	font-size: 14px;
	margin-top: 5px;
	border: 1px #ddd solid;
	background-color: white !important;
	text-align: center;
	color: black;
	font-weight: 600;
}

#registcheck {
	margin-top: 30px;
	margin-left: 42%;
	border: none;
	background-color: #55a0ff !important;
	color: #fff;
	height: 60px;
	width: 220px;
}

.regist {
	text-align: center;
	margin: auto;
	padding: 5px;
	font-size: 22px;
	margin-bottom: 50px;
}
</style>
<script>
	$(function() {

		// 아이디 형식 검사
		$(".id")
				.on(
						"blur",
						function() {
							var regex = /^![a-zA-z0-9]{7,15}$/;
							var id = $(this).val();
							var result = regex.test(id);
							var span = document.querySelector(".sid");
							if (result) {
								span.innerHTML = ""
								$("#idCheck").prop("disabled", false).css(
										"background-color", "#4790b8");
							} else {
								span.innerHTML = "<font color = '#de2195' size = '2'>!로시작하는 8~16자의 영문 소문자,대문자, 숫자로 입력해주세요</font>"
								$("#idCheck").prop("disabled", true).css(
										"background-color", "#729a65");
							}
						});

		//  비밀번호 형식 검사
		$(".pw")
				.on(
						"blur",
						function() {
							var regex = /^[a-zA-Z0-9!@#$\-_]{8,15}$/;
							var pw = $(this).val();
							var result = regex.test(pw);
							var span = document.querySelector(".spw");
							if (result) {
								span.innerHTML = ""
							} else {
								span.innerHTML = "<font color = '#de2195' size = '2'>8~15자의 영문 대소문자, 숫자, 특수문자(!@#$-_)로 입력해주세요</font>"
							}
						});

		//비밀 번호 확인 검사
		var span = document.querySelector(".cpw");
		$('#user_pass').keyup(function() {
			span.innerHTML = ""
		}); //#user_pass.keyup

		$('#chpass')
				.keyup(
						function() {
							if ($('#user_pass').val() != $('#chpass').val()) {
								span.innerHTML = "<font color = '#de2195' size = '2'>암호틀림</font>"
							} else {
								span.innerHTML = "<font color = '#de2195' size = '2'>암호맞음</font>"
							}
						}); //#chpass.keyup

		// 비밀번호 확인 숨기기
		$("form").submit(
				function(e) {
					e.preventDefault();

					var pw = $("input[name=pw]").val();
					var encPw = CryptoJS.SHA256(pw).toString();
					var ck_pw = $("input[name=pw_check]").val();
					$("input[name=pw]").attr("name", "");
					var newInput1 = $("<input/>").attr("name", "pw").val(encPw)
							.attr("type", "hidden");
					$("input[name=pw_check]").attr("name", "");
					$(this).append(newInput1);
					this.submit();
				});
		if ('${param.error}' != '') {
			alert('회원가입 중 오류가 발생하였습니다.');
		}
	});
</script>
<jsp:include page="/WEB-INF/views/template/admin/header.jsp"></jsp:include>
<div id="container">
	<div class="regist">
		<h1>관리자 가입</h1>
	</div>
	<div class="regist_form">
		<form action="regist" method="post">
			<table class="table">
				<tbody>
					<tr>
						<td class="a">아이디</td>
						<td class="b"><input class="id iText" type="text" name="id"
							placeholder="아이디 8~16글자" required> <span class="sid"></span></td>

					</tr>

					<tr>
						<td class="a">비밀번호</td>
						<td class="b"><input class="pw iText" type="password"
							name="pw" id="user_pass"
							placeholder="8~15자의 영문 대소문자, 숫자, 특수문자(!@#$-_)" required><br>
							<span class="spw"></span></td>
					</tr>
					<tr>
						<td class="a">비밀번호 확인</td>
						<td class="b"><input class="iText" type="password"
							id="chpass" name="pw_check" placeholder="비밀번호 확인" required><br>
							<span class="cpw"></span></td>
					</tr>

				</tbody>

			</table>
	<input id="registcheck" type="submit" value="가입하기">
	</form>
	</div>
</div>

</body>
</html>