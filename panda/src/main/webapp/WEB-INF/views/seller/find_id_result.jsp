<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<div align="center" style="padding: 50px;">
	<h2>당신의 아이디는 [${id}]입니다</h2>
	<h3><a href="login">로그인 할래요?</a></h3>
<h3><a href="find_pw">비밀번호를 찾고싶어요</a></h3>
</div>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>


