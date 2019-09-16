<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script
	src="${pageContext.request.contextPath}/js/cryptojs/components/core-min.js"></script>
<script
	src="${pageContext.request.contextPath}/js/cryptojs/components/sha256-min.js"></script>
<script src="${pageContext.request.contextPath}/js/password-encoder.js"></script>
<script>
	//비밀번호 검사 후 형식에 안맞을시 보조메세지 출력	
	$(function() {
		$("input[name=new_pw]").blur(function checkPw() {
			var m_pw = document.querySelector("#new_pw").value;
			var regex = /^[a-zA-Z0-9!@#$\-_]{8,15}$/;
		})
	});
	//주소
	$(function() {
		$(".addr").click(findAddress);
		$("input[name=btn]").prop("disabled", true);
	});

	//주소 찾기
	function findAddress() {
		//위에서 생성한 themeObj객체를 우편번호 서비스 생성자에 넣습니다.
		//생성자의 자세한 설정은 예제 및 속성탭을 확인해 주세요.
		new daum.Postcode({
			oncomplete : function(data) {
				// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
				// 각 주소의 노출 규칙에 따라 주소를 조합한다.
				// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
				var addr = ''; // 주소 변수
				var extraAddr = ''; // 참고항목 변수
				//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
				if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
					addr = data.roadAddress;
				} else { // 사용자가 지번 주소를 선택했을 경우(J)
					addr = data.jibunAddress;
				}
				// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
				if (data.userSelectedType === 'R') {
					// 법정동명이 있을 경우 추가한다. (법정리는 제외)
					// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
					if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
						extraAddr += data.bname;
					}
					// 건물명이 있고, 공동주택일 경우 추가한다.
					if (data.buildingName !== '' && data.apartment === 'Y') {
						extraAddr += (extraAddr !== '' ? ', '
								+ data.buildingName : data.buildingName);
					}
					// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
					if (extraAddr !== '') {
						extraAddr = ' (' + extraAddr + ')';
					}
					// 조합된 참고항목을 해당 필드에 넣는다.
				}
				$("input[name=post_code]").val(data.zonecode);
				$("input[name=basic_addr]").val(addr);
				$("input[name=detail_addr]").val('');
				$("input[name=detail_addr]").focus();
			}
		}).open();
	}

	$(function() {
		$("form").submit(function(e) {
			e.preventDefault();
			var pw = $("input[name=origin_pw]").val();
			var encPw = CryptoJS.SHA256(pw).toString();
			var ck_pw = $("input[name=pw_check]").val();
			var encNPW = CryptoJS.SHA256(ck_pw).toString();
		})
	});

	//비밀번호 검사 후 형식에 안맞을시 보조메세지 출력	
	$(function() {
		$("input[name=new_pw]")
				.blur(
						function checkPw() {
							var m_pw = document.querySelector("#new_pw").value;
							var regex = /^[a-zA-Z0-9!@#$\-_]{8,15}$/;

							var result = regex.test(m_pw);

							var span = document.querySelector(".spw");

							if (result) {
								span.innerHTML = ""
								$("input[name=btn]").prop("disabled", true)
							} else {
								span.innerHTML = "8~15자의 영문 대소문자, 숫자, 특수문자(!@#$-_)로 입력해주세요"
								$("input[name=btn]").prop("disabled", true)
							}
						});
	});

	//새로운 비밀번호 확인
	$(function() {
		var span = document.querySelector(".cpw");
		$('#new_pw').keyup(function() {
			span.innerHTML = ""
		}); //#user_pass.keyup

		$('#chpass')
				.keyup(
						function() {
							if ($('#new_pw').val() != $('#chpass').val()) {
								span.innerHTML = "<font color = '#de2195' size='2'>암호틀림</font>"
								$("input[name=btn]").prop("disabled", true)

							} else {
								span.innerHTML = "<font color = '#de2195' size='2'>암호맞음</font>"
								$("input[name=btn]").prop("disabled", false)
							}
						}); //#chpass.keyup
	});

	//비번 암호화,변경
	$(function() {
		$("#btn1").click(
				function() {
					var pw = $("input[name=origin_pw]").val();
					var encPw = CryptoJS.SHA256(pw).toString();
					var ck_pw = $("input[name=pw_check]").val();
					var encNPW = CryptoJS.SHA256(ck_pw).toString();
					$("input[name=origin_pw]").attr("name", "");
					$("input[name=new_pw]").attr("name", "");
					var newInput1 = $("<input/>").attr("name", "new_pw").val(
							encNPW).attr("type", "hidden");
					var newInput2 = $("<input/>").attr("name", "pw").val(encPw)
							.attr("type", "hidden");
					$("input[name=pw_check]").attr("name", "");
					$(this).append(newInput1);
					$(this).append(newInput2);

					$.ajax({
						url : "change_pw",
						type : "POST",
						data : {
							new_pw : $("input[name=new_pw]").val(),
							pw : encPw
						},
						dataType : "text",
						success : function(resp) {
							if (resp == "N") {
								window.alert("비밀번호가 틀렸습니다");

							} else {
								$("#pw").val('');
								$("#new_pw").val('');
								$("#chpass").val('');
								window.alert("비밀번호를 변경했습니다")
							}
						}
					});
				});
	});
</script>
<style>
.gBreak {
	display: inline-block;
	margin: 1px 0 0;
}

.ui-datepicker-trigger {
	width: 22px;
	height: 22px;
	margin-left: 5px;
	vertical-align: -3px;
	cursor: pointer;
}

.bc_g {
	background: #dedede;
}

ul, li {
	list-style: none;
}

#container {
	position: relative;
	min-width: 1180px;
}

