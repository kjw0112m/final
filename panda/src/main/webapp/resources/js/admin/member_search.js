$(function() {
		// 이동 함수
	function move(no) {
		$("input[name=page]").val(no);
		console.log(no);
		$("form").submit();
	}

	$(".page_move").click(function() {
		var p = $(this).text();
		move(p);
	});

	$(".page_block").click(function() {
		var p = $(this).text();
		console.log(p);
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
