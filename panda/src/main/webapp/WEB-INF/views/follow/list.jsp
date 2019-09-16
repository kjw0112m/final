<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<style>
#content {
	min-height: 1000px;
	min-width: 1180px;
	width: 1200px;
	padding-top: 50px;
	padding-left: 300px;
	padding-top: 50px;
}

#content ul li {
	display: inline-block;
	margin-right: 100px;
	font-size: 20px;
	font-weight: 600px;
}

</style>

<div id="container">
	<jsp:include page="/WEB-INF/views/template/my_info.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/views/template/side.jsp"></jsp:include>
</div>
<div id="content">
	<h1>팔로우(${follows})</h1>
	<div class="list">
		<ul>
			<c:forEach var="followDto" items="${followDto}">
				<li><a
					href="${pageContext.request.contextPath}/product/sellerList?seller_id=${followDto.seller_id}">${followDto.nickname}</a></li>
			</c:forEach>
		</ul>
	</div>
</div>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>