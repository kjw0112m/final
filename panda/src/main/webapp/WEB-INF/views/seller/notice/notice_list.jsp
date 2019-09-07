<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 


<jsp:include page="/WEB-INF/views/template/admin/header.jsp"></jsp:include>



<jsp:include page="/WEB-INF/views/template/admin/aside.jsp"></jsp:include>  

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/admin/common.css">


	
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/admin/a.css">
	
	
	<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/common2.css">
	
	


<script>
	var page = "${page}";
	var startBlock = "${startBlock}";
	var endBlock = "${endBlock}";
	console.log(page)
	console.log(startBlock)
	console.log(endBlock)

	$(function(){
		//목표 : 페이지 번호를 누르면 해당하는 번호의 페이지로 이동 처리
		//			이동은 form을 전송하는 것으로 대체
		$(".navigator-page").click(function(){
			var p = $(this).text();
			move(p);
		});
		
		//이동 함수
		function move(no){
			//input[name=page]에 no를 설정한 뒤 form을 전송
			$("input[name=page]").val(no);
			$("form").submit();
		}
		
		//select[name=type]인 항목의 값을 선택
		var type = "${param.type}";
		if(type){
			$("select[name=type]").val(type);
		}
	});
	
</script>

<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script
	src="${pageContext.request.contextPath}/js/admin/member_search.js"></script>


<form class="form" action="noticeList" method="get" id="">
	
	<div class="">
		<h1>공지 사항 </h1>
	</div>
	<div id="content">
		<div class="optionArea">
			<div class="mOption">
				<table border="1" summary="">
					<colgroup>
						<col style="width: 170px;">
						<col style="width: 600px;">
						<col style="width: 170px;">
						<col style="width: auto;">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row">검색어</th>
							<td colspan="3">
								<div id="mainSearch">
									<div>
										<select class="fSelect" name="type" style="width: 163px;">
											<option value="choice" disabled>-검색항목선택-</option>
											<option value="title" ${type == 'title'?'selected':''}>제목</option>
											<option value="content" ${type == 'content'?'selected':''}>내용</option>
											<option value="title+content" ${type == 'title+content'?'selected':''}>제목+내용</option>
										</select>
										<input type="search" name="keyword" placeholder="검색어"
											required value="${keyword}" class="fText searchBox" style="width: 300px;">
									</div>
								</div>
					</tbody>
				</table>
			</div>
			<div class="form_button">
				<input type="submit" id="btnSearch777" class="btnSearch777" value="검색">
				
				<a href="${pageContext.request.contextPath}/seller/notice/noticeList" id="btnSearch"  class="btnSearch"> 초기화</a>
				
				
				<a href="${pageContext.request.contextPath}/testmember/login"  id="btnInit"  class="btnSearch reset">
				관리자 권한 접근 경로:_____해당 ID로 로그인 후 test 바랍니다 (ID/PW : gggggggg)</a>
				
				
<%-- 				<a href="${pageContext.request.contextPath}/seller/notice/noticeList" id="btnInit"  class="btnSearch reset"> 초기화</a>				
 				<a href="${pageContext.request.contextPath}/seller/notice/noticeList" id="btnSearch"  class="btnSearch"> 초기화</a> 
 				<input type="submit" id="btnSearch777" class="btnSearch777" value="왜 안돼"> --%> 
			</div>
		</div>
	

		<div class="section" id="">
			<div class="tab">
				<ul>
					<li class="selected"><a href="search" id="">공지사항 목록</a></li>
				</ul>
			</div>
			<div id="tabNumber" class="tabCont">
				<div class="rState">
					<div class="left"></div>



			<div class="right">     <!-- 글쓰기 -->

				<%-- <c:if test="${sessionScope.sid.toString().startsWith('!')}"> --%>   <!-- 글쓰기 -->
				<tfoot>
					<tr>
					<td colspan="8" align="right">
					<%-- <c:if test="${grade eq '관리자' }"> --%>
						<a  href="${pageContext.request.contextPath}/seller/notice/noticeEdit" id="btnInit"  class="btnSearch reset"  >글쓰기</a>
					<%-- </c:if> --%>
					</td>
					</tr>
					</tfoot>
				<%-- 	</c:if> --%>

			</div>






