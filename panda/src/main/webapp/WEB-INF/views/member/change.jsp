<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<%--암호화 --%>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script
	src="${pageContext.request.contextPath}/js/cryptojs/components/core-min.js"></script>
<script
	src="${pageContext.request.contextPath}/js/cryptojs/components/sha256-min.js"></script>
<script src="${pageContext.request.contextPath}/js/password-encoder.js"></script>
<%--암호화 --%>
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
</script>
<style>
* {
	text-align: center;
	margin: auto;
}
</style>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<h1>${mdto.name} 회원님의 정보</h1><br>
<form action="change" method="post">
<table border="1" width="600" height="350">
	<tbody>
		<tr>
						<td>아이디</td>
						<td><input class="id" type="text" name="id"
							value="${mdto.id}" readonly><br>
						</tr>

					<tr>
						<td>이름</td>
						<td><input type="text" name="name" value="${mdto.name}" readonly></td>
					</tr>

					<tr>
						<td>이메일</td>
						<td><input type="email" name="email" value="${mdto.email}"></td>

					</tr>

					<tr>
						<td>핸드폰번호</td>
						<td><input type="text" name="phone" value="${mdto.phone}"></td>
					</tr>

					<tr>
						<td>주소</td>
						<td><div>
								<input class="addr" type="button" value="우편번호 찾기"> 
								<input type="text" name="post_code" value="${mdto.post_code}" ><br>
								<input type="text" name="basic_addr" value="${mdto.basic_addr}" >
								<input type="text" name="detail_addr" value="${mdto.detail_addr}">
							</div></td>
					</tr>

		<tr>
			<th colspan="2"><input type="submit" value="수정하기"></th>
		</tr>
	</tbody>
</table>

</form>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>