.bc_w {
	background-color: whitesmoke;
}

.hide {
	display: none;
}

.a_bold {
	font-weight: bold;
	color: #5fa5fe;
}

#sidebar .snbArea .customer {
	padding: 18px 20px;
	border-top: 1px solid #eaeeef;
	background:
		url(//img.echosting.cafe24.com/ec/mode/influencer/common/bg_snb_customer.png)
		no-repeat 156px 20px;
}

#sidebar .snbArea .customer .title {
	font-size: 12px;
	color: #2e3039;
}

#sidebar .snbArea .customer .tel {
	margin: 7px 0 0;
	line-height: 24px;
	font-size: 24px;
	color: #2e3039;
	letter-spacing: -0.5px;
}

#sidebar .snbArea .customer .tel .dot {
	display: inline-block;
	margin: -5px 5px 0;
	vertical-align: top;
}

.table {
	border: none;
	width: 100%;
	border-width: 2px 0 0;
	border-style: solid;
	color: #555;
	border-collapse: collapse;
}

.table th, .table td {
	border-width: 0 0 1px;
	border-style: solid;
	border-color: #d0d0d0;
}

.a {
	font-size: 13px;
	padding: 0 0 0 20px;
	text-align: left;
	font-weight: 400;
	width: 13%;
}

.b {
	min-height: 40px;
	padding: 16px 20px;
}

.iText {
	width: 280px;
	height: 44px;
	padding: 0 39px 0 15px;
	min-width: 280px;
	font-size: 14px;
	margin-top: 5px;
	margin-left: 10px;
	border: 1px #eee solid;
}

#btn2div {
	margin-top: 30px;
	text-align: center;
	width: 100%;
}

.btn2 {
	height: 50px;
	width: 120px;
	padding-left: 30px;
	text-decoration: none;
	color: #555;
	font-weight: 600;
}

.span {
	font-size: 13px;
	text-align: left;
	font-weight: 400;
}

#btn1 {
	border: 1px solid;
	border-color: silver;
	background-color: white;
	color: black;
	height: 44px;
	width: 150px;
	font-size: 13px;
	margin-left: 10px;
}

.input {
	border: 1px solid;
	background-color: black;
	color: white;
	padding: 2px 60px 0;
	height: 50px;
	width: 150px;
	font-size: 15px;
}

.total {
	margin-left: 300px;
	max-width: 70%;
	padding-top: 58px;
	padding-bottom: 120px;
}

.table {
	border: none;
	width: 100%;
	border-width: 2px 0 0;
	border-style: solid;
	color: #555;
	border-collapse: collapse;
}

.table th, .table td {
	border-width: 0 0 1px;
	border-style: solid;
	border-color: #d0d0d0;
}

.a {
	font-size: 13px;
	padding: 0 0 0 20px;
	text-align: left;
	font-weight: 400;
	width: 15%;
}

