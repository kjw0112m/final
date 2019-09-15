<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>

<%-- <jsp:include page="/WEB-INF/views/notice/boardh.jsp"></jsp:include>   --%>

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/common2.css">



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


/* 정렬 가운데  */
#ha2 {
	/* border:1px solid #dadcdd;; */
	width: 100%;
	text-align: center;
}


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
	
	 getCommentList();  /*   후기 리스트 주석 처리  */ 
});

function getCommentList(){
	
	$.ajax({
        url: '${pageContext.request.contextPath}/review/reviewListAjax?orderid=${param.orderid}'
      , dataType : 'json'
      , success: function(data) {
    	  $(data).each(function(i) {
    		  var createHtml = '';
    			createHtml += '<tr>';
    			createHtml += '<td colspan="3" align="left">';
    			createHtml += '<div id="star_'+data[i].id+'">';
    			if(data[i].starcnt >= 1){
    				createHtml += '	  <span class="starR on">1</span>';
    			}else{
    				createHtml += '	  <span class="starR">1</span>';
    			}
    			if(data[i].starcnt >= 2){
    				createHtml += '	  <span class="starR on">2</span>';
    			}else{
    				createHtml += '	  <span class="starR">2</span>';	
    			}
    			if(data[i].starcnt >= 3){
    				createHtml += '	  <span class="starR on">3</span>';
    			}else{
    				createHtml += '	  <span class="starR">3</span>';
    			}
    			if(data[i].starcnt >= 4){
    				createHtml += '	  <span class="starR on">4</span>';
    			}else{
    				createHtml += '	  <span class="starR">4</span>';
    			}
    			if(data[i].starcnt >= 5){
    				createHtml += '	  <span class="starR on">5</span>';
    			}else{
    				createHtml += '	  <span class="starR">5</span>';
    			}
    			createHtml += '	</div>';
    			createHtml += '</td>';
    			createHtml += '</tr>';
    			createHtml += '<tr>';
    			createHtml += '<td colspan="3">';
    			createHtml += '	<textarea  placeholder="내용" id="commentarea'+data[i].id+'" rows="10" id="commentarea" cols="125" readonly="readonly">'+data[i].content+'</textarea>';
    			createHtml += '작성자&nbsp'+data[i].createuser+'&nbsp&nbsp&nbsp&nbspⓣ '+data[i].registdt;
    			createHtml += '</td>';
    			createHtml += '</tr>';
    			createHtml += '<tr align="right">';
    			createHtml += '<td colspan="3">';
    			createHtml += '<input type="button" id="edit_'+data[i].id+'" mode="NEW" onclick="editChange('+data[i].id+');" value="수정">';
    			createHtml += '<input type="button" onclick="delComment('+data[i].id+');" value="삭제">';
				createHtml += '</td>';
				createHtml += '</tr>';
    			$("#ftComment").prepend(createHtml); 
    			$("#totalStar").text(data[0].startotalcnt);
          });
        }
      , error : function(xhr, status, error) {
    	  alert("code:"+status+"\n"+"message:"+xhr+"\n"+"error:"+error);
      	}
	});


	 
	  
}

function saveReview() {
	/* $('#reviewForm').attr('action','${pageContext.request.contextPath}/review/reviewCreate').submit(); */
	var queryString = $("form[name=reviewForm]").serialize() ;

	$.ajax({
        url: '${pageContext.request.contextPath}/review/reviewCreateAjax'
      , data : queryString
      , dataType : 'json'
      , success: function(data) {
    	  getCommentList();
        }
      , error : function(xhr, status, error) {
    	  alert("code:"+status+"\n"+"message:"+xhr+"\n"+"error:"+error);
      	}
	});
}

function delComment(id) {
	if(confirm("정말 삭제할꾸야?")){
		/* $('#reviewForm').attr('action','${pageContext.request.contextPath}/review/delComment?id='+id).submit(); */
		$.ajax({
	        url: '${pageContext.request.contextPath}/review/delCommentAjax?id='+id
	      , dataType : 'json'
	      , success: function(data) {
	    	  $("#ftComment").html(""); /*  화면 초기화 해줌  */
	    	  getCommentList();
	        }
	      , error : function(xhr, status, error) {
	    	  alert("code:"+status+"\n"+"message:"+xhr+"\n"+"error:"+error);
	      	}
		});
	}
}

function updateComment(id) {
	$('#commentcontent').val($('#commentarea'+id).val());
	$('#commentid').val(id);
	/* $('#reviewForm').attr('action','${pageContext.request.contextPath}/review/updateComment?id='+id).submit(); */
	
	$.ajax({
        url: '${pageContext.request.contextPath}/review/updateCommentAjax?id='+id+'&content='+$('#commentarea'+id).val()+'&star='+$("[name='commentstar']").val()
      , dataType : 'json'
      , success: function(data) {
    	  $("#ftComment").html(""); /*  화면 초기화 해줌  */
    	  getCommentList();
        }
      , error : function(xhr, status, error) {
    	  alert("code:"+status+"\n"+"message:"+xhr+"\n"+"error:"+error);
      	}
	});
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

<div id="ha2">
<h2 > 상품 후기  </h2>
</div>

<!-- REVIEW 시작 -->
<form method="post" id="reviewForm" name="reviewForm" class="form form-vertical">
<input type="hidden" id="starcnt" name="starcnt" value="1">
<input type="hidden" id="ordersid" name="ordersid" value="${param.orderid}">
<input type="hidden" id="title" name="title" value="">
<input type="hidden" id="commentid" name="commentid" value="">
<input type="hidden" id="commentcontent" name="commentcontent" value="">
<input type="hidden" id="commentstar" name="commentstar" value="1">

<table border="1" width="700" class="table">
	<tbody>
		<colgroup>
		<col width="150" >
		<col width="*" >
		<col width="100" >
		</colgroup>
		
		
		<!--  -->
		
		<tr> 
		<td align="center" > 평균 별점
		</td>  
		
			<td colspan="2" align="left" id="totalStar">     
			</td>
			
			
		</tr>
		
		 
		
		<tr>
			<td colspan="3" align="center"> 로그인 후 평가해주세요! 
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
			<th>리뷰</th>
			<td colspan="2">
				<textarea name="content" placeholder="리뷰 작성 시 광고 및 욕설, 비속어나 타인을 비방하는 문구를 사용하시면 삭제 될 수 있습니다." rows="10" cols="100"></textarea>
			</td>
		</tr>
		<tr align="center">
			<td colspan="3"><input type="button" onclick="saveReview();" value="리뷰 남기기"></td>
		</tr>
		 
		
		<!-- 글쓰기 주석 원하면   -->
		
	</tbody>
	<thead>
	</thead>
	<tfoot id="ftComment">

	</tfoot>
</table>
</form>
<!-- REVIEW 끝 -->

