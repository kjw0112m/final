<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>

/* 검색 정렬 끝  */
#ha3 {
	/* border:1px solid #dadcdd;; */
	width: 100%;
 	text-align: center; 
	
    /* height: 10px; */
     margin: -1px 0; 
}

/* 정렬 가운데  */
#ha2 {
	/* border:1px solid #dadcdd;; */
	width: 100%;
	text-align: center;
}
.delTab ol{
	width: 1260px;
	margin: auto;
}


</style>

<div class="delTab">
			<ol class="dTab">
				<li class="tab_li"><a href="${pageContext.request.contextPath}/notice/noticeList"> 
				<strong class="title">공지사항</strong><br>
				
				<li class="tab_li"><a href="${pageContext.request.contextPath}/one/oneList">
				<strong class="title">1:1 문의</strong><br>

<!-- 				<li class="tab_li"><a href="waiting"> <strong class="title">지울 예정</strong><br> 

				<li class="tab_li"><a href="shipping"> <strong class="title">#</strong><br> 
				
				<li class="tab_li"><a href="complete"> <strong class="title">#</strong><br>  -->
<%-- 				<span class="count">${complete}</span></a></li> --%>
				
			</ol>
		</div>