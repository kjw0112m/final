<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/views/template/admin/header.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/template/admin/aside.jsp"></jsp:include>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script
	src="${pageContext.request.contextPath}/js/admin/order_search.js"></script>
<form action="search" method="get" id="orderSearchForm">
	<%-- <input type="hidden" name="seller_id" value="${sessionScope.sid }"> --%>
	<input type="hidden" name="seller_id" value="abc">
	<div id="content">
		<div class="head_tit">
			<h1>전체주문목록</h1>
		</div>
		<div class="optionArea">
			<div class="mOption">
				<table border="1" summary="">
					<colgroup>
						<col style="width: 170px;">
						<col style="width: 600px;">
						<col style="width: 170px;">
						<col style="width: auto;">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row">검색어</th>
							<td colspan="3">
								<div id="mainSearch">
									<div>
										<select class="fSelect" name="search[0].type"
											style="width: 163px;">
											<option value="choice" disabled>-검색항목선택-</option>
											<option value="order_id" selected="">주문번호</option>
											<option value="" disabled>품목별 주문번호</option>
											<option value="t_invoice">운송장번호</option>
											<option value="line1">-----------------</option>
											<option value="member_name">주문자명</option>
											<option value="member_id">주문자 아이디</option>
											<option value="phone">주문자 휴대전화</option>
											<option value="line2">-----------------</option>
											<option value="">입금자명</option>
											<option value="" disabled>수령자명</option>
											<option value="" disabled>수령자 휴대전화</option>
											<option value="" disabled>수령자 일반전화</option>
											<option value="address">배송지 주소</option>
											<option value="" disabled>주문서 추가항목</option>
											<option value="" disabled>주문자명, 입금자명, 수령자명</option>
										</select> <input type="text" class="fText searchBox"
											name="search[0].keyword" id="searchBox" style="width: 400px;">
										<a href="#none" class="plus"><span class="plusbtn">+</span></a>
									</div>
								</div>
								<div id="subSearch" style="display: none">
									<div>
										<select class="fSelect" style="width: 163px;">
											<option value="choice" selected="">-검색항목선택-</option>
											<option value="order_id">주문번호</option>
											<option value="" disabled>품목별 주문번호</option>
											<option value="t_invoice">운송장번호</option>
											<option value="line1">-----------------</option>
											<option value="member_name">주문자명</option>
											<option value="member_id">주문자 아이디</option>
											<option value="phone">주문자 휴대전화</option>
											<option value="line2">-----------------</option>
											<option value="">입금자명</option>
											<option value="" disabled>수령자명</option>
											<option value="" disabled>수령자 휴대전화</option>
											<option value="" disabled>수령자 일반전화</option>
											<option value="address">배송지 주소</option>
											<option value="" disabled>주문서 추가항목</option>
											<option value="" disabled>주문자명, 입금자명, 수령자명</option>
										</select> <input type="text" class="fText searchBox" id="searchBox"
											style="width: 400px;"> <a href="#none" class="minus"><span
											class="minusbtn">-</span></a>
									</div>
								</div>
							</td>
						</tr>
						<tr>
							<th scope="row">기간</th>
							<td colspan="3"><select name="date_type"
								style="width: 115px;" class="fSelect disabled">
									<option value="order_dt" selected="selected">주문일</option>
									<option value="" disabled>결제일</option>
									<option value="" disabled>송장번호입력일</option>
									<option value="" disabled>배송시작일</option>
									<option value="" disabled>배송완료일</option>

							</select> <a href="#none" class="btnDate" date-interval="0"><span>오늘</span></a>
								<a href="#none" class="btnDate" date-interval="1"><span>어제</span></a>
								<a href="#none" class="btnDate" date-interval="3"><span>3일</span></a>
								<a href="#none" class="btnDate" date-interval="7"><span>7일</span></a>
								<a href="#none" class="btnDate" date-interval="15"><span>15일</span></a>
								<a href="#none" class="btnDate bc_g" date-interval="30"><span>1개월</span></a>
								<a href="#none" class="btnDate" date-interval="90"><span>3개월</span></a>
								<a href="#none" class="btnDate" date-interval="180"><span>6개월</span></a>
								<span class="gBreak"> <input type="text" id="startDate"
									name="start_dt" class="fText gDate" value=""> ~ <input
									type="text" id="endDate" name="end_dt" class="fText gDate"
									readonly="readOnly">
							</span></td>
						</tr>

						<tr>
							<th scope="row">상품</th>
							<td colspan="3"><select class="fSelect"
								id="eProductSearchType" name="product_search_type"
								style="width: 110px;">
									<option value="product_name" selected="selected">상품명</option>
									<option value="product_id" disabled>상품코드</option>
									<option value="" disabled>품목코드</option>
									<option value="" disabled>상품태그</option>
									<option value="" disabled>제조사</option>
									<option value="" disabled>공급사</option>
							</select> <input type="text" name="order_product_text" class="fText"
								style="width: 490px;" value=""></td>
						</tr>

						<tr>
							<th scope="row">주문상태</th>
							<td colspan="3" id="tStatusCheck"><label class="gLabel"><input
									type="checkbox" id="tStatAll" class="fChk" checked="checked">
									전체</label> <label class="gLabel   " style="display: none;"><input
									type="checkbox" name="tStatus" class="fChk" value="상품준비중">
									상품준비중</label> <label class="gLabel"><input type="checkbox"
									name="tStatus" class="fChk" value="배송준비중"> 배송준비중</label> <label
								class="gLabel"><input type="checkbox" name="tStatus"
									class="fChk" value="배송보류"> 배송보류</label> <label class="gLabel"><input
									type="checkbox" name="tStatus" class="fChk" value="배송대기">
									배송대기</label> <label class="gLabel"><input type="checkbox"
									name="tStatus" class="fChk" value="배송중"> 배송중</label> <label
								class="gLabel   "><input type="checkbox" name="tStatus"
									class="fChk" value="배송완료"> 배송완료</label></td>
						</tr>

						<tr>
							<th scope="row">CS주문상태</th>
							<td colspan="3" id="csStatusCheck"><label class="gLabel"><input
									type="checkbox" class="fChk" id="csStatAll"> 전체</label> <label
								class="gLabel"><input type="checkbox" name="csStatus"
									class="fChk" value="취소"> 취소</label> <label class="gLabel"><input
									type="checkbox" name="csStatus" class="fChk" value="교환">
									교환</label> <label class="gLabel"><input type="checkbox"
									name="csStatus" class="fChk" value="반품"> 반품</label> <label
								class="gLabel"><input type="checkbox" name="csStatus"
									value="환불" class="fChk  "> 환불</label></td>
						</tr>

						<tr>
							<th scope="row">입금/결제상태</th>
							<td colspan="3"><label class="gLabel"> <input
									type="radio" class="fChk" checked="checked"> 전체
							</label> <label class="gLabel"> <input type="radio"
									name="pay_status" class="fChk" value="입금전"> 입금전
							</label> <label class="gLabel"> <input type="radio"
									name="pay_status" class="fChk" value="입금완료"> 입금완료
							</label> <label class="gLabel"> <input type="radio"
									name="pay_status" class="fChk" value="결제완료"> 결제완료
							</label></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="form_button">
				<a href="#none" id="btnSearch" class="btnSearch"><span>검색</span></a>
				<a href="#none" id="btnInit" class="btnSearch reset"><span>초기화</span></a>
			</div>
		</div>



		<div class="section" id="">
			<div class="tab">
				<ul>
					<li class="selected"><a href="#none" id="">주문번호별</a></li>
					<li><a href="#none" id="">품목주문별</a></li>
				</ul>
			</div>
			<div id="tabNumber" class="tabCont">
				<div class="rState">
					<div class="left">
						<p class="total">
							[ 검색결과 <strong>${searchCount}</strong>건 ]
						</p>
					</div>
					<div class="right">
						<select name="rows" class="fSelect" init_rows="10">
							<option value="10" selected="">10개씩보기</option>
							<option value="20">20개씩보기</option>
							<option value="30">30개씩보기</option>
							<option value="50">50개씩보기</option>
							<option value="100">100개씩보기</option>
							<option value="200">200개씩보기</option>
							<option value="300">300개씩보기</option>
							<option value="500">500개씩보기</option>
						</select>
					</div>
				</div>
				<div id="searchResultList"
					class="mBoard typeOrder gScroll gCellSingle">
					<table border="1" summary="" class="thead">
						<tbody>
							<tr>
								<th scope="col" class="w24"><input type="checkbox"
									id="allChk"></th>
								<th scope="col" class="w50" style="display: none;">No</th>
								<th scope="col" class="w120" style="">주문일</th>
								<th scope="col" class="w105" style="">주문번호</th>
								<th scope="col" class="w95" style="">주문자</th> 
								<th scope="col" class="w120" style="">상품명</th>
								<th scope="col" class="w105" style="display: none;">총
									상품구매금액</th>
								<th scope="col" class="w105" style="display: none;">총 주문금액</th>
								<th scope="col" class="w105" style="">총 실결제금액</th>
								<th scope="col" class="w60" style="">결제수단</th>
								<th scope="col" class="w60" style="">결제상태</th>
								<th scope="col" class="w60" style="">배송상태</th>
								<th scope="col" class="w45 center" style="">CS상태</th>
							</tr>
						</tbody>
					</table>
					<c:choose>
						<c:when test="${empty orderViewDto}">
							<table border="1" summary="">
								<tbody class="empty center">
									<tr>
										<td colspan="15">검색된 주문내역이 없습니다.</td>
									</tr>
								</tbody>
							</table>
						</c:when>
						<c:otherwise>
							<c:forEach var="orderViewDto" items="${orderViewDto}">
								<table border="1">
									<tbody class="right ">
										<tr>
											<td rowspan="2" class="w24 center"><input
												type="checkbox" name="" class="chkbox"> <input
												type="hidden" name="order_id" value="">
											<td class="w120  center" style="">${orderViewDto.order_dt}</td>
											<td class="w105 orderNum" style=""><a href="#none" id=""><span
													id="">${orderViewDto.team }</span></a>
											<td class="w95 center" style="" bgcolor="">${orderViewDto.member_name}</td>
											<td class="w120 left" style="">${orderViewDto.product_name }</td>
											<td class="w105" style="">${orderViewDto.total_price}</td>
											<td class="w60 center" style="">${orderViewDto.pay_type }</td>
											<td class="w60 center" style="">${orderViewDto.pay_status}</td>
											<td class="w60 center" style="">${orderViewDto.t_status}</td>
											<td class="w45 center" style="">${orderViewDto.cs_status}</td>
										</tr>
									</tbody>
								</table>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>
	</div>
</form>
</div>
</div>
</body>
</html>