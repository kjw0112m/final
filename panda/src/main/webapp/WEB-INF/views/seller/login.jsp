<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 암호화 -->
<script src="https:code.jquery.com/jquery-latest.js"></script>
<script
	src="${pageContext.request.contextPath}/js/cryptojs/components/core-min.js"></script>
<script
	src="${pageContext.request.contextPath}/js/cryptojs/components/sha256-min.js"></script>


<!-- 디자인 -->
<script
	src="https:ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
	//  비밀번호 암호화
	$(function() {
		$("form").submit(
				function(e) {
					e.preventDefault();

					var pw = $("input[name=pw]").val();
					var encPw = CryptoJS.SHA256(pw).toString();

					$("input[name=pw]").attr("name", "");
					var newInput = $("<input/>").attr("name", "pw").val(encPw)
							.attr("type", "hidden");

					$(this).append(newInput);
					this.submit();
				});
		if('${param.error}' != ''){
			alert('아이디 및 비밀번호가 틀립니다.');
		}
	});
</script>
<style>
.needs-validation {
	height: 600px;
	background-color: white;
	width: 600px;
	padding-top: 50px;
	border: 1px solid #ddd;
}

#container {
	margin: 100px 200px;
}

.find {
	padding-top: 20px;
	text-align: center;
}

.find span {
	padding-left: 10px;
}

.loginbtn {
	text-align: center;
	padding-top: 10px;
}

.btn1 {
	margin-top: 30px;
	border: none;
	background-color: #55a0ff;
	color: #fff;
	height: 50px;
	width: 500px;
}

.btn2 {
	height: 50px;
	width: 120px;
	padding-left: 10px;
	color: #55a0ff;
	text-decoration: none;
}

.login {
	text-align: center;
	margin: auto;
	width: 70%;
	padding: 5px;
	font-size: 22px;
	margin-bottom: 50px;
}

.text-left {
	text-align: left;
}

.text-conter {
	text-align: center;
}

.table {
	border: none;
	margin: auto;
}

.form-control {
	margin-top: 10px;
	width: 500px;
	height: 50px;
	color: #2e3039;
	border: 1px solid #ddd;
}

#btn2div {
	margin-top: 30px;
	text-align: center;
	width: 100%;
}

.table .center {
	text-align: center;
}

.table .left {
	text-align: left;
}

.check-input {
	margin-left: 50px;
	margin-top: 10px;
}

input[type=text], input[type=password]{
	padding-left: 10px !important;
}
</style>
<jsp:include page="/WEB-INF/views/template/admin/header.jsp"></jsp:include>
<div id="container">
	<div class="form">
		<form action="login" method="post" class="needs-validation" novalidate>
			<div class="login">
				<h4>판매자 로그인</h4>
			</div>
			<table class="table">
				<tr class="center">
					<td><input type="text" class="form-control" id="uname"
						placeholder="판다 아이디" name="id" value="${cookie.saveId.value}"
						required></td>
				</tr>
				<tr class="center">
					<td><input type="password" class="form-control" id="pw"
						placeholder="판다 비밀번호" name="pw" required></td>
				</tr>
				<tr class="left">
					<td><label for="remember" class="check-label"> <input
							class="check-input" type="checkbox" name="remember" id="remember"
							${not empty cookie.saveId?"checked":""}>아이디 저장하기
					</label></td>
				</tr>
			</table>
			<div align="center">
				<input type="submit" value="LOGIN" class="btn1">
			</div>
			<div id="btn2div">
				<a href="regist" class="btn2">판매자 회원가입</a> <a href="find_id"
					class="btn2">아이디찾기</a> <a href="find_pw" class="btn2">비밀번호찾기</a>
			</div>
		</form>
	</div>
</div>
</div>
</body>
</html>