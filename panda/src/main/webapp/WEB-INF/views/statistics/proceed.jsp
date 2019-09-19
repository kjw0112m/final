<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/WEB-INF/views/template/admin/header.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/template/admin/aside.jsp"></jsp:include>
<script src="https://www.amcharts.com/lib/4/core.js"></script>
<script src="https://www.amcharts.com/lib/4/charts.js"></script>
<script src="https://www.amcharts.com/lib/4/themes/animated.js"></script>
<script>
	am4core.ready(function() {

		// Themes begin
		am4core.useTheme(am4themes_animated);
		// Themes end

		// Create chart
		var chart = am4core.create("chartdiv", am4charts.XYChart);
		chart.paddingRight = 20;

		var list = "${day}";
		var data = [];

		<c:forEach items="${day}" var="day">
		data.push({
			day : "${day.order_dt}",
			value : ${day.total_price}
		});
		</c:forEach>
		console.log(data);
		chart.data = data;
		chart.dateFormatter.inputDateFormat = "yyyy-MM-dd";

		var dateAxis = chart.xAxes.push(new am4charts.DateAxis());
		dateAxis.renderer.minGridDistance = 50;
		dateAxis.baseInterval = {
			timeUnit : "day",
			count : 1
		};

		var valueAxis = chart.yAxes.push(new am4charts.ValueAxis());
		valueAxis.tooltip.disabled = true;

		var series = chart.series.push(new am4charts.StepLineSeries());
		series.dataFields.dateX = "day";
		series.dataFields.valueY = "value";
		series.tooltipText = "{valueY.value}";
		series.strokeWidth = 3;

		chart.cursor = new am4charts.XYCursor();
		chart.cursor.xAxis = dateAxis;
		chart.cursor.fullWidthLineX = true;
		chart.cursor.lineX.strokeWidth = 0;
		chart.cursor.lineX.fill = chart.colors.getIndex(2);
		chart.cursor.lineX.fillOpacity = 0.1;

		chart.scrollbarX = new am4core.Scrollbar();

	});
</script>
<style>
#chartdiv {
	width: 100%;
	height: 500px;
}
</style>
<form action="search" method="post" id="orderSearchForm">
	<div id="content">
		<div class="head_tit">
			<h1>일, 월별 수입 통계</h1>
		</div>
		<div class="optionArea">
			<div class="mOption">
				<div id="chartdiv"></div>
			</div>
		</div>

		<div class="section" id="">
			<div id="tabNumber" class="tabCont">
				<div id="searchResultList"
					class="mBoard typeOrder gScroll gCellSingle">
					<table border="1" summary="" class="thead">
						<tbody>
							<tr>
								<th scope="col" class="w60" style="">날짜</th>
								<th scope="col" class="w60" style="">주문수</th>
								<th scope="col" class="w60" style="">품목수</th>
								<th scope="col" class="w60" style="">매출액</th>
							</tr>
						</tbody>
					</table>
					<c:choose>
						<c:when test="${empty detail}">
							<table border="1" summary="">
								<tbody class="empty center">
									<tr>
										<td colspan="15">검색된 내역이 없습니다.</td>
									</tr>
								</tbody>
							</table>
						</c:when>
						<c:otherwise>
							<table border="1">
								<tbody class="right">
										<tr>
											<td class="w60 center" style="">${detail.order_dt }</td>
											<td class="w60 center" style="">${detail.orders}</td>
											<td class="w60 center" style="">${detail.quantity}</td>
											<td class="w60 center" style=""><fmt:formatNumber value="${detail.total_price}" pattern="#,###.##" /></td>
										</tr>
								</tbody>
							</table>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>
	</div>
</form>

</body>
</html>