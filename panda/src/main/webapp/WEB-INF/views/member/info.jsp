<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
* {
	text-align: center;
	margin: auto;
}

</style>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<h1>${mdto.name}님의정보</h1>
<br>
<table border="1" width="400">
	<tbody>

		<tr>
			<th>아이디</th>
			<td>${mdto.id}</td>
		</tr>
		<tr>
			<th>이름</th>
			<td>${mdto.name}</td>
		</tr>
		<tr>
			<th>생년월일</th>
			<td>${mdto.birth}</td>
		</tr>
		<tr>
			<th>전화번호</th>
			<td>${mdto.phone}</td>
		</tr>
		<tr>
			<th>이메일</th>
			<td>${mdto.email}</td>
		</tr>

		<tr>
			<th>주소</th>
			<td><div>
					<input type="text" name="post_code" value="${mdto.post_code}"
						readonly><br> 
						<input type="text" name="basic_addr"
						value="${mdto.basic_addr}" readonly width="150px"> 
						<input
						type="text" name="detail_addr" value="${mdto.detail_addr}"
						readonly>
				</div></td>
		</tr>

		<tr>
			<th>가입일</th>
			<td>${mdto.regist_dt}</td>
		</tr>
			<tr>
			<th>마지막 로그인 시간</th>
			<td>${mdto.login_dt}</td>
		</tr>
					<tr>
			<th>마지막 비밀번호 변경</th>
			<td>${mdto.pw_dt}</td>
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











