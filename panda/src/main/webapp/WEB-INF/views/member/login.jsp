<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<%--암호화 --%>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script
	src="${pageContext.request.contextPath}/js/cryptojs/components/core-min.js"></script>
<script
	src="${pageContext.request.contextPath}/js/cryptojs/components/sha256-min.js"></script>
<%--암호화 --%>
<script>
	//비밀번호 암호화
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
	});
</script>

<style>
.total {
	margin: auto;
}

.btn1 {
	margin-top: 30px;
	border: none;
	background-color: black;
	color: #fff;
	height: 50px;
	width: 500px;
}

.btn2 {
	height: 50px;
	width: 120px;
	padding-left: 10px;
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

a {
	color: black;
	text-decoration: none;
}

.table {
	border: none;
	margin: auto;
}

.form-control {
	margin: auto;
	width: 500px;
	height: 50px;
}

#btn2div {
	margin-top: 30px;
	text-align: center;
	width: 100%;
}
</style>



<div class="total">
	<form action="login" method="post" class="needs-validation" novalidate>
		<div class="login">
			<h4>로그인</h4>
		</div>
		<table class="table">
			<tr>
				<td><input type="text" class="form-control" id="uname"
					placeholder="id" name="id" value="${cookie.saveId.value}" required>
				</td>
			</tr>
			<tr>
				<td><input type="password" class="form-control" id="pw"
					placeholder="Enter password" name="pw" required></td>
			</tr>
			<tr>
				<td><label for="remember" class="form-check-label"> <input
						class="form-check-input" type="checkbox" name="remember"
						${not empty
                                cookie.saveId?"checked":""}>아이디
						저장하기
				</label></td>
			</tr>
			</div>
			</div>
		</table>
		<div align="center">
			<input type="submit" value="LOGIN" class="btn1">
		</div>
		<div id="btn2div">
			<a href="regist" class="btn2">회원가입
				</button>
			</a> <a href="member/find_id" class="btn2">아이디찾기</a> <a
				href="member/find_pw" class="btn2">비밀번호찾기</a>
		</div>
	</form>
</div>
</form>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>




