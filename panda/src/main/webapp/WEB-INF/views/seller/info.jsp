<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%--암호화 --%>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script
	src="${pageContext.request.contextPath}/js/cryptojs/components/core-min.js"></script>
<script
	src="${pageContext.request.contextPath}/js/cryptojs/components/sha256-min.js"></script>

<script>
	$(function() {
		if ('${param.error}' != '') {
			alert('수정 중 오류가 발생하였습니다.');
		}
	})
</script>
<style>
ul, ol, dl, li {
	list-style: none;
}

#header .util li {
	position: relative;
	display: inline-block;
	padding: 20px;
}

#container {
	margin: 100px 100px;
}

.info_form {
	height: 600px;
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
	font-weight: 600;
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

#infocheck {
	margin-top: 30px;
	margin-left: 42%;
	border: none;
	background-color: #55a0ff !important;
	color: #fff;
	height: 60px;
	width: 220px;
}

#container .info {
	text-align: center;
	margin: auto;
	padding: 5px;
	font-size: 22px;
	margin-bottom: 50px;
}

</style>
<jsp:include page="/WEB-INF/views/template/admin/header.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/template/admin/aside.jsp"></jsp:include>

<div id="container">
	<div class="info">
		<h1>${sellerDto.nickname } 정보</h1>
	</div>
	<div class="info_form">
		<form action="regist" method="post">
			<table class="table">
				<tbody>

					<tr>
						<td class="a">아이디</td>
						<td class="b"><input class="id iText" type="text" name="id" value="${sellerDto.id}"
							 disabled="disabled">
							</td>

					</tr>

					<tr>
						<td class="a">상점이름</td>
						<td class="b"><input class="iText" type="text"
							name="nickname" placeholder="판다이름" value="${sellerDto.nickname }" required></td>
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

					<tr>
						<td class="a">이름</td>
						<td class="b"><input class="iText" type="text" name="name"
							value="${sellerDto.name }" disabled="disabled"></td>
					</tr>


					<tr>
						<td class="a">핸드폰번호</td>
						<td class="b"><input type="text" name="phone"
							placeholder="전화번호(- 제외)" class="iText" required="required" value="${sellerDto.phone}"></td>
					</tr>


					<tr>
						<td class="a">이메일</td>
						<td class="b"><input type="text" name="email" id="putemail"
							required="required" class="iText" value="${sellerDto.email}"></td>
					</tr>
				</tbody>

			</table>
			<input id="infocheck" type="submit" value="저장">
		</form>
	</div>
</div>
</div>