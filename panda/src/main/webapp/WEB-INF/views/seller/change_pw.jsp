<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<%--암호화 --%>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script src="${pageContext.request.contextPath}/js/cryptojs/components/core-min.js"></script>
<script src="${pageContext.request.contextPath}/js/cryptojs/components/sha256-min.js"></script>
<%--암호화 --%>
<style>


.table input {
	width: 190px;
}

.table input[name=btn] {
	width: 100px;
	align: center;
	margin-left: 120px;
}
</style>
<script>
//비밀번호 검사 후 형식에 안맞을시 보조메세지 출력	
$(function(){
	$("input[name=new_pw]").blur(
		function checkPw(){
		    var m_pw = document.querySelector("#new_pw").value;
		    var regex = /^[a-zA-Z0-9!@#$\-_]{8,15}$/;
	    
		    var result = regex.test(m_pw);
		    
		    var span=document.querySelector(".spw");
		
		    if(result) {
		    	span.innerHTML=""
		    }
		    else {
		    	 span.innerHTML = "<font color = '#de2195' size = '2'>8~15자의 영문 대소문자, 숫자, 특수문자(!@#$-_)로 입력해주세요</font>"
	        
	   		 }
		});
	});
	
	$(function() {
		var span=document.querySelector(".cpw");
		$('#new_pw').keyup(function() {
			span.innerHTML=""
		}); //#user_pass.keyup
	
		$('#chpass').keyup(function() {
			if ($('#new_pw').val() != $('#chpass').val()) {
				 span.innerHTML = "<font color = '#de2195' size = '2'>암호틀림</font>"
				$("input[name=btn]").prop("disabled", true)
				
			} else {
				span.innerHTML = "<font color = '#de2195' size = '2'>암호맞음</font>"
				$("input[name=btn]").prop("disabled", false)
			}
		}); //#chpass.keyup
	});
	$(function(){
		$("form").submit(function(e){
			e.preventDefault();	
			var pw = $("input[name=origin_pw]").val();
			var encPw = CryptoJS.SHA256(pw).toString();
			var ck_pw = $("input[name=pw_check]").val();
			var encNPW = CryptoJS.SHA256(ck_pw).toString();
						
			$("input[name=origin_pw]").attr("name","");
			$("input[name=new_pw]").attr("name","");
			var newInput2 = $("<input/>").attr("name","pw").val(encPw).attr("type","hidden");
			var newInput1 = $("<input/>").attr("name","new_pw").val(encNPW).attr("type","hidden");
			$("input[name=pw_check]").attr("name","");
			$(this).append(newInput1);
			$(this).append(newInput2);
			
			this.submit();
		});
	});
</script>
<div align="center">
<c:if test="${not empty param.error}">
	<h2>
		<font color="red">
			현재 비밀번호을 잘못 입력하셨습니다	
		</font>
	</h2>
</c:if>
	<form action="change_pw" method="post" >
		
			<h1>비밀번호 바꾸기</h1>
			<table border=1 >
				<tbody>

					<tr>
						<td>현재 비밀번호</td>
						<td><input  type="password"
							name="origin_pw" id="pw" required></td>
					</tr>
					<tr>
						<td colspan="2"></td>
					</tr>
					<tr>
						<td>새로운 비밀번호</td>
						<td><input type="password" class="form-control"
							name="new_pw" id="new_pw"
							pattern="^[a-zA-Z0-9!@#$\-_]{8,15}$" required>
				<br>
                       <span class="spw"></span></td>
					</tr>
					<tr>
						<td>새로운 비밀번호 다시 입력</td>
						<td><input type="password" id="chpass"
							name="pw_check" placeholder="비밀번호 확인" required>
	<br>
							<span class="cpw"></span></td>
													</tr>
					<tr>
						<td colspan="2"><input class="btn btn-danger btn-block"
							type="submit" value="확인" name="btn"></td>
					</tr>
				</tbody>
			</table>
	
	</form>
</div>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>