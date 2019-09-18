<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script>
	$(function() {

		var page = "${page}";
		var startBlock = "${startBlock}";
		var endBlock = "${endBlock}";

		function move(no) {
			console.log(no);
			$("input[name=page]").val(no);

			$("form").submit();
		}

		$(".page_move").click(function() {
			var p = $(this).text();
			move(p);
		});

		$(".page_block").click(function() {
			var p = $(this).text();
			switch (p) {
			case '<':
				move(parseInt(page) - 1);
				break;
			case '<<':
				move(parseInt(startBlock) - 1);
				break;
			case '>':
				move(parseInt(page) + 1);
				break;
			case '>>':
				move(parseInt(endBlock) + 1);
				break;
			}
		});

	});
</script>
<style>
.total {
	margin-left: 300px;
	padding-top: 58px;
	padding-bottom: 120px;
	width: 1400px;
	min-height: 1000px;
}

#container {
	position: relative;
}

#p_table {
	width: 100%;
	margin-top: 100px;
	border-top: 1px solid #000000;
	border-collapse: collapse;
}

#p_table td {
	text-align: center;
	padding: 20px 0 20px 0;
	font-size: 15px;
	border-bottom: 1px solid #999;
}

#p_table th {
	height: 52px;
	border-bottom: 1px solid #000000;
	font-size: 16px;
	vertical-align: middle;
}

.paginate {
	margin: 25px 0 0;
	text-align: center;
}

.paginate ol, .paginate li {
	display: inline-block;
	vertical-align: middle;
	font-size: 16px;
	line-height: 16px;
	padding: 0 1px;
}

.active_page {
	font-weight: bold;
	color: #55a0ff;
}
</style>

<div id="container">
	<jsp:include page="/WEB-INF/views/template/my_info.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/views/template/side.jsp"></jsp:include>
</div>
<form action="" method="get">
	<div class="total">
		<h1>적립금 내역</h1>
		<table id="p_table">
			<colgroup>
				<col width="10%">
				<col width="10%">
				<col width="30%">
				<col width="30%">
				<col width="20%">
			</colgroup>
			<thead>
				<tr>
					<th>상태</th>
					<th>적립금</th>
					<th>적립 구분</th>
					<th>주문번호</th>
					<th>날짜</th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${pointDto != null }">
						<c:forEach items="${pointDto}" var="pointDto">
							<tr>
								<td><c:choose>
										<c:when
											test="${pointDto.type == '적립' or pointDto.type == '대기' or pointDto.type == '반환'}">
							${pointDto.type }
						</c:when>
										<c:otherwise>
											<span style="color: red">${pointDto.type}</span>
										</c:otherwise>
									</c:choose></td>
								<td><c:choose>
										<c:when
											test="${pointDto.type == '적립' or pointDto.type == '대기' or pointDto.type == '반환'}">
							+${pointDto.use_point }
						</c:when>
										<c:otherwise>
											<span style="color: red">-${pointDto.use_point }</span>
										</c:otherwise>
									</c:choose></td>
								<td>${pointDto.content }</td>
								<td>${pointDto.team }</td>
								<td>${pointDto.getDate() }</td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="5">포인트 내역이 없습니다.</td>
						</tr>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
		<div class="paginate">
			<ol>
				<c:if
					test="${(not (page eq 1))&& not empty page && startBlock-1 >0}">
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
				<c:if test="${(not (page eq pageCount)) && pageCount>endBlock}">
					<li><a href="#" class="page_block">&gt;&gt;</a></li>
				</c:if>
			</ol>
		</div>
	</div>
	<input name="page" type="hidden">
</form>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>