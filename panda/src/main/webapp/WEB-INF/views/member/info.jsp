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
	$(function() {
		var target = $(".product, .order, .member, .promotion, .stat, .board");
		target.click(function() {
			$(this).next().toggle();
			$(this).parent().toggleClass("bc_w");
			target.not($(this)).next().hide();
			target.not($(this)).parent().removeClass("bc_w");
		});

		target.next().find("a").click(function() {
			$(this).addClass("a_bold");
			target.next().find("a").not($(this)).removeClass("a_bold");
			console.log(this);
		});
	});

	//주소
	$(function() {
		$(".addr").click(findAddress);
		$("input[name=btn]").prop("disabled", true);
	});

	function findAddress() {
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

				// 사용자가 선택
				// 				한 주소가 도로명 타입일때 참고항목을 조합한다.
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

				// 우편번호와 주소 정보를 해당 필드에 넣는다.
				// document.querySelector('input[name=postcode]').value = data.zonecode;
				// document.querySelector("input[name=basicaddr]").value = addr;
				// 커서를 상세주소 필드로 이동한다.
				// document.querySelector("input[name=detailaddr]").focus();

				// 이 코드는 jquery.js 를 먼저 불러온 경우만 사용 가능
				$("input[name=post_code]").val(data.zonecode);
				$("input[name=basic_addr]").val(addr);
				$("input[name=detail_addr]").focus();
			}
		}).open();
	}

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
								span.innerHTML = "<font color = '#de2195' size = '2'>8~15자의 영문 대소문자, 숫자, 특수문자(!@#$-_)로 입력해주세요</font>"
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
								span.innerHTML = "<font color = '#de2195' size = '2'>암호틀림</font>"
								$("input[name=btn]").prop("disabled", true)

							} else {
								span.innerHTML = "<font color = '#de2195' size = '2'>암호맞음</font>"
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
}

#sidebar {
	position: fixed;
	z-index: 201;
	top: 0;
	left: 0;
	width: 220px;
	height: 100%;
	margin-left: 30px;
	padding: 150px 0 0;
	box-sizing: border-box;
	vertical-align: top;
}

#sidebar .snbArea {
	display: flex;
	flex-direction: column;
	height: 100%;
}

#snb {
	margin: 0 0 auto;
	padding: 0;
}

#a {
	text-decoration: none;
	color: black;
	line-height: 50px;
}

#snb>li {
	position: relative;
}

#snb>li>ul {
	margin-bottom: 10px;
}

#snb>li>a {
	margin-left: 15px;
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

.total {
	margin: 0 auto;
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

.h4{
	font-size: 30px;
	font-weight: 700px;
	margin: 20px;
}
</style>
</head>

<body>
	<div id="container">
		<div id="sidebar">
			<div class="snbArea">
				<ul id="snb">
					<li>
						<h4 class="h4">MY PAGE</h4>
					</li>
					<li><a id="a" href="#none" class="product"> 좋아요 </a></li>
					<li><a id="a"
						href="#"
						class="order"> 주문 관리 </a>
						<ul class="hide">
							<li class=""><a id="a" href="#"> 주문 배송 조회 </a></li>
							<li class=""><a id="a" href="#"> 취소/교환/반품/환불 </a></li>
						</ul></li>
					<li><a id="a" href="#" class="member"> 회원 혜택 </a></li>
					<li><a id="a" href="#" class="board"> 정보 관리 </a>
						<ul class="hide">
							<li class=""><a id="a" href="#"> 회원정보 수정 </a></li>
							<li class=""><a id="a" href="#"> 회원 탈퇴 </a></li>
						</ul></li>
					<li><a id="a" href="#" class="promotion"> 문의내역 </a>
						<ul class="hide">
							<li class=""><a id="a" href="#"> 통합 문의 </a></li>
							<li class=""><a id="a" href="#"> 상품 문의 </a></li>
							<li class=""><a id="a" href="#"> 1:1 문의 </a></li>
						</ul></li>
				</ul>
				<div class="customer">
					<strong class="title">고객센터 <span class="info">(평일
							9~18시)</span></strong>
					<div class="tel">
						8080<span class="dot">.</span>8080
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="total">
		<h1>${mdto.name}회원님의정보,정보수정</h1>
		<form action="change" method="post">
			<br>

			<table class="table">

				<tr>
					<td class="a">아이디</td>
					<td class="b">${mdto.id}</td>
				</tr>
				<tr>
					<td class="a">비밀번호(수정가능)</td>
					<td class="b"><span class="span">현재 비밀번호</span><input
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
					<td class="b">${mdto.pw_dt}</td>
				</tr>
				</tbody>
			</table>

			<div id="btn2div">
				<input type="button" value="취소" class="input"> <input
					type="submit" value="저장" class="input">
			</div>
		</form>
	</div>
</body>

</html>











