<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/admin/header.jsp"></jsp:include>
<style>
#container {
	margin: 100px 100px;
}

.new_pw_form {
	height: 300px;
	background-color: white;
	width: 700px;
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

#find_check {
	margin-top: 30px;
	margin-left: 42%;
	border: none;
	background-color: #55a0ff !important;
	color: #fff;
	height: 60px;
	width: 220px;
}

#container>.tit {
	text-align: center;
	margin: auto;
	padding: 5px;
	margin-bottom: 50px;
}
</style>
<%--암호화 --%>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script
	src="${pageContext.request.contextPath}/js/cryptojs/components/core-min.js"></script>
<script
	src="${pageContext.request.contextPath}/js/cryptojs/components/sha256-min.js"></script>
<script>
	$(function() {
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

		//비밀번호 암호화
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

<div id="container">
	<div class="tit">
		<h2>비밀번호 변경</h2>
	</div>
	<div class="new_pw_form">
		<form action="new_pw" method="post">
			<input type="hidden" name="id" value="${id}">
			<table class="table">
				<tbody>
					<tr>
						<td class="a">새로운 비밀번호</td>
						<td class="b"><input class="iText pw" type="password"
							name="pw" placeholder="비밀번호 입력" required>
							<br> 
							<span class="spw"></span>
					</tr>
				</tbody>

			</table>
			<input id="find_check" type="submit" value="변경하기">
		</form>
	</div>
</div>








