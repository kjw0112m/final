<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/views/template/admin/header.jsp"></jsp:include>

<script src="https://code.jquery.com/jquery-latest.js"></script>
<script>
$(function(){
	if('${param.error}'!=''){
		alert('일치하는 정보가 없습니다.')
	}
})
</script>
<style>
#container {
	margin: 100px 100px;
}

.find_id_form {
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

#find_check {
	margin-top: 30px;
	margin-left: 42%;
	border: none;
	background-color: #55a0ff !important;
	color: #fff;
	height: 60px;
	width: 220px;
}

#container > .tit {
	text-align: center;
	margin: auto;
	padding: 5px;
	margin-bottom: 50px;
}
</style>

<div id="container">
	<div class="tit">
		<h2>아이디 찾기</h2>
	</div>
	<div class="find_id_form">
		<form action="find_id" method="post">
			<table class="table">
				<tbody>
					<tr>
						<td class="a">이름</td>
						<td class="b"><input class="id iText" type="text" name="name"
							placeholder="이름" required>
					</tr>
					<tr>
						<td class="a">이메일</td>
						<td class="b"><input class="id iText" type="text"
							name="email" placeholder="이메일" required></td>
					</tr>
				</tbody>

			</table>
			<input id="find_check" type="submit" value="찾기">
		</form>
	</div>
</div>
</div>
</body>
</html>
