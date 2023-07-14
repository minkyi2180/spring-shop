<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/userOrder/myOrderDetail.css">
</head>
<body>

	<%@ include file="/WEB-INF/views/include/userHeader.jsp" %>
	<%@ include file="/WEB-INF/views/include/sideBar.jsp"%>

	<div class="order-details">
		<h2>주문 상세 정보</h2>
		
		<table>
		<tr>
		<th><strong>주문 번호 No.</strong></th>
		<td> ${order.orderNum}</td>
		</tr>
		
		<tr>
		<th><strong>주문 날짜</strong></th>
		<td >${order.orderDate}</td>
		</tr>
		
		<tr>
		<th><strong>주문 금액</strong></th>
		<td> ${order.orderPrice} 원</td>
		</tr>
		
		</table>
		<br>
		
		
		<table>
		<h4>배송 정보</h4>
		<tr>
		<th><strong>배송자명</strong></th>
		<td> ${order.orderRecv} 님</td>
		</tr>
		
		<tr>
		<th><strong>배송 주소</strong></th>
		<td> ${order.orderPost }</td>
		</tr>
		
		<tr>
		<th></th>
		<td> ${order.orderAddr1 }<br>${order.orderAddr2 }</td>
		</tr>
		</table>
		
		<br>
		<h4>배송 진행 상황</h4>
		<p> ${order.orderStatus }</p>
		

		<div class="order-items">
			<h4>주문 상품</h4>
			<table>
				<thead class="order-item-details" >
					<tr>
						<th class="jb-th-1">상품</th>
						<th>가격</th>
						<th>수량</th>
						<th>합계</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="od" items="${detail }">
					<tr>
						<td> ${od.prodNum }</td>
						<td> ${od.prodPrice }</td>
						<td> ${od.prodCount }</td>
						<td> ${od.prodPrice * od.prodCount }</td>
					</tr>
					</c:forEach>
				</tbody>
				</table>
				
					<tr>
						<td colspan="3">총 주문 금액:</td>
						<td>${order.orderPrice }</td>
					</tr>
				<br>
			
			<tr>
			<td>사용포인트</td>
			<td>적립포인트</td>
			<td>배송비 ${orderPrice }</td>
			</tr>
		</div>
		<br>
		<a class="cancel_order">주문 취소하기</a>		
		<br>
		<br>
		
	</div>
	</section>
	</div><!-- column-container end -->
	
	<%@ include file="/WEB-INF/views/include/userFooter.jsp" %>

	<script>
		$(".cancel_order").on("click", function(){
			if(${order.orderStatus eq '상품준비'}){
				$(".cancel_order").attr("href", "/userOrder/cancelOrder/${orderNum }");
			}else{
				alert("취소가 불가능합니다.");
			}
		});
	</script>
</body>
</html>