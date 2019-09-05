<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<%--암호화 --%>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script
	src="${pageContext.request.contextPath}/js/cryptojs/components/core-min.js"></script>
<script
	src="${pageContext.request.contextPath}/js/cryptojs/components/sha256-min.js"></script>
<script src="${pageContext.request.contextPath}/js/password-encoder.js"></script>
<%--암호화 --%>

<style>
* {
	text-align: center;
	margin: auto;
}
</style>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<h1>${sdto.name} 회원님의 정보</h1><br>
<form action="change" method="post">
<table border="1" width="600" height="350">
	<tbody>
		<tr>
						<td>아이디</td>
						<td><input class="id" type="text" name="id"
							value="${sdto.id}" readonly><br>
						</tr>

					<tr>
						<td>이름</td>
						<td><input type="text" name="name" value="${sdto.name}" readonly></td>
					</tr>

					<tr>
						<td>이메일</td>
						<td><input type="email" name="email" value="${sdto.email}"></td>

					</tr>

					<tr>
						<td>핸드폰번호</td>
						<td><input type="text" name="phone" value="${sdto.phone}"></td>
					</tr>

						<tr>
						<td>닉네임</td>
						<td><input type="text" name="nickname" value="${sdto.nickname}"></td>
					</tr>

		<tr>
			<th colspan="2"><input type="submit" value="수정하기"></th>
		</tr>
	</tbody>
</table>

</form>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>


