<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script
	src="${pageContext.request.contextPath}/js/cryptojs/components/core-min.js"></script>
<script
	src="${pageContext.request.contextPath}/js/cryptojs/components/sha256-min.js"></script>
<script>
	$(function() {
		$(".addr").click(findAddress);
		$("input[type=submit]").prop("disabled", true).css("background-color",
				"#788784");
		$("#idCheck").prop("disabled", true).css("background-color", "#788784");
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

				// 이 코드는 jquery.js 를 먼저 불러온 경우만 사용 가능
				$("input[name=post_code]").val(data.zonecode);
				$("input[name=basic_addr]").val(addr);
				$("input[name=detail_addr]").focus();
			}
		}).open();
	}

	$(function() {
		$("#idCheck").click(function() {
			$.ajax({
				url : "idCheck",
				data : {
					id : $("input[name=id]").val()
				},
				dataType : "text",
				success : function(resp) {
					if (resp == "N") {
						window.alert("이미 사용중인 아이디입니다");
						$("input[name=id]").select();
					}
					//중복검사해서 사용할 수 있는 아이디이면 가입버튼 활성화
					else {
						window.alert("사용 가능한 아이디입니다")
					}
				}
			});
		});
	});
	// 아이디 형식 검사
	$(function() {
		$(".id")
				.on(
						"blur",
						function() {
							var regex = /^[a-z0-9A-Z]{8,16}$/;
							var id = $(this).val();
							var result = regex.test(id);
							var span = document.querySelector(".sid");
							if (result) {
								span.innerHTML = ""
								$("#idCheck").prop("disabled", false).css(
										"background-color", "#4790b8");
							} else {
								span.innerHTML = "<font color = '#de2195' size = '2'>8~15자의 영문 소문자,대문자, 숫자로 입력해주세요</font>"
								$("#idCheck").prop("disabled", true).css(
										"background-color", "#6c9391");
							}

						});
		//  비밀번호 형식 검사
		$(".pw")
				.on(
						"blur",
						function() {
							var regex = /^[a-zA-Z0-9!@#$\-_]{8,15}$/;
							var pw = $(this).val();
							var result = regex.test(pw);
							var span = document.querySelector(".spw");
							if (result) {
								span.innerHTML = ""
							} else {
								span.innerHTML = "<font color = '#de2195' size = '2'>8~15자의 영문 대소문자, 숫자, 특수문자(!@#$-_)로 입력해주세요</font>"
							}
						});
		//비밀 번호 확인 검사
		$(function() {
			var span = document.querySelector(".cpw");
			$('#user_pass').keyup(function() {
				span.innerHTML = ""
			}); //#user_pass.keyup

			$('#chpass')
					.keyup(
							function() {
								if ($('#user_pass').val() != $('#chpass').val()) {
									span.innerHTML = "<font color = '#de2195' size = '2'>암호틀림</font>"
								} else {
									span.innerHTML = "<font color = '#de2195' size = '2'>암호맞음</font>"
								}
							}); //#chpass.keyup
		});
	});

	// 비밀번호 확인 숨기기
	$(function() {
		$("form").submit(
				function(e) {
					e.preventDefault();

					var pw = $("input[name=pw]").val();
					var encPw = CryptoJS.SHA256(pw).toString();
					var ck_pw = $("input[name=pw_check]").val();
					$("input[name=pw]").attr("name", "");
					var newInput1 = $("<input/>").attr("name", "pw").val(encPw)
							.attr("type", "hidden");
					$("input[name=pw_check]").attr("name", "");
					$(this).append(newInput1);
					this.submit();
				});
	});
	//이메일 본인 인증
	$(function() {
		$(".email").click(function() {
			$.ajax({
				url : "email_cert",
				data : {
					email : $("input[name=email]").val(),

				},
				success : function(resp) {
					if (resp == "Y") {
					}
				}
			});
		});
	});

	$(function() {
		$(".verification_check").click(
				function() {
					$.ajax({
						url : "email_cert_check",
						data : {
							identity : $("input[name=identity]").val()
						},
						dataType : "text",
						success : function(resp) {
							if (resp == "Y") {
								window.alert("올바른 인증번호 입니다");
								$("input[type=submit]").prop("disabled", false)
										.css("background-color", "#4790b8");
							} else {
								window.alert("인증번호가 올바르지 않습니다")
								$("input[name=identity]").select();
							}
						}
					});
				});
	});
</script>
<style>
.total {
	margin: 0 auto;
	max-width: 1260px;
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
	width: 10%;
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
	border: 1px #eee solid;
}

button {
	width: 150px;
	height: 45px;
	font-size: 14px;
	margin-top: 5px;
	border: 1px #bbb solid;
	background-color: white !important;
	text-align: center;
	color: black;
	font-weight: 600;
}

.birth-text {
	width: 500px
}

.birth-text input {
	height: 37px;
	width: 80px;
	padding: 0 15px 0 15px;
	text-align: center;
	border: none;
}

.birth-div {
	width: auto;
	display: inline-block;
	height: 40px;
	border: 1px #eee solid;
}

#registcheck {
	margin-top: 30px;
	margin-left: 40%;
	border: none;
	background-color: black !important;
	color: #fff;
	height: 60px;
	width: 220px;
}
</style>
</head>

	<div class="total">
            <h1>회원 가입</h1>
            <br>
            <form action="regist" method="post">
                <div>
                    <table class="table">
                        <tbody>

                            <tr>
                                <td class="a">아이디</td>
                                <td class="b"><input
								class="id iText" type="text" name="id" placeholder="아이디 8~16글자"
								required>
                                        <button id="idCheck">중복확인</button><br><span
								class="sid"></span></td>
                                        
                            </tr>

                            <tr>
                                <td class="a">비밀번호</td>
                                <td class="b"><input
								class="pw iText" type="password" name="pw" id="user_pass"
								placeholder="8~15자의 영문 대소문자, 숫자, 특수문자(!@#$-_)" required><br> <span
								class="spw"></span></td>
                            </tr>
                            <tr>
                                <td class="a">비밀번호 확인</td>
                                <td class="b"><input class="iText"
								type="password" id="chpass" name="pw_check"
								placeholder="비밀번호 확인" required><br>
                                    <span class="cpw"></span></td>
                            </tr>

                            <tr>
                                <td class="a">이름</td>
                                <td class="b"><input class="iText"
								type="text" name="name" placeholder="이름" required></td>
                            </tr>


                            <tr>
                                <td class="a">핸드폰번호</td>
                                <td class="b"><input type="text"
								name="phone" placeholder="전화번호(- 제외)" class="iText"></td>
                            </tr>

                            <tr>
                                <td class="a">주소</td>
                                <td class="b">
                                    <div>
                                        <input type="text"
										name="post_code" placeholder="우편번호" readonly class="iText">
                                        <button class="addr">우편번호 찾기</button>
									<br>
                                        <input type="text"
										name="basic_addr" placeholder="주소" readonly class="iText">
                                        <input type="text"
										name="detail_addr" placeholder="상세주소" class="iText">

                                    </div>
                                </td>
                            </tr>

                            <tr>
                                    <td class="a">생년월일</td>
                                    <td class="b birth-text">
                                        <div class="birth-div">
                                            <input type="text"
										name="birth" value maxlength="4" placeholder="YYYY" required> <span>/</span> <input
										type="text" name="birth" value maxlength="2" placeholder="MM"
										required> <span>/</span> <input type="text"
										name="birth" value maxlength="2" placeholder="DD" required>
                                            </div>
                                    </td>
                            </tr>

                            <tr>
                                <td class="a">이메일</td>
                                <td class="b"><input type="text"
								name="email" required class="iText"> <button
									class="email">인증하기</button><br> <input
								id="indentity" type="text" name="identity" required
								style="width: 20%" class="iText"> <button id="indentity"
									class="verification_check">인증번호확인</button>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                                            
                        <input id="registcheck" type="submit"value="가입하기">
                </div>
            </form>
    
</body>
    </div>

</html><jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>