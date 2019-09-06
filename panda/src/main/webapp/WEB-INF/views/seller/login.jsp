<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 암호화 -->
<script src="https:code.jquery.com/jquery-latest.js"></script>
<script
	src="${pageContext.request.contextPath}/js/cryptojs/components/core-min.js"></script>
<script
	src="${pageContext.request.contextPath}/js/cryptojs/components/sha256-min.js"></script>


<!-- 디자인 -->
<link rel="stylesheet"
	href="https:maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script
	src="https:ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https:cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script
	src="https:maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script> 
//  비밀번호 암호화
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

//   디자인
 (function() {
   'use strict';
   window.addEventListener('load', function() {
     var forms = document.getElementsByClassName('needs-validation');
     var validation = Array.prototype.filter.call(forms, function(form) {
       form.addEventListener('submit', function(event) {
         if (form.checkValidity() === false) {
           event.preventDefault();
           event.stopPropagation();
         }
         form.classList.add('was-validated');
       }, false);
     });
   }, false);
 });
 </script>

<jsp:include page="/WEB-INF/views/template/admin/header.jsp"></jsp:include>
<form action="login" method="post" class="needs-validation" novalidate>
	<fieldset class="fieldset">
		<h2>로그인</h2>

		<div class="form-group">
			<label for="id">아이디:</label> <input type="text" class="form-control"
				id="uname" placeholder="id" name="id" value="${cookie.saveId.value}"
				required>
			<div class="valid-feedback">Valid.</div>
			<div class="invalid-feedback">아이디를 입력하세요</div>
		</div>
		<div class="form-group">
			<label for="pw">비밀번호:</label> <input type="password"
				class="form-control" id="pw" placeholder="Enter password" name="pw"
				required>
			<div class="valid-feedback">Valid.</div>
			<div class="invalid-feedback">비밀번호를 입력하세요</div>
		</div>

		<div class="form-group form-check">
			<label for="remember" class="form-check-label"> <input
				class="form-check-input" type="checkbox" name="remember"
				${not empty cookie.saveId?"checked":""}>아이디 저장하기
				<div class="valid-feedback">Valid.</div>
				<div class="invalid-feedback">Check this checkbox to continue.</div>
			</label>
		</div>
		<hr>
		<br> <input type="submit" value="로그인" class="btn btn-primary">
		<h6>
			<a href="find_id">아이디를 찾고싶어요</a>
		</h6>
		<h6>
			<a href="find_pw">비밀번호를 찾고싶어요</a>
		</h6>
	</fieldset>
</form>
</div>
</body>
</html>