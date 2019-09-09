<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/common2.css">



<h1>1:1 문의</h1>

<form id="oneForm" method="post" class="form form-vertical">

<input type="hidden" name="mode" value="${mode}">
<input type="hidden" name="id" value="${oneDto.id}">

<%-- 답글일 경우에는 parent 값을 전달 --%>
<%-- if(답글이라면){ --%>
<%-- <% if(request.getParameter("parent") != null){ %> --%>
<c:if test="${not empty param.parent }">
<%-- if(request.getParameterMap().containsKey("parent")){ --%>
	<input type="hidden" name="parent" 
					value="${param.parent }">
<%--<%}%>--%>
</c:if>
<table border="1" width="700" class="table">
	<tbody>
		<colgroup>
		<col width="100" >
		<col width="*" >
		</colgroup>
		<tr>
			<th rowspan="2">제목</th>
			<td>
				<c:choose>
				<c:when test="${sessionScope.sid.toString().startsWith('!') or sessionScope.sid.toString().startsWith('@')}">
					<select name="product" >
					<option value="">선택하세요</option>
					<option value="1" <c:if test="${oneDto.product eq 1}">selected</c:if>>배송지연/불만</option>
					<option value="2" <c:if test="${oneDto.product eq 2}">selected</c:if>>PANDA(무료배송)</option>
					<option value="3" <c:if test="${oneDto.product eq 3}">selected</c:if>>반품문의</option>
					<option value="4" <c:if test="${oneDto.product eq 4}">selected</c:if>>A/S문의</option>
					<option value="5" <c:if test="${oneDto.product eq 5}">selected</c:if>>환불문의</option>
					<option value="6" <c:if test="${oneDto.product eq 6}">selected</c:if>>주문결제문의</option>
					<option value="7" <c:if test="${oneDto.product eq 7}">selected</c:if>>회원정보문의</option>
					<option value="8" <c:if test="${oneDto.product eq 8}">selected</c:if>>취소문의</option>
					<option value="9" <c:if test="${oneDto.product eq 9}">selected</c:if>>교환문의</option>
					<option value="10" <c:if test="${oneDto.product eq 10}">selected</c:if>>상품정보문의</option>
					<option value="11" <c:if test="${oneDto.product eq 11}">selected</c:if>>기타문의</option>
					</select>
				</c:when>
				<c:when test="${mode eq 'EDIT' }">
					<c:if test="${oneDto.product eq 1}">배송지연/불만</c:if>
					<c:if test="${oneDto.product eq 2}">PANDA(무료배송)</c:if>
					<c:if test="${oneDto.product eq 3}">반품문의</c:if>
					<c:if test="${oneDto.product eq 4}">A/S문의</c:if>
					<c:if test="${oneDto.product eq 5}">환불문의</c:if>
					<c:if test="${oneDto.product eq 6}">주문결제문의</c:if>
					<c:if test="${oneDto.product eq 7}">회원정보문의</c:if>
					<c:if test="${oneDto.product eq 8}">취소문의</c:if>
					<c:if test="${oneDto.product eq 9}">교환문의</c:if>
					<c:if test="${oneDto.product eq 10}">상품정보문의</c:if>
					<c:if test="${oneDto.product eq 11}">기타문의</c:if>
					
					
				</c:when>
				<c:otherwise>
					<select name="product" >
					<option value="">선택하세요</option>
					<option value="1" <c:if test="${oneDto.product eq 1}">selected</c:if>>배송지연/불만</option>
					<option value="2" <c:if test="${oneDto.product eq 2}">selected</c:if>>PANDA(무료배송)</option>
					<option value="3" <c:if test="${oneDto.product eq 3}">selected</c:if>>반품문의</option>
					<option value="4" <c:if test="${oneDto.product eq 4}">selected</c:if>>A/S문의</option>
					<option value="5" <c:if test="${oneDto.product eq 5}">selected</c:if>>환불문의</option>
					<option value="6" <c:if test="${oneDto.product eq 6}">selected</c:if>>주문결제문의</option>
					<option value="7" <c:if test="${oneDto.product eq 7}">selected</c:if>>회원정보문의</option>
					<option value="8" <c:if test="${oneDto.product eq 8}">selected</c:if>>취소문의</option>
					<option value="9" <c:if test="${oneDto.product eq 9}">selected</c:if>>교환문의</option>
					<option value="10" <c:if test="${oneDto.product eq 10}">selected</c:if>>상품정보문의</option>
					<option value="11" <c:if test="${oneDto.product eq 11}">selected</c:if>>기타문의</option>
					</select>
				</c:otherwise>
				</c:choose>
				
			</td>
		</tr>
		<tr>
			<td>
				<c:choose>
				<c:when test="${sessionScope.sid.toString().startsWith('!') or sessionScope.sid.toString().startsWith('@')}">
					<input type="text" name="title" placeholder="제목"  value="${oneDto.title}" size="70">
				</c:when>
				<c:when test="${mode eq 'EDIT' }">
					${oneDto.title}
				</c:when>
				<c:otherwise>
					<input type="text" name="title" placeholder="제목"  value="${oneDto.title}" size="70">
				</c:otherwise>
				</c:choose>
			</td>
		</tr>
		<tr>
			<th>내용</th>
			<td>
				<c:choose>
				<c:when test="${sessionScope.sid.toString().startsWith('!') or sessionScope.sid.toString().startsWith('@')}">
					<textarea name="content" placeholder="내용" rows="10" cols="100">${oneDto.content}</textarea>
				</c:when>
				<c:when test="${mode eq 'EDIT' }">
					<textarea name="content" readonly="readonly" onfocus="blur();" placeholder="내용" rows="10" cols="100">${oneDto.content}</textarea>
				</c:when>
				<c:otherwise>
					<textarea name="content" placeholder="내용" rows="10" cols="100">${oneDto.content}</textarea>
				</c:otherwise>
				</c:choose>
				
			</td>
		</tr>
	<c:if test="${mode eq 'EDIT'}">
		<tr>
					<th>답변</th>
					<c:choose>
					<c:when test="${sessionScope.sid.toString().startsWith('!') or sessionScope.sid.toString().startsWith('@')}">
						<td>
							<textarea name="onecomment" rows="4" cols="100" placeholder="답변 입력">${oneDto.onecomment}</textarea>		
							<br>${oneDto.onecommentdate} &nbsp; ${oneDto.onecommentuser} <div align="right"><input type="button" onclick="saveComment();" value="등록"></div>
						</td>
					</c:when>
					<c:otherwise>
						<td>
							<textarea name="onecomment" rows="4" cols="100" placeholder="답변 입력" readonly="readonly" onfocus="blur();" >${oneDto.onecomment}</textarea>		
							<br>${oneDto.onecommentdate} &nbsp; ${oneDto.onecommentuser}
						</td>
					</c:otherwise>
					</c:choose>
					
		</tr>
	</c:if>	
	</tbody>
	<thead>
	</thead>
	<tfoot>
		<tr align="center">
			<td colspan="2">
			<c:choose>
				<c:when test="${sessionScope.sid.toString().startsWith('!') or sessionScope.sid.toString().startsWith('@')}">
					<input type="button" id="ddw" onclick="saveOne();" value="저장">
				</c:when>
				<c:when test="${mode eq 'EDIT' }">
					
				</c:when>
				<c:otherwise>
					<input type="button" onclick="saveOne();" value="저장">
				</c:otherwise>
			</c:choose>
			<input type="button" onclick="delOne();" value="삭제"> 
			<input type="button" onclick="listOne();" value="목록">
			</td>
		</tr>
	</tfoot>
</table>
</form>

<script src="https://code.jquery.com/jquery-latest.js"></script>
<script>
	function saveOne() {
		$('#oneForm').attr('action','${pageContext.request.contextPath}/one/saveOne').submit();
	}
	
	function delOne() {
		if(confirm("정말 저장할꾸야?")){
			$('#oneForm').attr('action','${pageContext.request.contextPath}/one/delOne').submit();
		}
		
	}
	
	function listOne(){
		$('#oneForm').attr('action','${pageContext.request.contextPath}/one/listOne').submit();
	}
	
	function saveComment(){
		$('#oneForm').attr('action','${pageContext.request.contextPath}/one/saveComment').submit();
	}
	
</script>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>