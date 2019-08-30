<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%--암호화 --%>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script	src="${pageContext.request.contextPath}/js/cryptojs/components/core-min.js"></script>
<script	src="${pageContext.request.contextPath}/js/cryptojs/components/sha256-min.js"></script>
<%--암호화 --%>

 
    
<script>
	$(function() {
		var span=document.querySelector(".cpw");
		$('#m_pw').keyup(function() {
			span.innerHTML=""
		}); //#user_pass.keyup
	
		$('#chpass').keyup(function() {
			if ($('#m_pw').val() != $('#chpass').val()) {
				span.innerHTML = "<font color = '#de2195' size = '2'>암호틀림</font>"
				$("input[name=btn]").prop("disabled", true)
				
			} else {
				span.innerHTML = "<font color = '#de2195' size = '2'>암호맞음</font>"
				$("input[name=btn]").prop("disabled", false)
			}
		}); //#chpass.keyup
	});
	//암호화
	$(function(){
		$("form").submit(function(e){
			e.preventDefault();	
			
			var pw = $("input[name=origin_pw]").val();
			var encPw = CryptoJS.SHA256(pw).toString();
			
			var ck_pw = $("input[name=pw_check]").val();
			var encNPW = CryptoJS.SHA256(ck_pw).toString();
			
			console.log(encPw);
			console.log(encNPW);
			$("input[name=origin_pw]").attr("name","");
			$("input[name=n_pw]").attr("name","");
			var newInput2 = $("<input/>").attr("name","pw").val(encPw).attr("type","hidden");
			var newInput1 = $("<input/>").attr("name","new_pw").val(encNPW).attr("type","hidden");
			$("input[name=pw_check]").attr("name","");
			$(this).append(newInput1);
			$(this).append(newInput2);
			
			this.submit();
		});
	});
</script>
	  <jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>  
	  <div align = "center">
		<form action="login_changePw" method="post" >
					
							<h1>비밀번호 확인</h1>
						<table border=1>
							<tbody>
							
							<tr>
								<td><label for="m_pw">예전 비밀번호</label></td>
								<td>
									<input  type="password" placeholder="예전 비밀번호" name="origin_pw" id="mem_pw" required>
								</td>
							</tr>
					
							<tr>
							<td><label for="m_pw">새로운 비밀번호</label></td>
							<td>
								<input  placeholder="새로운 비밀번호"type="password"  name="n_pw" id="m_pw" pattern="^[a-zA-Z0-9!@#$\-_]{8,15}$" required>
							<br>
							<span class="cpw"></span></td>
													</tr>
						<tr>
							<td><label>새로운 비밀번호 확인</label></td>
							<td><input  type="password" id="chpass" name="pw_check"
									placeholder="비밀번호 확인" required>
									 <font name="check"	size="3" color="red"></font></td><br> 
							
						</tr>
						<tr>
							<td colspan="2">
								<input type="submit" value="확인" name="btn">
							</td>
						</tr>
						</tbody>
					</table>
		
		</form>
	</div>
 
 
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>