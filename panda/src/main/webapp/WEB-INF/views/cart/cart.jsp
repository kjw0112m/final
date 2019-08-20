<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- <jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include> --%>
<table>

<c:forEach var="c" items="${cList}">
  <th>${c.product_price}
<%--     <td>${}</td> --%>
<!--     <td>&{}</td> -->
  </th>
  </c:forEach>
  
  <c:forEach var="memberDto" items="${mList}">
 	<td>${memberDto.~ }</td>
  </c:forEach>
</table>
<%-- <jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include> --%>