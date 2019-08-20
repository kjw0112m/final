<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>    
<script>
// Disable form submissions if there are invalid fields
(function() {
  'use strict';
  window.addEventListener('load', function() {
    // Get the forms we want to add validation styles to
    var forms = document.getElementsByClassName('needs-validation');
    // Loop over them and prevent submission
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


<%--암호화 --%>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script src="${pageContext.request.contextPath}/js/cryptojs/components/core-min.js"></script>
<script src="${pageContext.request.contextPath}/js/cryptojs/components/sha256-min.js"></script>
<script src="${pageContext.request.contextPath}/js/password-encoder.js"></script>
<%--암호화 --%>


<%--디자인 --%>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<style>
h1, h2, a {
	color: black !important;
	text-decoration: none;
	text-align: center;
}

</style>	
	
	<%-- 
	(주의) 테이블과 폼을 같이 사용할 때는 th 안쪽이나 테이블 바깥에 폼구현 
	--%>
	
	<div class="container">
	<form action="login" method="post"class="needs-validation" novalidate>
	<fieldset class="fieldset">
		<h2>로그인</h2>
	
		 <div class="form-group">
      <label for="id">아이디:</label>
      <input type="text" class="form-control" id="uname" placeholder="id" name="id" value="${cookie.saveId.value}"required>
      <div class="valid-feedback">Valid.</div>
      <div class="invalid-feedback">아이디를 입력하세요</div>
    </div>
	 <div class="form-group">
      <label for="pw">비밀번호:</label>
      <input type="password" class="form-control" id="pw" placeholder="Enter password" name="pw" required>
      <div class="valid-feedback">Valid.</div>
      <div class="invalid-feedback">비밀번호를 입력하세요</div>
    </div>

		<div class="form-group form-check">
				<label for="remember"class="form-check-label">
		<input class="form-check-input" type="checkbox" name="remember" ${not empty cookie.saveId?"checked":""}>아이디 저장하기
		  <div class="valid-feedback">Valid.</div>
        <div class="invalid-feedback">Check this checkbox to continue.</div>
</label>
		</div>
		<hr><br>
		<input type="submit" value="로그인" class="btn btn-primary">
	<h6><a href="find_id">아이디를 찾고싶어요</a></h6>
	<h6><a href="find_pw">비밀번호를 찾고싶어요</a></h6>
	</fieldset>
	</form>
</div>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>    




