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

		var chart1 = am4core.create("chartdiv1", am4charts.XYChart);
		var chart2 = am4core.create("chartdiv2", am4charts.XYChart);
		chart1.hiddenState.properties.opacity = 0; // this creates initial fade-in
		chart2.hiddenState.properties.opacity = 0; // this creates initial fade-in

		chart1.data = [];
		chart2.data = [];

		<c:forEach items="${seller}" var="seller">
		chart1.data.push({
			nickname : "${seller.nickname}",
			amount : "${seller.total_price}"
		});
		</c:forEach>

		<c:forEach items="${product}" var="product">
		chart2.data.push({
			product : "${product.product_name}",
			amount : "${product.total_price}"
		});
		</c:forEach>

		var categoryAxis = chart1.xAxes.push(new am4charts.CategoryAxis());
		var categoryAxis2 = chart2.xAxes.push(new am4charts.CategoryAxis());
		categoryAxis.renderer.grid.template.location = 0;
		categoryAxis.dataFields.category = "nickname";
		categoryAxis.renderer.minGridDistance = 40;
		categoryAxis.fontSize = 11;
		categoryAxis2.renderer.grid.template.location = 0;
		categoryAxis2.dataFields.category = "product";
		categoryAxis2.renderer.minGridDistance = 40;
		categoryAxis2.fontSize = 11;

		var valueAxis = chart1.yAxes.push(new am4charts.ValueAxis());
		var valueAxis2 = chart2.yAxes.push(new am4charts.ValueAxis());
		valueAxis.min = 0;
		valueAxis.max = parseInt(chart1.data[0].amount);
		valueAxis.strictMinMax = true;
		valueAxis.renderer.minGridDistance = 30;

		valueAxis2.min = 0;
		valueAxis2.max = parseInt(chart2.data[0].amount);
		valueAxis2.strictMinMax = true;
		valueAxis2.renderer.minGridDistance = 30;
		// axis break
		var axisBreak = valueAxis.axisBreaks.create();
		var axisBreak2 = valueAxis2.axisBreaks.create();
		axisBreak.startValue = parseInt(chart1.data[0].amount / 5);
		axisBreak.endValue = parseInt(chart1.data[0].amount * 2 / 3);
		axisBreak.breakSize = 0.005;
		axisBreak2.startValue = parseInt(chart2.data[0].amount / 5);
		axisBreak2.endValue = parseInt(chart2.data[0].amount * 2 / 3);
		axisBreak2.breakSize = 0.005;

		// make break expand on hover
		var hoverState = axisBreak.states.create("hover");
		var hoverState2 = axisBreak2.states.create("hover");
		hoverState.properties.breakSize = 1;
		hoverState.properties.opacity = 0.1;
		hoverState.transitionDuration = 1500;
		hoverState2.properties.breakSize = 1;
		hoverState2.properties.opacity = 0.1;
		hoverState2.transitionDuration = 1500;

		axisBreak.defaultState.transitionDuration = 1000;
		axisBreak2.defaultState.transitionDuration = 1000;

		var series = chart1.series.push(new am4charts.ColumnSeries());
		var series2 = chart2.series.push(new am4charts.ColumnSeries());
		series.dataFields.categoryX = "nickname";
		series.dataFields.valueY = "amount";
		series.columns.template.tooltipText = "{valueY.value}";
		series.columns.template.tooltipY = 0;
		series.columns.template.strokeOpacity = 0;

		series2.dataFields.categoryX = "product";
		series2.dataFields.valueY = "amount";
		series2.columns.template.tooltipText = "{valueY.value}";
		series2.columns.template.tooltipY = 0;
		series2.columns.template.strokeOpacity = 0;

		series.columns.template.adapter.add("fill", function(fill, target) {
			return chart1.colors.getIndex(target.dataItem.index);
		});
		series2.columns.template.adapter.add("fill", function(fill, target) {
			return chart2.colors.getIndex(target.dataItem.index);
		});
	});
</script>
<style>
#chartdiv1, #chartdiv2 {
	width: 100%;
	height: 500px;
}

#br {
	height: 100px;
}
</style>
<div id="content">
	<div class="head_tit">
		<h1>최근 7일 매출 순위</h1>
	</div>
	<div class="optionArea">
		<h3>판매자별</h3>
		<div id="chartdiv1"></div>
	</div>
	<div id="br"></div>
	<div class="optionArea">
		<h3>상품별</h3>
		<div id="chartdiv2"></div>
	</div>
</div>
</body>
</html>