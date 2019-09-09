<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
.here {
	margin: 100px 500px;
	height: 100px;
	width: 500px;
	background: white;
}

.here > a{
	margin-right: 20px;
	color: green;
}
</style>
<jsp:include page="/WEB-INF/views/template/admin/header.jsp"></jsp:include>
<div align="center" class="here">
	<h2>아이디는 ${id}입니다</h2>
	<br>
	<a href="login">로그인</a> 
	<a href="find_pw">비밀번호 찾기</a>
</div>


