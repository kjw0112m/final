<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- 비밀번호 확인 입력창 --%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>


<style>
* {
	text-align: center;
	margin: auto;
}
</style>

<%-- error 파라미터 유무에 따라 오류메시지를 출력 --%>

<c:if test="${not empty param.error}">
	<h2>
		<font color="red">
			입력하신 정보에 해당하는 회원이 존재하지 않습니다	
		</font>
	</h2>
</c:if>

<form action="find_pw" method="post">
	
<h2>비밀번호 찾기</h2>
<br><br>
		<h3>아이디 입력</h3><input type="text" name="id" placeholder="아이디" required ><br>
		<h3>이메일 입력</h3><input type="text" name="email" placeholder="이메일" required ><br>
		<h3>전화번호 입력</h3><input type="text" name="phone" placeholder="전화번호" required ><br>
		<input type="submit" value="찾기">
	
</form>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>

