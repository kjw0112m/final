<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<script>
    function findAddress() {
        new daum.Postcode({
            $(function () {
                $(".btn-addr").click(findAddress);

                $(".all-chk").change(function () {
                    console.log("?");
                    if ($(this).is(":checked")) {
                        $(".sub-chk").prop("checked", true);
                    } else {
                        $(".sub-chk").prop("checked", false);
                    }
                });

                $(".sub-chk").change(function () {
                    if (!$(this).is(":checked")) {
                        $(".all-chk").prop("checked", false);
                    }
                })
            })
            oncomplete: function (data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if (data.userSelectedType === 'R') {
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if (data.buildingName !== '' && data.apartment === 'Y') {
                        extraAddr += (extraAddr !== '' ? ', ' +
                            data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if (extraAddr !== '') {
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다
                }
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                //document.querySelector('input[name=postcode]').value = data.zonecode;
                //document.querySelector("input[name=basicaddr]").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                //document.querySelector("input[name=detailaddr]").focus();

                // 이 코드는 jquery.js를 먼저 불러온 경우만 사용 가능
                $("input[name=zip_code").val(data.zonecode);
                $("input[name=basic_addr]").val(addr);
                $("input[name=detail_addr]").focus();
            }
        }).open();
    }
</script>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>order</title>
    <style>
        * {
            box-sizing: border-box;
        }

        .table_st {
            border-width: 2px 0 0;
            border-style: solid;
            text-align: center;
            margin: 10px;
            width: 900px;
            height: 287;
        }

        .text-left {
            text-align: left;
        }

        .text-conter {
            text-align: center;
        }

        .table_st th,
        .table_st td {
            border-width: 0 0 1px;
            border-style: solid;
            border-color: #d0d0d0;
        }

        table {
            border-collapse: collapse;
        }

        .imggg {
            width: 140px;
            height: 140px;
        }

        #span {
            margin-top: 50px;
            margin-bottom: 50px;
            text-align: center;
            font-size: 16px;
        }

        /* .total{
	float: left;
	width: 50%;
	padding-top: 80px;
	margin-bottom: 50px;
    }
    .total::after {
	content: '';
	display: block;
	clear: both;
    } */
        .a {
            width: 10%;
            padding: 10px;
            font-size: 10px;
        }

        .b {
            border: lightgray 1px solid;
            width: 300px;
            height: 30px;
            margin-top: 10px;
            margin-bottom: 10px;
        }

        .c {
            margin-top: 5px;
            margin-bottom: 10px;
        }

        .table_new {
            border-width: 2px 0 0;
            border-style: solid;
            margin: 20px;
            width: 900px;
            height: 300;
        }

        .table_new th,
        .table_new td {
            border-width: 0 0 1px;
            border-style: solid;
            border-color: #d0d0d0;
        }

        .phone>input {
            height: 37px;
            width: 80px;
            border: none;
            text-align: center;
        }

        .phone {
            border: lightgray 1px solid;
            width: 100px;
            height: 30px;
            margin-top: 10px;
            margin-bottom: 10px;
        }

        .box {
            float: left;
            width: 50%;
            padding: 30px;
            text-align: center;
        }

        .clearfix::after {
            content: "";
            clear: both;
            display: table;
        }

        .clearfix {
            margin-left: 30%;
            margin-right: 30%;
        }
        h4{
            margin-left: 30px;
        }
    </style>
</head>

<body>
    <!-- <div class="total"> -->
    <div id="span"><span>01 쇼핑백 > </span><span style="font-weight: bold">02 주문결제</span><span> > 03 주문완료</span></div>
    <h4>상품 정보</h4>
    <table class="table_st">
        <thead>
            <tr>
                <td></td>
                <td>상품정보</td>
                <td>주문금액</td>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="c" items="${cList}">
                <tr>
                    <td class="imggg">
                        <a href="#" class="img">
                            <img src="http://placehold.it/100"></a>
                    </td>
                    <td class="text-left">
                        <a href="#"><span>${c.product_seller_id}<span></a>
                        <a href="#"><span>${c.product_name}<span></a>
                        <div>${c.product_price}</div>
                        <div>${c.sizes_sizes}</div>
                    </td>
                    <td class="text-center">${c.product_price}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    <!-- <div class="box-price">
                        <h4>계산할래</h4>
                </div> -->
    <!-- </div> -->
    <h4>주문하시는 분</h4>
    <table class="table_new">
        <tbody>
            <tr>
                <th class="a">이름</th>
                <td><input class="b" type="text"></td>
            </tr>
            <tr>
                <th class="a">전화번호</th>
                <td>
                    <span><input type="text" name="phone" value maxlength="3" required class="phone"></span>
                    <span><input type="text" name="phone" value maxlength="4" required class="phone"></span>
                    <span><input type="text" name="phone" value maxlength="4" required class="phone"></span>
                </td>
            </tr>
            <tr>
                <th class="a">배송주소</th>
                <td>
                    <div><input type="text" name="zip_code" readonly class="b">
                        <input type="button" value="주소 찾기" required class="btn-find"><br>
                        <input type="text" name="basic_addr" readonly class="b">
                        <input type="text" name="detail_addr" class="b">
                    </div>
                </td>
            </tr>
        </tbody>
    </table>

    <h4>받으시는 분</h4>
    <table class="table_new">
        <tbody>
            <tr>
                <th class="a">배송지 선택</th>
                <td><input class="c" type="radio"><span style="font-size: 10px">&nbsp주문자 정보와 동일</span>
                    <input class="c" type="radio"><span style="font-size: 10px">&nbsp새로입력</span>
                </td>
            </tr>
            <tr>
                <th class="a">이름</th>
                <td><input class="b" type="text"></td>
            </tr>
            <tr>
                <th class="a">전화번호</th>
                <td>
                    <span><input type="text" name="phone" value maxlength="3" required class="phone"></span>
                    <span><input type="text" name="phone" value maxlength="4" required class="phone"></span>
                    <span><input type="text" name="phone" value maxlength="4" required class="phone"></span>
                </td>
            </tr>
            <tr>
                <th class="a">배송주소</th>
                <td>
                    <div><input type="text" name="zip_code" readonly class="b">
                        <input type="button" value="주소 찾기" required class="btn-find"><br>
                        <input type="text" name="basic_addr" readonly class="b">
                        <input type="text" name="detail_addr" class="b">
                    </div>
                </td>
            </tr>
        </tbody>
    </table>

    <h4>결제 정보</h4>
    <div class="clearfix">
        <div class="box" style="border:#bbb solid 1px">
            <p>카카오 결제</p>
        </div>
        <div class="box" style="border:#ccc solid 1px">
            <p>무통장입금</p>
        </div>
    </div>
</body>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include> 