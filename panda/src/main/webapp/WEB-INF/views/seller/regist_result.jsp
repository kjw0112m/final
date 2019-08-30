<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <style>
* {
	text-align: center;
	margin: auto;
}
</style>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>    

<h2>판매자 등록이 완료되었습니다</h2>
<h3><a href="login">로그인 할래요?</a></h3>
<h3><a href="${pageContext.request.contextPath}">메인으로 갈래요?</a></h3>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>    