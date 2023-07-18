<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/adminProd/read.css">
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
</head>
<body>

	<!-- header -->
	<%@include file="../include/adminHeader.jsp"%>

		<!-- 메인 화면 부분 -->
		<div class="admin_content_wrap">
		<table>
		<tr>
		<th>이미지 파일</th>
		<td><img class="img" src="/resources/image_1/${pageInfo.img1}">
			<img class="img" src="/resources/image_2/${pageInfo.img2}">
			<img class="img" src="/resources/image_3/${pageInfo.img3}"> </td>
		</tr>
		
		<tr>
		<th>상품번호</th>
		<td><c:out value="${pageInfo.prodNum}"/></td>
		</tr>
		
		<tr>
		<th>카테고리 번호</th>
		<td><c:out value="${pageInfo.categoryNum}"/></td>
		</tr>
		
		<tr>
		<th>상품명</th>
		<td><c:out value="${pageInfo.prodName}"/></td>
		</tr>
		
		<tr>
		<th>상품가격</th>
		<td><c:out value="${pageInfo.price}"/></td>
		</tr>
		
		<tr>
		<th>상품 상세정보</th>
		<td><c:out value="${pageInfo.prodInfo}"/></td>
		</tr>
		
		<tr>
		<th>재고량</th>
		<td><c:out value="${pageInfo.stock}"/></td>
		</tr>
		
		</table>
		
	
		<div class="btn_wrap">
			<a class="btn" id="list_btn">목록 페이지</a>
			<a class="btn" id="update_btn">수정하기</a>
		</div>
	</div>
	
	<form id="infoForm" method="get" action="/adminProd/list">
		<input type="hidden" id="prodNum" name="prodNum" value='<c:out value = "${pageInfo.prodNum}"/>'>
		<input type="hidden" name="type" value='<c:out value = "${cri.type}"/>'> 
		<input type="hidden" name="keyword" value='<c:out value = "${cri.keyword}"/>'>
	</form>
			
	<!-- footer -->
	<%@include file="../include/adminFooter.jsp"%>

	<script>	
    let form = $("#infoForm");
    $("#list_btn").on("click", function(e) {
       form.find("#prodNum").remove();
       form.attr("action", "/adminProd/list");
       form.submit();
    });
    $("#update_btn").on("click", function(e) {
       form.attr("action", "/adminProd/update");
       form.submit();
    });
   </script>
</body>
</html>