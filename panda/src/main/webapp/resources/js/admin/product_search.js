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


	// ----------------------------------------------- 체크박스 이벤트
	// ---------------------------------------------------------
	

	// ----------------------------------------------- 조건 유지 이벤트
	// ---------------------------------------------------------

	

	// ----------------------------------------------- 날짜 버튼 이벤트
	// ---------------------------------------------------------
	

	// ----------------------------------------------- 달력 이벤트
	// ---------------------------------------------------------
	
	// 이동 함수
	function move(no) {
		$("input[name=page]").val(no);

		$("#orderSearchForm").submit();
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
