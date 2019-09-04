<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>    

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/common2.css">

<h1 align="center">공지사항</h1>

<form method="post" id="noticeForm" class="form form-vertical">
<input type="hidden" id="mode" name="mode" value="${mode}">
<input type="hidden" id="id" name="id" value="${noticeDto.id}">
<table border="1" width="700" class="table">
	<tbody>
		<colgroup>
		<col width="150" >
		<col width="*" >
		<col width="100" >
		</colgroup>
		<tr>
			<th rowspan="2">제목</th>
			<c:choose>
			<c:when test="${sessionScope.sid.toString().startsWith('!')}">
				<td colspan="2">
					<select name="head" >
						<option value="">선택하세요</option>
					</select>
				</td>
			</c:when>
			<c:otherwise>
				<td colspan="2">
					
				</td>
			</c:otherwise>
			</c:choose>
			
		</tr>
		<tr>
			<c:choose>
			<c:when test="${sessionScope.sid.toString().startsWith('!')}">
				<td colspan="2">
					<input type="text" name="title" placeholder="제목"  value="${noticeDto.title}" size="70">
				<td colspan="2">
			</c:when>
			<c:otherwise>
				<td colspan="2">
					${noticeDto.title}
				</td>
			</c:otherwise>
			</c:choose>
		</tr>
		<tr>
			<th>내용</th>
			<c:choose>
			<c:when test="${sessionScope.sid.toString().startsWith('!')}">
				<td colspan="2">
					<textarea name="content" placeholder="내용" rows="10" cols="100">${noticeDto.content}</textarea>
				</td>
			</c:when>
			<c:otherwise>
				<td colspan="2">
					<textarea name="content" placeholder="내용" rows="10" cols="100" readonly="readonly" onfocus="blur();">${noticeDto.content}</textarea>
				</td>
			</c:otherwise>
			</c:choose>
		</tr>
		<c:choose>
			<c:when test="${sessionScope.sid.toString().startsWith('@')}">
				<c:forEach var="commentlist" items="${commentlist}">
					<tr>
						<td colspan="2">▶ ${commentlist.commentcontent}<br>${commentlist.createdate}</td>
					</tr>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<tr>
					<th>댓글</th>
					<td>
							<input type="hidden" name="serviceNo" value="">
							<textarea name="commentcontent" rows="4" cols="100" required placeholder="댓글 입력"></textarea>
							
					</td>
					<td><input type="button" onclick="saveComment();" value="등록"></td>
				</tr>
				<c:forEach var="commentlist" items="${commentlist}">
					<tr>
						<c:choose>
						<c:when test="${sessionScope.sid.toString().startsWith('!')}">
							<td colspan="2">▶ ${commentlist.commentcontent}<br>${commentlist.createdate}</td>
							<td><input type="button" onclick="deleteComment(${commentlist.id});" value="삭제"></td>
						</c:when>
						<c:when test="${sessionScope.sid.toString() eq commentlist.createUser}">
							<td colspan="2">▶ ${commentlist.commentcontent}<br>${commentlist.createdate}</td>
							<td><input type="button" onclick="deleteComment(${commentlist.id});" value="삭제"></td>
						</c:when>
						<c:otherwise>
							<td colspan="3">▶ ${commentlist.commentcontent}<br>${commentlist.createdate}</td>
						</c:otherwise>
						</c:choose>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
		
	</tbody>
	<thead>
	</thead>
	<tfoot>
		<tr align="center">
			<td colspan="3"><input type="button" onclick="saveNotice();" value="저장"> <c:if test="${mode eq 'EDIT'}"><input type="button" onclick="deleteNotice();" value="삭제"></c:if> <input type="button" onclick="listNotice();" value="목록"></td>
		</tr>
	</tfoot>
</table>
</form>

<!-- 자바스크립트를 이용하여 페이지 이동을 처리 -->
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script>
	function saveNotice() {
		$('#noticeForm').attr('action','${pageContext.request.contextPath}/notice/noticeUpdate').submit();
	}
	
	function deleteNotice(){
		$('#noticeForm').attr('action','${pageContext.request.contextPath}/notice/noticeDelete').submit();
	}
	
	function saveComment(){
		$('#noticeForm').attr('action','${pageContext.request.contextPath}/notice/saveComment').submit();
	}
	
	function deleteComment(commentId){
		$('#noticeForm').attr('action','${pageContext.request.contextPath}/notice/deleteComment?commentId='+commentId).submit();
	}
	
	function listNotice() {
		$('#noticeForm').attr('action','${pageContext.request.contextPath}/notice/noticeList').submit();
	}
</script>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>   