.b {
	min-height: 40px;
	padding: 16px 20px;
}

.iText {
	width: 280px;
	height: 44px;
	padding: 0 39px 0 15px;
	min-width: 280px;
	font-size: 14px;
	margin-top: 5px;
	margin-left: 10px;
	border: 1px #eee solid;
}

#btn2div {
	margin-top: 30px;
	text-align: center;
	width: 100%;
}

.btn2 {
	height: 50px;
	width: 120px;
	padding-left: 30px;
	text-decoration: none;
	color: #555;
	font-weight: 600;
}

.span {
	font-size: 13px;
	text-align: left;
	font-weight: 400;
}

#btn1 {
	border: 1px solid;
	border-color: silver;
	background-color: white;
	color: black;
	height: 44px;
	width: 150px;
	font-size: 13px;
	margin-left: 10px;
}

.input {
	border: 1px solid;
	background-color: black;
	color: white;
	padding: 2px 60px 0;
	height: 50px;
	width: 150px;
	font-size: 15px;
}

.h4 {
	font-size: 30px;
	font-weight: 700px;
	margin: 20px;
}

.clear {
	clear: both;
}
</style>
<body>
	<div id="container">
		<jsp:include page="/WEB-INF/views/template/my_info.jsp"></jsp:include>
		<jsp:include page="/WEB-INF/views/template/side.jsp"></jsp:include>
	</div>
	<div class="total">
		<h1>${mdto.name}회원님의정보</h1>
		<form action="change" method="post">
			<br>

			<table class="table">
				<tr>
					<td class="a">아이디</td>
					<td class="b">${mdto.id}</td>
				</tr>
				<tr>
					<td class="a">비밀번호(수정가능)</td>
					<td class="b"><span class="span">현재 비밀번호</span> <input
						type="password" name="origin_pw" id="pw" class="iText"><br>
						<span class="span">신규 비밀번호</span><input type="password"
						class="iText" name="new_pw" id="new_pw"
						pattern="^[a-zA-Z0-9!@#$\-_]{8,15}$"><span class="spw"></span><br>
						<span class="span">비밀번호 확인</span><input type="password"
						id="chpass" name="pw_check" placeholder="비밀번호 확인" class="iText"><span
						class="cpw"></span> <input class="btn btn-danger btn-block "
						id="btn1" type="button" value="비밀번호 변경" name="btn"></td>
				</tr>
				<tr>
					<td class="a">이름</td>
					<td class="b">${mdto.name}</td>
				</tr>
				<tr>
					<td class="a">생년월일</td>
					<td class="b">${mdto.birth}</td>
				</tr>
				<tr>
					<td class="a">전화번호(수정가능)</td>
					<td class="b"><input type="text" name="phone"
						value="${mdto.phone}" class="iText"></td>
				</tr>
				<tr>
					<td class="a">이메일(수정가능)</td>
					<td class="b"><input type="text" name="email"
						value="${mdto.email}" class="iText"></td>
				</tr>
				<tr>
					<td class="a">주소(수정가능)</td>
					<td class="b">
						<div>
							<input type="text" name="post_code" value="${mdto.post_code}"
								class="iText"> <input class="addr" type="button"
								value="주소 찾기" id="btn1"><br> <input type="text"
								name="basic_addr" value="${mdto.basic_addr}" class="iText">
							<input type="text" name="detail_addr" value="${mdto.detail_addr}"
								class="iText">
						</div>
					</td>
				</tr>
				<tr>
					<td class="a">가입일</td>
					<td class="b">${mdto.regist_dt}</td>
				</tr>
				<tr>
					<td class="a">마지막 로그인 시간</td>
					<td class="b">${mdto.login_dt}</td>
				</tr>
				<tr>
					<td class="a">마지막 비밀번호 변경</td>
					<td class="b">${mdto.pw_dt}<font size="3em" color="red">
							<strong>&nbsp;&nbsp;&nbsp;비밀번호는 주기적으로 변경해주시는것이 보안상 좋습니다.</strong>
					</font></td>
				</tr>
				</tbody>
			</table>

			<div id="btn2div">
				<input type="button" value="취소" class="input"> <input
					type="submit" value="저장" class="input">
			</div>
		</form>
	</div>
	<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>