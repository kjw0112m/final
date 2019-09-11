$(function() {
	// ----------------------------------------------- 검색어 복사 이벤트
	// ---------------------------------------------------------
	var subSearch = $("#subSearch").children().clone();
	var subCount = 1;
	$(".plus")
			.click(
					function() {
						if (subCount < 5) {
							var clone = subSearch.clone();
							$("#mainSearch").append(clone);
							clone.find('select').attr('name',
									'search[' + subCount + '].type').attr(
									'required', true);
							clone.find('input').attr('name',
									'search[' + subCount + '].keyword');
							subCount += 1;

							clone
									.find(".minus")
									.click(
											function() {
												$(this).parent().remove();
												for (var i = 1; i < $(
														'#mainSearch').find(
														'div').length; i++) {
													$('#mainSearch')
															.find('select')
															.eq(i)
															.attr(
																	'name',
																	'search['
																			+ i
																			+ '].type')
															.attr('required',
																	true);
													$('#mainSearch')
															.find('input')
															.eq(i)
															.attr(
																	'name',
																	'search['
																			+ i
																			+ '].keyword');
												}
												subCount -= 1;
											});

						} else {
							alert("검색어는 최대 5개까지 만들 수 있습니다.");
						}
					});

	// ----------------------------------------------- 조건 유지 이벤트
	// ---------------------------------------------------------

	for (var i = 1; i < searchType.length; i++) {
		if (searchType[i]) {
			$(".plus").trigger("click");
		}
	}
	if (searchType[0]) {
		$("select[name='search[0].type']").find(
				'option[value=' + searchType[0] + ']').attr('selected',
				'selected');
		$("select[name='search[1].type']").find(
				'option[value=' + searchType[1] + ']').attr('selected',
				'selected');
		$("select[name='search[2].type']").find(
				'option[value=' + searchType[2] + ']').attr('selected',
				'selected');
		$("select[name='search[3].type']").find(
				'option[value=' + searchType[3] + ']').attr('selected',
				'selected');
		$("select[name='search[4].type']").find(
				'option[value=' + searchType[4] + ']').attr('selected',
				'selected');
		$("input[name='search[0].keyword']").val(searchKeyword[0]);
		$("input[name='search[1].keyword']").val(searchKeyword[1]);
		$("input[name='search[2].keyword']").val(searchKeyword[2]);
		$("input[name='search[3].keyword']").val(searchKeyword[3]);
		$("input[name='search[4].keyword']").val(searchKeyword[4]);
	}

	if (productName) {
		$("input[name='product_name']").val(productName);
	}

	// ----------------------------------------------- 체크박스 이벤트
	// ---------------------------------------------------------

	// ----------------------------------------------- 조건 유지 이벤트
	// ---------------------------------------------------------

	// ----------------------------------------------- 날짜 버튼 이벤트
	// ---------------------------------------------------------
	var btnDate = $('.btnDate');
	btnDate.click(function() {
		var interval = $(this).attr('date-interval');
		switch (interval) {
		case '0':
			$('#startDate').datepicker('setDate', 'today');
			$('#endDate').datepicker('setDate', 'today');
			$(this).addClass('bc_g');
			btnDate.not(this).removeClass('bc_g');
			break;
		case '1':
			$('#startDate').datepicker('setDate', 'today-1D');
			$('#endDate').datepicker('setDate', 'today');
			$(this).addClass('bc_g');
			btnDate.not(this).removeClass('bc_g');
			break;
		case '3':
			$('#startDate').datepicker('setDate', 'today-3D');
			$('#endDate').datepicker('setDate', 'today');
			$(this).addClass('bc_g');
			btnDate.not(this).removeClass('bc_g');
			break;
		case '7':
			$('#startDate').datepicker('setDate', 'today-7D');
			$('#endDate').datepicker('setDate', 'today');
			$(this).addClass('bc_g');
			btnDate.not(this).removeClass('bc_g');
			break;
		case '15':
			$('#startDate').datepicker('setDate', 'today-15D');
			$('#endDate').datepicker('setDate', 'today');
			$(this).addClass('bc_g');
			btnDate.not(this).removeClass('bc_g');
			break;
		case '30':
			$('#startDate').datepicker('setDate', 'today-1M');
			$('#endDate').datepicker('setDate', 'today');
			$(this).addClass('bc_g');
			btnDate.not(this).removeClass('bc_g');
			break;
		case '90':
			$('#startDate').datepicker('setDate', 'today-3M');
			$('#endDate').datepicker('setDate', 'today');
			$(this).addClass('bc_g');
			btnDate.not(this).removeClass('bc_g');
			break;
		case '180':
			$('#startDate').datepicker('setDate', 'today-6M');
			$('#endDate').datepicker('setDate', 'today');
			$(this).addClass('bc_g');
			btnDate.not(this).removeClass('bc_g');
			break;
		}
	});

	$("#btnSearch").click(function() {
		$("input[type='submit']").trigger("click");
	})

	$('#btnInit').click(function() {
		location.reload();
	})

	// ----------------------------------------------- 달력 이벤트
	// ---------------------------------------------------------
	$.datepicker.setDefaults({
		dateFormat : 'yy-mm-dd',
		showOtherMonths : true // 빈 공간에 현재월의 앞뒤월의 날짜를 표시
		,
		showMonthAfterYear : true // 년도 먼저 나오고, 뒤에 월 표시
		,
		changeYear : true // 콤보박스에서 년 선택 가능
		,
		changeMonth : true // 콤보박스에서 월 선택 가능
		,
		showOn : "button",

		buttonImage : rootContext + "/image/admin/order/cal.png" // 버튼 이미지 경로
		,
		buttonImageOnly : true // 기본 버튼의 회색 부분을 없애고, 이미지만 보이게 함
		,
		buttonText : "선택" // 버튼에 마우스 갖다 댔을 때 표시되는 텍스트
		,
		yearSuffix : "년" // 달력의 년도 부분 뒤에 붙는 텍스트
		,
		monthNamesShort : [ '1', '2', '3', '4', '5', '6', '7', '8', '9', '10',
				'11', '12' ] // 달력의 월 부분 텍스트
		,
		monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월',
				'10월', '11월', '12월' ] // 달력의 월 부분 Tooltip 텍스트
		,
		dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ] // 달력의 요일 부분 텍스트
		,
		dayNames : [ '일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일' ] // 달력의
		// 요일 부분
		// Tooltip
		// 텍스트
		,
		minDate : "-1Y" // 최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
		,
		maxDate : "+1D" // 최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)
	});

	$('#startDate').datepicker();
	$('#endDate').datepicker();
	if (startDate) {
		$('#startDate').datepicker('setDate', startDate);
	} else
		$('#startDate').datepicker('setDate', 'today-1M');
	if (endDate) {
		$('#endDate').datepicker('setDate', endDate);
	} else
		$('#endDate').datepicker('setDate', 'today');

	if ($('#endDate').datepicker('setDate', 'today').val() == endDate) {
		if ($('#startDate').datepicker('setDate', 'today').val() == startDate) {
			$('.btnDate').eq(0).trigger('click');
		} else if ($('#startDate').datepicker('setDate', 'today-1D').val() == startDate) {
			$('.btnDate').eq(1).trigger('click');
		} else if ($('#startDate').datepicker('setDate', 'today-3D').val() == startDate) {
			$('.btnDate').eq(2).trigger('click');
		} else if ($('#startDate').datepicker('setDate', 'today-7D').val() == startDate) {
			$('.btnDate').eq(3).trigger('click');
		} else if ($('#startDate').datepicker('setDate', 'today-15D').val() == startDate) {
			$('.btnDate').eq(4).trigger('click');
		} else if ($('#startDate').datepicker('setDate', 'today-1M').val() == startDate) {
			$('.btnDate').eq(5).trigger('click');
		} else if ($('#startDate').datepicker('setDate', 'today-3M').val() == startDate) {
			$('.btnDate').eq(6).trigger('click');
		} else if ($('#startDate').datepicker('setDate', 'today-6M').val() == startDate) {
			$('.btnDate').eq(7).trigger('click');
		}
	}

	// 이동 함수
	function move(no) {
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

	// 전체 체크박스 이벤트
	$('#allChk').change(function() {
		if ($(this).is(':checked')) {
			$('.subChk').prop('checked', true);
		} else {
			$('.subChk').prop('checked', false);
		}
	});
	$('.subChk').change(function() {
		$('.subChk').each(function() {
			if ($(this).is(':checked')) {
				$('#allChk').prop('checked', true);
				return true;
			} else {
				$('#allChk').prop('checked', false);
				return false;
			}
		});
	});

	// 송장번호 입력
	var idAry = [];
	var notIdAry = [];
	var getTeam;

	$('.btnInvoice').click(function() {
		var t_id = $(this).prev().prev();
		var t_invoice = $(this).prev();
		$('input[name=team]').each(function() {
			if ($(this).is(':checked')) {
				idAry.push($(this).val());
			}
		});
		jQuery.ajaxSettings.traditional = true;
		$.ajax({
			url : "ready/invoice",
			type : "POST",
			dataType : "text",
			data : {
				idAry : idAry,
				t_id : t_id.val(),
				t_invoice : t_invoice.val(),
				t_status : "배송대기"
			},
			success : function(resp) {
				location.reload();
			}
		});
	});

	// 입금확인 버튼 이벤트
	$("#btnDeposit").click(function() {
		$('input[name=team]').each(function() {
			if ($(this).is(':checked')) {
				idAry.push($(this).val());
			}
		});
		jQuery.ajaxSettings.traditional = true;
		$.ajax({
			url : "before_deposit/confirm",
			type : "POST",
			dataType : "text",
			data : {
				idAry : idAry
			},
			success : function(resp) {
				location.reload();
			}
		});
	});

	// 개별배송 버튼 이벤트
	$("#btnDetach").click(function() {
		$('input[name=team]').each(function() {
			if ($(this).is(':checked')) {
				idAry.push($(this).attr('order_id'));
				getTeam = $(this).val();
			}
		});
		$('input[value='+getTeam+']').each(function(){
			if ($(this).is(':checked')){
			}
			else{
				notIdAry.push($(this).attr('order_id'));
			}
		});
		jQuery.ajaxSettings.traditional = true;
		$.ajax({
			url : "ready/detach",
			type : "POST",
			dataType : "text",
			data : {
				idAry : idAry,
				notIdAry: notIdAry,
				getTeam: getTeam
			},
			success : function(resp) {
				location.reload();
			}
		});
	});
	// 배송준비중 버튼 이벤트
	$("#btnReady").click(function() {
		$('input[name=team]').each(function() {
			if ($(this).is(':checked')) {
				idAry.push($(this).attr('order_id'));
				getTeam = $(this).val();
			}
		});
		$('input[value='+getTeam+']').each(function(){
			if ($(this).is(':checked')){
			}
			else{
				notIdAry.push($(this).attr('order_id'));
			}
		});
		jQuery.ajaxSettings.traditional = true;
		$.ajax({
			url : "waiting/ready",
			type : "POST",
			dataType : "text",
			data : {
				idAry : idAry,
				notIdAry: notIdAry,
				getTeam: getTeam,
				t_status : "배송준비중"
			},
			success : function(resp) {
				location.reload();
			}
		});
	});

	// 배송중 버튼 이벤트
	$("#btnShip").click(function() {
		$('input[name=team]').each(function() {
			if ($(this).is(':checked')) {
				idAry.push($(this).val());
			}
		});
		jQuery.ajaxSettings.traditional = true;
		$.ajax({
			url : "waiting/shipping",
			type : "POST",
			dataType : "text",
			data : {
				idAry : idAry,
				t_status : "배송중"
			},
			success : function(resp) {
				location.reload();
			}
		});
	});

	// 배송완료 버튼 이벤트
	$("#btnComplete").click(function() {
		$('input[name=team]').each(function() {
			if ($(this).is(':checked')) {
				idAry.push($(this).val());
			}
		});
		jQuery.ajaxSettings.traditional = true;
		$.ajax({
			url : "shipping/complete",
			type : "POST",
			dataType : "text",
			data : {
				idAry : idAry,
				t_status : "배송완료"
			},
			success : function(resp) {
				location.reload();
			}
		});
	});

	// dTap select 이벤트
	var d_tit = $('#d_tit').text();
	console.log(d_tit);
	$('.tab_li').each(function() {
		if ($(this).find('a').attr('href') == d_tit) {
			$(this).addClass('selected');
		} else {
			$(this).removeClass('selected');
		}
	})

	// 몇개씩 보기 이벤트
	var row = $('select[name=rows]')
	row.change(function() {
		$("form").submit();
	});

	// rows 조건유지
	row.find('option').each(function() {
		if ($(this).val() == rows) {
			$(this).prop('selected', true);
		} else {
			$(this).prop('selected', false);
		}
	});

});
