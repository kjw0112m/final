<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>배송조회</title>
</head>
<style>
<
style>.del_tit {
	color: #777777;
}

.del_info .content {
	border-top: 1px solid black;
	margin-bottom: 30px;
	width: 600px;
}

.del_info .content>div {
	margin: 20px;
}

.del_info label {
	font-weight: bold;
	color: #ffb6c1;
}

.del_table th {
	border-bottom: 1px solid black;
}

.del_table {
	border-collapse: collapse;
}

.del_table .center {
	text-align: center;
}

.del_tbody tr {
	height: 40px;
}

.del_tbody tr:nth-child(2n) {
	background-color: #ffe3ee;
}
</style>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script>
	$(function() {
		var myKey = "AdfrKyXqYwrpLzkj19I7Ew"; // sweet tracker에서 발급받은 자신의 키 넣는다.

		var t_code = '${param.t_id}';
		var t_invoice = '${param.t_invoice}';
		var info = $('.del_info');
		var track = $('.del_tracking');

		$.ajax({
			type : "GET",
			dataType : "json",
			url : "http://info.sweettracker.co.kr/api/v1/trackingInfo?t_key="
					+ myKey + "&t_code=" + t_code + "&t_invoice=" + t_invoice,
			success : function(data) {
				console.log(data);
				if (data.status == false) {
					console.log('????')
					info.children().css('display', 'none');
					track.css('display', 'none');
					info.append('<p>조회된 결과가 없습니다.</p>');
				} else {
					$('#invoice').append(data.invoiceNo);
					$('#to').append(data.receiverName);
					$('#from').append(data.senderName);
					$('#product').append(data.itemName);
					$('#address').append(data.receiverAddr);
				}

				var trackingDetails = data.trackingDetails;

				var body = $('.del_tbody');
				var tr = '';
				$.each(trackingDetails, function(key, value) {
					tr += ('<tr>');
					tr += ('<td>' + value.timeString + '</td>');
					tr += ('<td>' + value.where + '</td>');
					tr += ('<td class="center">' + value.kind + '</td>');
					tr += ('<td class="center">' + value.telno + ''
							+ value.telno2 + '</td>');
					tr += ('</tr>');
				});
				body.append(tr);
			}
		});
	});
</script>
<body>
	<h3 class="del_tit">스마트택배 배송조회</h3>
	<div class="del_info">
		<div>
			<div class="content">
				<div>
					<label for="invoice">운송장번호</label>
					<div id="invoice"></div>
				</div>
				<div>
					<label for="to">받는 사람</label>
					<div id="to"></div>
				</div>
				<div>
					<label for="from">보낸 사람</label>
					<div id="from"></div>
				</div>
				<div>
					<label for="product">상품 정보</label>
					<div id="product"></div>
				</div>
				<div>
					<label for="address">수령 주소</label>
					<div id="address"></div>
				</div>
			</div>
		</div>

		<div class="del_tracking">
			<table class="del_table">
				<colgroup>
					<col width="200px" />
					<col width="200px" />
					<col width="300px" />
					<col width="200px" />
				</colgroup>
				<thead>
					<tr>
						<th>시간</th>
						<th>현재 위치</th>
						<th>배송 상태</th>
						<th>전화번호</th>
					</tr>
				</thead>
				<tbody class="del_tbody">

				</tbody>
			</table>
		</div>
	</div>
</body>
</html>