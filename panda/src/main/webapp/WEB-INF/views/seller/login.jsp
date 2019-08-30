<%-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> --%>
<%-- <%@ page language="java" contentType="text/html; charset=UTF-8" --%>
<%--     pageEncoding="UTF-8"%> --%>
<!-- <!DOCTYPE html> -->
<!-- <html> -->
<!-- <head> -->
<!-- <meta charset="UTF-8"> -->
<!-- <title>Insert title here</title> -->
<!-- </head> -->
<!-- <style> -->
/*     #container { */
/*         padding: 250px 0 0 0; */
/*         border-top: 1px solid #e8e9ed; */
/*     } */

/*     #content.admin { */
/*         width: 788px; */
/*         padding: 0 95px 60px; */
/*     } */

/*     #content { */
/*         width: 883px; */
/*         margin: 0 auto; */
/*         padding: 0 0 60px 95px; */
/*     } */

/*     .login fieldset { */
/*         width: 400px; */
/*     } */

/*     #header { */
/*         color: white; */
/*         background-color: black; */
/*         position: relative; */
/*         height: 100%; */
/*         width: 100%; */
/*         border-bottom: 1px solid white; */
/*     } */

/*     #header>h1 { */
/*         margin: 0; */
/*         padding: 0; */
/*     } */

/*     body { */
/*         margin: 0; */
/*     } */
<!-- </style> -->

<!-- <body> -->
<!--     <div id="header"> -->
<!--         <h1>판다 쇼핑몰 센터</h1> -->

<!--     </div> -->
<!--     <div id="container"> -->
<!--         <div id="content" class="admin"> -->
<!--             <div class="loginArea"> -->
<!--                 <h1>판다 관리자 로그인</h1> -->
<!--                 <div class="login"> -->
<!--                     <form action="login" method="POST"> -->
<!--                         <fieldset> -->
<!--                             <legend>로그인</legend> -->
<!--                             <label class="ePlaceholder"> -->
<!--                                 <span id="label_id" class="pos" style="display: block;">상점아이디</span> -->
<!--                                 <input type="text" name="id" class="text"> -->
<!--                             </label> -->
<!--                             <label class=" ePlaceholder"> -->
<!--                                 <span id="label_pw" class="pos" style="display: block;">비밀번호</span> -->
<!--                                 <input type="password" name="pw" class="text"> -->
<!--                             </label> -->
<!--                             <p> -->
<!--                                 <input type="submit" value="로그인"> -->
<!--                             </p> -->
<!--                         </fieldset> -->
<!--                     </form> -->
<!--                 </div> -->
<!--             </div> -->

<!--         </div> -->

<!--     </div> -->
<!-- </body> -->
<!-- </html> -->

<%-- <%--암호화 --%> --%>
<!-- <script src="https://code.jquery.com/jquery-latest.js"></script> -->
<%-- <script src="${pageContext.request.contextPath}/js/cryptojs/components/core-min.js"></script> --%>
<%-- <script src="${pageContext.request.contextPath}/js/cryptojs/components/sha256-min.js"></script> --%>


<%-- <%--디자인 --%> --%>
<!--   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"> -->
<!--   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script> -->
<!--   <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script> -->
<!--   <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script> -->
<%-- <jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>     --%>
<!-- <script> -->
// //비밀번호 암호화
// $(function(){
// 	$("form").submit(function(e){
// 		e.preventDefault();	
		
// 		var pw = $("input[name=pw]").val();
// 		var encPw = CryptoJS.SHA256(pw).toString();
		
// 		$("input[name=pw]").attr("name","");
// 		var newInput = $("<input/>").attr("name","pw").val(encPw).attr("type","hidden");
		
// 		$(this).append(newInput);
// 		this.submit();
// 	});
// });

// // 디자인
// (function() {
//   'use strict';
//   window.addEventListener('load', function() {
//     // Get the forms we want to add validation styles to
//     var forms = document.getElementsByClassName('needs-validation');
//     // Loop over them and prevent submission
//     var validation = Array.prototype.filter.call(forms, function(form) {
//       form.addEventListener('submit', function(event) {
//         if (form.checkValidity() === false) {
//           event.preventDefault();
//           event.stopPropagation();
//         }
//         form.classList.add('was-validated');
//       }, false);
//     });
//   }, false);
// });
<!-- </script> -->

<!-- <style> -->
/* h1, h2, a { */
/* 	color: black !important; */
/* 	text-decoration: none; */
/* 	text-align: center; */
/* } */


<!-- </style>	 -->
	
<%-- 	<%--  --%>
<%-- 	(주의) 테이블과 폼을 같이 사용할 때는 th 안쪽이나 테이블 바깥에 폼구현  --%>
<%-- 	--%> --%>
<!-- 	<body> -->
<!-- 	<div class="container"> -->
<!-- 	<form action="login" method="post"class="needs-validation"  novalidate> -->
<!-- 	<fieldset class="fieldset"> -->
<!-- 		<h2>로그인</h2> -->
	
<!-- 		 <div class="form-group"> -->
<!--       <label for="id">아이디:</label> -->
<%--       <input type="text" class="form-control" id="uname" placeholder="id" name="id" value="${cookie.saveId.value}"required> --%>
<!--       <div class="valid-feedback">Valid.</div> -->
<!--       <div class="invalid-feedback">아이디를 입력하세요</div> -->
<!--     </div> -->
<!-- 	 <div class="form-group"> -->
<!--       <label for="pw">비밀번호:</label> -->
<!--       <input type="password" class="form-control" id="pw" placeholder="Enter password" name="pw" required> -->
<!--       <div class="valid-feedback">Valid.</div> -->
<!--       <div class="invalid-feedback">비밀번호를 입력하세요</div> -->
<!--     </div> -->

<!-- 		<div class="form-group form-check"> -->
<!-- 				<label for="remember"class="form-check-label"> -->
<%-- 		<input class="form-check-input" type="checkbox" name="remember" ${not empty cookie.saveId?"checked":""}>아이디 저장하기 --%>
<!-- 		  <div class="valid-feedback">Valid.</div> -->
<!--         <div class="invalid-feedback">Check this checkbox to continue.</div> -->
<!-- </label> -->
<!-- 		</div> -->
<!-- 		<hr><br> -->
<!-- 		<input type="submit" value="로그인" class="btn btn-primary"> -->
<!-- 	<h6><a href="find_id">아이디를 찾고싶어요</a></h6> -->
<!-- 	<h6><a href="find_pw">비밀번호를 찾고싶어요</a></h6> -->
<!-- 	</fieldset> -->
<!-- 	</form> -->
<!-- </div> -->
<%-- <jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>     --%>


