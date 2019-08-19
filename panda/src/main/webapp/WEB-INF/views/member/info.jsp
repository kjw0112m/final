<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<h1>${mdto.name}님의정보</h1>

<table >
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
			<td>${mdto.postCode}</td>
			<td>${mdto.basicAddr}</td>
			<td>${mdto.detailAddr}</td>
		</tr>
		<tr>
			<th>가입일</th>
			<td>${mdto.registDt}</td>
		</tr>
	</tbody>
</table>
<%-- 회원이 이용할 수 있는 기능들을 링크로 제공 --%>
<h3>
	<a href="#">비밀번호 변경</a>
</h3>
<h3>
	<a href="change">개인정보 변경</a>
</h3>
<h3>
	<a href="delete">회원 탈퇴</a>
</h3>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>











