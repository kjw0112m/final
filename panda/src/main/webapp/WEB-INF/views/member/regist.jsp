<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<%--암호화 --%>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script src="${pageContext.request.contextPath}/js/cryptojs/components/core-min.js"></script>
<script src="${pageContext.request.contextPath}/js/cryptojs/components/sha256-min.js"></script>
<script src="${pageContext.request.contextPath}/js/password-encoder.js"></script>
<%--암호화 --%>

<style>
form h4 {
	display: none
}
* {
	text-align: center;
}
form label {
	font-size: 20px;
}
form input {
	width: 60%;
	margin: 5px 0px;
	font-size: 17px;
	padding: 5px;
	border-width: 1px;
	border-color: rgb(57, 143, 255);
	border-style: solid;
	border-radius: 1px;
}
input[type=submit] {
	align: center;
	width: 50px;
	color: white;
	background-color: dodgerblue;
	color: white;
	width: 50%;
}
.v {
	padding: 0px 30px 0px 200px;
	height: 35px;
	width: 465px;}
.id_right{
  color:blue;
}
.id_fail{
  color:red;
}
.pw_right{
  color:blue;
}
.pw_fail{
  color:red;
}
}
</style>
<script>
$(function() {
	$(".addr").click(findAddress);
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
$(function() {
	$(".id").on("blur", function() {
		var regex1 = /^[a-z0-9A-Z]{8,16}$/;
		var id = $(this).val();
		var result = regex1.test(id);
		if (result) {
			$(".id_right").css("display", "block")
			$(".id_fail").css("display", "none")
		} else {
			$(".id_fail").css("display", "block")
			$(".id_right").css("display", "none")
		}

	});
	$(function() {
		//email 입력창에 blur 이벤트가 발생하면 ajax 통신으로 중복검사 수행
		//요청 url : /member/id_check.do
		$("input[name=id]").blur(function() {
			$.ajax({
				url : "id_check.do",
				data : {
					id : $("input[name=id]").val()
				},
				dataType : "text",
				success : function(resp) {
					//	console.log(resp); 
					if (resp == 'N') {
						window.alert("이미 사용중인 아이디입니다");

					}
				}
			});
		});
	});
	$(".pw").on("blur", function() {

		var regex1 = /^[a-z0-9A-Z]{8,14}$/;
		var pw = $(this).val();
		var result = regex1.test(pw);
		if (result) {
			$(".pw_right").css("display", "block")
			$(".pw_fail").css("display", "none")
		} else {
			$(".pw_fail").css("display", "block")
			$(".pw_right").css("display", "none")
		}
	});

	$(function() {
		$('#user_pass').keyup(function() {
			$('font[name=check]').text('');
		}); //#user_pass.keyup

		$('#chpass').keyup(function() {
			if ($('#user_pass').val() != $('#chpass').val()) {
				$('font[name=check]').text('');
				$('font[name=check]').html("암호틀림");
			} else {
				$('font[name=check]').text('');
				$('font[name=check]').html("암호맞음");
			}
		}); //#chpass.keyup
	});
});
</script>
</head>
<body>
<%-- 회원 가입 페이지의 내용을 구현 --%>
<form action="regist" method="post">
	<div >
			<table >
				<tbody>
					<tr>
						<td>아이디</td>
						<td><input class="id" type="text" name="id" placeholder="아이디 8~16글자"
							required>
							<h4 class="id_right">올바른 형식입니다</h4>
							<h4 class="id_fail">올바른 형식으로 입력해 주세요</h4></td>
					</tr>
				
					<tr>
						<td>비밀번호</td>
						<td><input class="pw" type="password" name="pw"
							id="user_pass" placeholder="비밀번호 8~14글자" required>
							<h4 class="pw_right">올바른 형식입니다</h4>
							<h4 class="pw_fail">형식에 맞는 비밀번호를 입력하세요</h4></td>
						</tr>
					<tr>
						<td><label>비밀번호 확인</label></td>
						<td><input type="password" id="chpass" name="pw_check"
							placeholder="비밀번호 확인" required><br> <font name="check"
							size="5" color="red"></font></td>
					</tr>
					
					<tr>
						<td>이름</td>
						<td><input type="text" name="name" placeholder="이름" required></td>
					</tr>
							
								<tr>
		           	<td>이메일</td>
						<td><input type="email" name="email" placeholder="이메일"
							required></td>
					   <td><button>이메일본인인증</button>
					</tr>
					
					<tr>
						<td>핸드폰번호</td>
						<td><input type="text" name="phone" placeholder="전화번호(- 제외)"></td>
					</tr>
					
					<tr>
						<td>주소</td>
						<td><div>
								<input class="addr" type="button" value="우편번호 찾기"><br>
								<input type="text" name="post_code" placeholder="우편번호" readonly>
								<input type="text" name="basic_addr" placeholder="주소" readonly>
								<input type="text" name="detail_addr" placeholder="상세주소">
							</div></td>
					</tr>
					
					<tr>
						<td>생일</td>
						<td><input type="date" name="birth" required></td>
					</tr>
				
					<tr>
						<td colspan="2"><input type="submit" value="가입하기"></td>
					</tr>
				
				</tbody>
			</table>
		</div>
	</form>
</body>
</html>