<!-- 					<div class="right">
						<select name="rows" class="fSelect" init_rows="10">
							<option value="10" selected="">10개씩보기</option>
							<option value="20">20개씩보기</option>
							<option value="30">30개씩보기</option>
							<option value="50">50개씩보기</option>
							<option value="100">100개씩보기</option>
							<option value="200">200개씩보기</option>
							<option value="300">300개씩보기</option>
							<option value="500">500개씩보기</option>
						</select>
					</div> -->
				</div>
				<div id="searchResultList"
					class="mBoard typeOrder gScroll gCellSingle">
					<table border="1" summary="" class="thead">
						<tbody>
							<tr>
								<th scope="col" class="w45" style="">번호</th>
								<th scope="col" class="w120" style="">제목</th>
								<th scope="col" class="w45" style="">작성자</th>
								<th scope="col" class="w45" style="">작성일</th>
								<th scope="col" class="w45" style="">조회수</th>
									<th scope="col" class="w45" style="">관리</th>
							</tr>
						</tbody>
					</table>
					<c:choose>
						<c:when test="${list.isEmpty()}">
							<table border="1" summary="">
								<tbody class="empty center">
									<tr>
										<td colspan="15">검색된 내역이 없습니다.</td>
									</tr>
								</tbody>
							</table>
						</c:when>
						<c:otherwise>
							<c:forEach var="list" items="${list}">
							<table border="1">
									<tbody class="right ">
								<tr>
									<td class="w45 center" style="">${list.rn}</td>
									<td class="w120 center" style="" >${list.title}</td>
									<td class="w45 left" style="">${list.createUser}</td>
									<td class="w45" style="">${list.createdate}</td>
									<td class="w45" style="">${list.readCount}</td>
				
									<td class="w45" style="">
										<!-- 상세보기 --> <a href="${pageContext.request.contextPath}/seller/notice/noticeEdit?mode=EDIT&id=${list.id}"> [상세보기] 
									<%-- </a> <!-- 수정 --> <a href="edit?id=${mdto.id}"> []
									</a> <!-- 탈퇴 --> <a
										href="delete?id=${mdto.id}&type=${param.type}&keyword=${param.keyword}">
											[]
									</a> --%>
									</td>
								</tr>
							
						
								</tbody>
								
								
								
								
								
								</table>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</div>
				<input name="page" type="hidden">
				<div class="paginate">
<%-- 					<ul class="navigator1">
						<c:if test="${(not (page eq 1))&& not empty page && page>=11}">
							<li><a href="noticeList?page=${startBlock}" class="page_block">&lt;&lt;</a></li>
						</c:if>
						<c:if test="${not (page eq 1) && not empty page}">
							<li><a href="noticeList?page=${page - 1}" class="page_block">&lt;</a></li>
						</c:if>
						
						
 --%>

						
<%-- 						<!--페이지 출력 -->
						<c:forEach var="i" begin="${startBlock}" end="${endBlock}">
							<c:choose>
								<c:when test="${page == i}">
									<li class="active_page">${i}</li>
								</c:when>
								<c:otherwise>
									<c:if test="${i>0}">
										<li><a href="#" class="page_move">${i}</a></li>
									</c:if>
								</c:otherwise>
							</c:choose>
						</c:forEach>
						<c:if test="${not (page eq pageCount)}">
							<li><a href="noticeList?page=${page + 1}" class="page_block">&gt;</a></li>
						</c:if>
						<c:if test="${(not (page eq pageCount)) && pageCount>=10}">
							<li><a href="noticeList?page=${endBlock }" class="page_block">&gt;&gt;</a></li>
						</c:if>
					</ul>
			
								
					<p>1111111111111111111111111111111111111111111111 </p> --%>
			
			
		
			
			
					
					
					

					
<ul class="navigator1">
	<%-- 이전 구간 링크 --%>
	<%-- <c:if test="시작페이지가 1이 아니면"> --%>
	<c:if test="${not (page eq 1)}"> <!-- 1과 같으면 숨겨라  -->
<li><a href="noticeList?page=${startBlock}">&lt;&lt;</a></li>
	</c:if>
	
	<%-- <c:if test="현재페이지가 1이 아니면"> --%>
	<c:if test="${not (page eq 1)}">
	<li><a href="noticeList?page=${page - 1}">&lt;</a></li>
	</c:if>
	
	<%-- 페이지 출력 --%>
	<c:forEach var="i" begin="${startBlock}" end="${endBlock}">
		<c:choose>
			<c:when test="${page == i}">
				<li class="active">${i}</li>
			</c:when>
			<c:otherwise>
				<li><a href="#" class="navigator-page">${i}</a></li>
			</c:otherwise>
		</c:choose>
	</c:forEach>
	
	<%-- 다음 페이지 링크(pno + 1) --%>
	<%-- <c:if test="${아닌 현재페이지 == 전체페이지 수}"> --%>
	  <c:if test="${not (page eq pageCount)}"> 
		<li><a href="noticeList?page=${page + 1}">&gt;</a></li>
	  </c:if>  
	 <%-- <p> ${pageCount }   전체페이지 test 찍어보기 </p> --%>
	
	<%-- 다음 구간 --%>
	<c:if test="${not (page eq pageCount)}">
		<li><a href="noticeList?page=${endBlock }">&gt;&gt;</a></li>
	</c:if> 
</ul>
					
					
				</div>
			</div>
		</div>
	</div>
</form>

</body>
</html>











