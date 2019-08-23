<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<style>
    .btn {
        margin-top: 30px;
        border: none;
        background-color: black;
        color: #fff;
        height: 40px;
        width: 150px;
        margin-left: 20px;
    }

    .top-table {
        text-align: left;
        margin: auto;
        width: 70%;
        border: 3px none;
        padding: 5px;
        color: #555;
        font-size: 22px;
    }

    .btn-delete {
        margin-top: 10px;
        margin-bottom: 30px;
        margin-left: 15%;
    }
    .btn-de{
        text-align: center;
        background-color: #fff;
        height: 40px;
        width: 150px;
        border: 1px solid #bbb;
    }

    .box-price {
        text-align: center;
        margin: auto;
        width: 70%;
        border: 3px solid black;
        padding: 5px;
    }

    .table_st {
        border-width: 2px 0 0;
        border-style: solid;
        text-align: center;
        margin: auto;
        width: 70%;
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
    .imggg{
        width: 140px;
        height: 140px;
    }
    #span{
        margin-top: 50px;
        text-align: center;
        font-size: 16px;
    }
</style>
	<div id="span"><span style="font-weight: bold">01 쇼핑백</span><span> > 02 주문결제</span><span> > 03 주문완료</span></div>
	
    <div class="top-table">
            <h4>쇼핑백</h4>
    </div>
    <form action="delete" method="get">
        <table class="table_st">
            <thead>
                <tr>
                    <th><input type="checkbox" name="id" value="${c.cart_id }"></th>
                    <th></th>
                    <th>상품정보</th>
                    <th>수량</th>
                    <th>주문금액</th>
                    <th>배송비</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="c" items="${cList}">
                    <tr>
                        <td><input type="checkbox" name="id" value="${c.cart_id }"></td>
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
                        <td class="text-center">0</td>
                        <td class="text-center">${c.product_price}</td>
                        <td class="text-center">0</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <div class="btn-delete" align: "left">
            <input class="btn-de" "submit" value="선택 상품 삭제"><br>
        </div>
<div class="box-price">
    <h4>계산할래</h4>
</div>
<div align="center">
    <a href="#"><button class="btn">쇼핑계속하기</button></a> <a href="order"><button class="btn">구매하기</button></a>
</div>
</form>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>