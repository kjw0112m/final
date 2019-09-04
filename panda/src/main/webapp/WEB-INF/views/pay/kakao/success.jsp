<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script>
	$(function() {
		var success = '${success}';
		var form = $("form", window.opener.document);

		form.attr('action', '${pageContext.request.contextPath}/orders/order');
		form
				.append("<input type='hidden' name='kakao_success' value="+success+"/>")
		form.attr('standby', '');
		form.submit();

		opener.location.href = '${pageContext.request.contextPath}/orders/result'
		window.close();
	});
</script>
