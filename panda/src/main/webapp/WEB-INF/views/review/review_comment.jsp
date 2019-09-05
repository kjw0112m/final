<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>    

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/common2.css">


<!-- 공지사항 시작 -->


<a  href="${pageContext.request.contextPath}/notice/noticeList">공지사항<i id=gi></i></a>
&&&
<a  href="${pageContext.request.contextPath}/one/oneList">1:1 문의 <i id=gi></i></a>
&&&
<a  href="${pageContext.request.contextPath}/review/reviewComment">상품후기 <i id=gi></i></a>



<style>
.starR{
  background: url('http://miuu227.godohosting.com/images/icon/ico_review.png') no-repeat right 0;
  background-size: auto 100%;
  width: 30px;
  height: 30px;
  display: inline-block;
  text-indent: -9999px;
  cursor: pointer;
}
.starR.on{background-position:0 0;}
</style>

<!-- 자바스크립트를 이용하여 페이지 이동을 처리 -->
<script src="https://code.jquery.com/jquery-latest.js"></script>

<script>
$(function(){
	$('.starRev span').click(function(){
		  $(this).parent().children('span').removeClass('on');
		  $(this).addClass('on').prevAll('span').addClass('on');
		  $("[name='starcnt']").val($(this).text());
		  return false;
	});
	
	$('.starComment span').click(function(){
		  $(this).parent().children('span').removeClass('on');
		  $(this).addClass('on').prevAll('span').addClass('on');
		  $("[name='commentstar']").val($(this).text());
		  return false;
	});
	
});

function saveReview() {
	$('#reviewForm').attr('action','${pageContext.request.contextPath}/review/reviewCreate').submit();
}

function delComment(id) {
	if(confirm("정말 삭제할꾸야?")){
		$('#reviewForm').attr('action','${pageContext.request.contextPath}/review/delComment?id='+id).submit();
	}
}

function updateComment(id) {
	$('#commentcontent').val($('#commentarea'+id).val());
	$('#reviewForm').attr('action','${pageContext.request.contextPath}/review/updateComment?id='+id).submit();
}

function editChange(id){

	if($("#edit_"+id).attr("mode") == "NEW"){
		$("#commentarea"+id).attr("readonly",false);
		$("#star_"+id).attr("class","starComment");
		$("#edit_"+id).attr("value","완료");
		$("#edit_"+id).attr("mode","UPDATE");
		
		$('.starComment span').click(function(){
			  $(this).parent().children('span').removeClass('on');
			  $(this).addClass('on').prevAll('span').addClass('on');
			  $("[name='commentstar']").val($(this).text());
			  return false;
		});
	}else{
		if(confirm("정말 저장할꾸야?")){
			updateComment(id);
		}
	}
}

</script>

<!-- REVIEW 시작 -->
<form method="post" id="reviewForm" class="form form-vertical">
<input type="hidden" id="starcnt" name="starcnt" value="1">
<input type="hidden" id="ordersid" name="ordersid" value="1">
<input type="hidden" id="title" name="title" value="">
<input type="hidden" id="commentcontent" name="commentcontent" value="">
<input type="hidden" id="commentstar" name="commentstar" value="1">

<table border="1" width="700" class="table">
	<tbody>
		<colgroup>
		<col width="150" >
		<col width="*" >
		<col width="100" >
		</colgroup>
		<tr>
			<td>${startotalcnt.startotalcnt}</td>
			<td colspan="2" align="center">
				<div class="starRev">
				  <span class="starR">1</span>
				  <span class="starR">2</span>
				  <span class="starR">3</span>
				  <span class="starR">4</span>
				  <span class="starR">5</span>
				</div>
			</td>
		</tr>
		<tr>
			<th>내용</th>
			<td colspan="2">
				<textarea name="content" placeholder="내용" rows="10" cols="100"></textarea>
			</td>
		</tr>
	</tbody>
	<thead>
	</thead>
	<tfoot>
		<tr align="center">
			<td colspan="3"><input type="button" onclick="saveReview();" value="등록"></td>
		</tr>
		<c:forEach var="list" items="${reviewList}">
		<tr>
			<td colspan="3" align="left">
				<div id="star_${list.id}">
				  <span <c:if test="${list.starcnt >= 1 or list.starcnt == null}">class="starR on"</c:if><c:if test="${list.starcnt < 1  }">class="starR"</c:if>>1</span>				
				  <%-- <span <c:if test="${list.starcnt >= 1}">class="starR on"</c:if><c:if test="${list.starcnt < 1}">class="starR"</c:if>>1</span> --%>
				  <span <c:if test="${list.starcnt >= 2}">class="starR on"</c:if><c:if test="${list.starcnt < 2 or list.starcnt == null}">class="starR"</c:if>>2</span>
				  <span <c:if test="${list.starcnt >= 3}">class="starR on"</c:if><c:if test="${list.starcnt < 3 or list.starcnt == null}">class="starR"</c:if>>3</span>
				  <span <c:if test="${list.starcnt >= 4}">class="starR on"</c:if><c:if test="${list.starcnt < 4 or list.starcnt == null}">class="starR"</c:if>>4</span>
				  <span <c:if test="${list.starcnt >= 5}">class="starR on"</c:if><c:if test="${list.starcnt < 5 or list.starcnt == null}">class="starR"</c:if>>5</span>
				</div>
			</td>
		</tr>
		<tr>
			<td colspan="3">
				<textarea  placeholder="내용" rows="10" id="commentarea${list.id}" cols="125" readonly="readonly">${list.content}</textarea>
			☞${list.createuser} ♨ ${list.registdt}
			</td>
		</tr>
		<c:if test="${sessionScope.sid.toString().startsWith('!') or sessionScope.sid.toString() eq list.createuser}">
			<tr align="right">
				<td id="btn1_${list.id}" colspan="3">
					<input type="button" id="edit_${list.id}" mode="NEW" onclick="editChange(${list.id});" value="수정">
					<input type="button" onclick="delComment(${list.id});" value="삭제">
				</td>
			</tr>
		</c:if>
		</c:forEach>
	</tfoot>
</table>
</form>
<!-- REVIEW 끝 -->

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>    