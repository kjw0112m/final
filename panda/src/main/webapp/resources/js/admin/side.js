// ----------------------------------------------- 관리자 메뉴 이벤트
// ---------------------------------------------------------
$(function() {
	var target = $(".product, .order, .member, .promotion, .stat, .board");
	target.click(function() {
		$(this).next().toggle();
		$(this).parent().toggleClass("bc_w");
		target.not($(this)).next().hide();
		target.not($(this)).parent().removeClass("bc_w");
	});

	target.next().find("a").click(function() {
		$(this).addClass("a_bold");
		target.next().find("a").not($(this)).removeClass("a_bold");
		console.log(this);
	});
});
