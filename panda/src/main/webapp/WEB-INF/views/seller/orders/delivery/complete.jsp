<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="/WEB-INF/views/template/admin/header.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/template/admin/aside.jsp"></jsp:include>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script>
	var searchType = new Array("${param['search[0].type']}",
			"${param['search[1].type']}", "${param['search[2].type']}",
			"${param['search[3].type']}", "${param['search[4].type']}");

	var searchKeyword = new Array("${param['search[0].keyword']}",
			"${param['search[1].keyword']}", "${param['search[2].keyword']}",
			"${param['search[3].keyword']}", "${param['search[4].keyword']}");

	var startDate = "${param.start_dt}";
	var endDate = "${param.end_dt}";

	var productName = "${param.product_name}";

	var payStatus = "${param.pay_status}"

	var page = "${page}";
	var startBlock = "${startBlock}";
	var endBlock = "${endBlock}";
	var rows = "${param.rows}";
</script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="${pageContext.request.contextPath}/js/admin/post_search.js"></script>

<form action="delivery" method="post" id="orderSearchForm">
	<div id="content">
		<div class="head_tit">
			<h1>배송 관리</h1>
			<h5 id="d_tit" style="display: none">complete</h5>
		</div>
		<jsp:include page="/WEB-INF/views/template/admin/dTab.jsp"></jsp:include>

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
											<option value="" disabled>입금자명</option>
											<option value="" disabled>수령자명</option>
											<option value="" disabled>수령자 휴대전화</option>
											<option value="" disabled>수령자 일반전화</option>
											<option value="detail_addr">배송지 주소</option>
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
											<option value="" selected="">-검색항목선택-</option>
											<option value="order_id">주문번호</option>
											<option value="" disabled>품목별 주문번호</option>
											<option value="t_invoice">운송장번호</option>
											<option value="line1" disabled>-----------------</option>
											<option value="member_name">주문자명</option>
											<option value="member_id">주문자 아이디</option>
											<option value="phone">주문자 휴대전화</option>
											<option value="line2" disabled>-----------------</option>
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
							</select> <input type="text" name="product_name" class="fText"
								style="width: 490px;" value=""></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="form_button">
				<input type="submit" style="display: none"> <a href="#none"
					id="btnSearch" class="btnSearch"><span>검색</span></a> <a
					href="delivery" id="btnInit" class="btnSearch reset"><span>초기화</span></a>
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
						<select name="rows" class="fSelect">
							<option value="10" selected="">10개씩보기</option>
							<option value="20">20개씩보기</option>
							<option value="30">30개씩보기</option>
							<option value="50">50개씩보기</option>
						</select>
					</div>
				</div>
				<div id="searchResultList"
					class="mBoard typeOrder gScroll gCellSingle">
					<table border="1" summary="" class="thead">
						<tbody>
							<tr>
								<th scope="col" class="w85" style="">주문일</th>
								<th scope="col" class="w160" style="">주문번호</th>
								<th scope="col" class="w90" style="">주문자</th>
								<th scope="col" class="w35"><input type="checkbox"
									id="allChk"></th>
								<th scope="col" class="w140" style="">운송장번호</th>
								<th scope="col" class="w90" style="">공급사</th>
								<th scope="col" class="w140" style="">상품명/옵션</th>
								<th scope="col" class="w35" style="">수량</th>
								<th scope="col" class="w100" style="">총 주문금액</th>
							</tr>
						</tbody>
					</table>
					<c:choose>
						<c:when test="${empty orderListVO}">
							<table border="1" summary="">
								<tbody class="empty center">
									<tr>
										<td colspan="15">검색된 주문내역이 없습니다.</td>
									</tr>
								</tbody>
							</table>
						</c:when>
						<c:otherwise>
							<table border="1">
								<tbody class="right ">
									<c:forEach var="orderListVO" items="${orderListVO}">
										<c:forEach var="orderViewDto" items="${orderListVO.list}"
											varStatus="status">
											<tr>
												<c:if test="${status.first }">
													<td rowspan=${status.first? orderListVO.getCount()+1:""}
														class="w85 center" style="">${orderListVO.getTime()}
													</td>
												</c:if>
												<c:if test="${status.first }">
													<td rowspan=${status.first? orderListVO.getCount()+1:""}
														class="w160 orderNum" style=""><a href="#none" id=""><span
															id=""> ${orderListVO.team } </span></a></td>
												</c:if>
												<c:if test="${status.first }">
													<td rowspan=${status.first? orderListVO.getCount()+1:""}
														class="w90 center" style="" bgcolor="">
														${orderListVO.member_name}</td>
												</c:if>
												<c:if test="${status.first }">
												<td class="w35 center" rowspan=${status.first? orderListVO.getCount():""}><input
													type="checkbox" name="team" value="${orderViewDto.team}"
													class="chkbox" order_id="${orderViewDto.order_id}"></td>
												</c:if>
												<c:if test="${status.first }">
													<td class="w140 left t_td" style=""
														rowspan=${status.first? orderListVO.getCount():""}>
														운송장번호:
														<a href="#" t_id="${orderListVO.t_id}" style="color: #55a0ff">${orderListVO.t_invoice }</a>
														</td>
												</c:if>
													<td class="w90 center" style="">
													${orderViewDto.nickname}</td>
												<td class="w140 center" style="">
													${orderViewDto.product_name }</td>
												<td class="w35 center" style="">
													${orderViewDto.quantity }</td>
												<c:if test="${status.first }">
													<td class="w100 right" style=""
														rowspan=${status.first? orderListVO.getCount()+1:""}>
														<fmt:formatNumber value="${orderListVO.getTrueAmount()}" pattern="#,###.##" />
														</td>
												</c:if>
											</tr>
										</c:forEach>
										<tr>
											<td class="w140 left" colspan="5">
												<p>수령자: ${orderListVO.re_name}</p>
												<p>연락처: ${orderListVO.re_phone }</p>
												<p>주소: ${orderListVO.re_addr}</p>
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</c:otherwise>
					</c:choose>
				</div>
				<input name="page" type="hidden">
				<div class="paginate">
					<ol>
						<c:if test="${(not (page eq 1))&& not empty page && page>=11}">
							<li><a href="#" class="page_block">&lt;&lt;</a></li>
						</c:if>
						<c:if test="${not (page eq 1) && not empty page}">
							<li><a href="#" class="page_block">&lt;</a></li>
						</c:if>
						<!--페이지 출력 -->
						<c:forEach var="i" begin="${startBlock}" end="${endBlock}">
							<c:choose>
								<c:when test="${page == i}">
									<li class="active_page">${i}</li>
								</c:when>
								<c:otherwise>
									<c:if test="${i>0}">
										<li><a href="#" class="page_move">${i}</a></li>
									</c:if>
								</c:otherwise>
							</c:choose>
						</c:forEach>
						<c:if test="${not (page eq pageCount)}">
							<li><a href="#" class="page_block">&gt;</a></li>
						</c:if>
						<c:if test="${(not (page eq pageCount)) && pageCount>=10}">
							<li><a href="#" class="page_block">&gt;&gt;</a></li>
						</c:if>
					</ol>
				</div>
			</div>
		</div>
	</div>
</form>


</body>
</html>