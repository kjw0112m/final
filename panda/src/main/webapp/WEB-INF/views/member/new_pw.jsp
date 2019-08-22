<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--암호화 --%>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script src="${pageContext.request.contextPath}/js/cryptojs/components/core-min.js"></script>
<script src="${pageContext.request.contextPath}/js/cryptojs/components/sha256-min.js"></script>
<script src="${pageContext.request.contextPath}/js/password-encoder.js"></script>
<%--암호화 --%>
<%-- 
	비밀번호 변경 페이지 
	 - new_pw.do라는 서블릿에게 이메일, 새로운 비밀번호를 전달한다
	 - 이메일은 요청 정보 파라미터에서 추출 가능 --> 자동 첨부 처리
	 - 비밀번호는 사용자가 입력
--%>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<script>
//  비밀번호 형식 검사
		$(".pw").on("blur", function() {
			var regex = /^[a-zA-Z0-9!@#$\-_]{8,15}$/;
			var pw = $(this).val();
			var result = regex.test(pw);
			var span=document.querySelector(".spw");
			if (result) {
				span.innerHTML=""
			} else {
		 span.innerHTML = "<font color = '#de2195' size = '2'>8~15자의 영문 대소문자, 숫자, 특수문자(!@#$-_)로 입력해주세요</font>"
			}
		});
		
		//비밀번호 암호화
		$(function(){
			$("form").submit(function(e){
				e.preventDefault();	
				
				var pw = $("input[name=pw]").val();
				var encPw = CryptoJS.SHA256(pw).toString();
				
				$("input[name=pw]").attr("name","");
				var newInput = $("<input/>").attr("name","pw").val(encPw).attr("type","hidden");
				
				$(this).append(newInput);
				this.submit();
			});
		});
		</script>


<h1>비밀번호 변경</h1>
<form class="form" action="new_pw" method="post">
	<%-- hidden은 사용자에게 표시되지 않으면서 전송이 가능 --%>
	<input type="hidden" name="id" value="${id}">
	<table>
	         <tr>
						<td>새로운 비밀번호</td>
						<td><input class="pw" type="password" name="pw"
							placeholder="8~15자의 영문 대소문자, 숫자, 특수문자(!@#$-_)" required><br>
                       <span class="spw"></span></td>
					</tr>
									</table>
					<input type="submit" value="변경하기">
</form>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>







