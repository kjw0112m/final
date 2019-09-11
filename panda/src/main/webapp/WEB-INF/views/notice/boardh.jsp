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



/* 배송 메뉴 스타일 */
.tab_li {
	border:1px solid #dadcdd;;
	width: 50%;
	text-align: center;
}

 .tab_li a{
	display:block;
	padding: 8px 0px;   /* 폭 */
	background-clip: content-box;
} 

/*  .tab_li .count{
	font-weight: bold;
	font-size: 26px;
}  */


/* 글자 색상 크기  */
/*  .tab_li strong{                  
	font-size: 18px;
	color: #55a0ff;
} */
 
  .delTab .dTab{     /* 나누기  */
	/* height: 100px; */
	background-color: #fff;
	display: flex;
}  

/* .delTab{
	width: 100%;
	margin-bottom: 20px;
} */

.tab_li.selected:before {
    content: "";
    display: block;
    width: 100%;
    height: 4px;
    margin: -1px 0;
    background-color: #55a0ff;
}

</style>

<div class="delTab">
			<ol class="dTab">
				<li class="tab_li"><a href="${pageContext.request.contextPath}/notice/noticeList"> 
				<strong class="title">공지사항</strong><br></a>
				
				<li class="tab_li"><a href="${pageContext.request.contextPath}/one/oneList">
				<strong class="title">1:1 문의</strong><br></a>

<!-- 				<li class="tab_li"><a href="waiting"> <strong class="title">지울 예정</strong><br> 

				<li class="tab_li"><a href="shipping"> <strong class="title">#</strong><br> 
				
				<li class="tab_li"><a href="complete"> <strong class="title">#</strong><br>  -->
<%-- 				<span class="count">${complete}</span></a></li> --%>
				
			</ol>
		</div>