<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
* {
	text-align: center;
	margin: auto;
}

</style>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<h1>${sdto.name}님의정보</h1>
<br>
<table border="1" width="400">
	<tbody>

		<tr>
			<th>아이디</th>
			<td>${sdto.id}</td>
		</tr>
		<tr>
			<th>이름</th>
			<td>${sdto.name}</td>
		</tr>
	
		<tr>
			<th>전화번호</th>
			<td>${sdto.phone}</td>
		</tr>
		<tr>
			<th>이메일</th>
			<td>${sdto.email}</td>
		</tr>

		<tr>
			<th>가입일</th>
			<td>${sdto.regist_dt}</td>
		</tr>
			<tr>
			<th>마지막 로그인 시간</th>
			<td>${sdto.login_dt}</td>
		</tr>
		<tr>
						<td>닉네임</td>
						<td><input type="text" name="nickname" value="${sdto.nickname}"></td>
					</tr>
	</tbody>
</table>
<%-- 회원이 이용할 수 있는 기능들을 링크로 제공 --%>
<h3>
	<a href="change_pw">비밀번호 변경</a>
</h3>
<h3>
	<a href="change">개인정보 변경</a>
</h3>
<h3>
	<a href="delete">회원 탈퇴</a>
</h3>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>











