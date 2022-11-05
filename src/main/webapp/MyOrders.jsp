<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.entity.User"%>
<%@page import="com.DAO.*"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="java.util.*"%>
<%@page import="com.entity.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>User:My Orders</title>
<style type="text/css">
html, body {
	margin: 0px;
	padding: 0px;
	overflow-x: hidden;
}
</style>
<%@include file="AllComp/AllCSS.jsp"%>
</head>
<body style="background-color: #f7f2fa;">
	<%@include file="AllComp/navbar.jsp"%>
	<%
		response.setHeader("Cache-Control", "no-cache,no-store,must-validate");
	%>

	<c:if test="${empty userobj }">
		<c:redirect url="login.jsp" />
	</c:if>
	<div class="container-fluid" style="width: 100%">

		<div class="row p-5">
			<div class="col-md-12">
				<div class="card">
					<div class="card-body">
						<h4 class="text-center">MY ORDERS</h4>
						<center>
							<h6 class="text-center text-info">Accepted Orders will be
								delivered within a week...If not Contact our service center</h6>
						</center>
						<table class="table table-striped">
							<thead>
								<tr>
									<th scope="col">Order Id</th>
									<th scope="col">Order Date</th>
									<th scope="col">Order Time</th>
									<th scope="col">Name</th>
									<th scope="col">Book Name</th>
									<th scope="col">Author</th>
									<th scope="col">Quantity</th>
									<th scope="col">Price</th>
									<th scope="col">Payment Type</th>
									<th scope="col">Order Status</th>
									<th scope="col">Action</th>
								</tr>
							</thead>
							<tbody>
								<%
									User us = (User) session.getAttribute("userobj");
									BookOrdersDaoImp dao = new BookOrdersDaoImp(DBConnect.getConnection());

									List<BookOrders> list = dao.getBooks(us.getEmail());

									for (BookOrders b : list) {
								%>
								<tr>
									<th scope="row"><%=b.getOrderId()%></th>
									<td><%=b.getDate()%></td>
									<td><%=b.getTime()%></td>
									<td><%=b.getUsername()%></td>
									<td><%=b.getBookName()%></td>
									<td><%=b.getAuthor()%></td>
									<td><%=b.getQuantity()%></td>
									<td><%=b.getPrice()%></td>
									<td><%=b.getPaymentType()%></td>
									<%
										if ("Accepted".equals(b.getStatus())) {
									%>
									<td class="text-success"><b><%=b.getStatus()%></b></td>
									<%
										} else if ("Cancelled".equals(b.getStatus())) {
									%>
									<td class="text-danger"><b><%=b.getStatus()%></b></td>
									<%
										} else if ("Delivered".equals(b.getStatus())) {
									%>
									<td class="text-dark"><b><%=b.getStatus()%></b></td>
									<%
										} else {
									%>
									<td class="text-info"><b>Ordered</b></td>
									<%
										}
									%>
									<td>
										<%
											if ("Cancelled".equals(b.getStatus()) || "Delivered".equals(b.getStatus())) {
										%> <a role="link" class="btn btn-sm btn-secondary"><i
											class="fa-solid fa-xmark" aria-disabled="true"></i></a> <%
 	} else {
 %> <a
										href="UserOrderCancel?oid=<%=b.getId()%>&&bid=<%=b.getBid()%>&&q=<%=b.getQuantity()%>&&status=<%=b.getStatus()%>"
										class="btn btn-sm btn-danger"><i class="fa-solid fa-xmark"></i></a>
										<%
											}
										%>
									</td>
								</tr>


								<%
									}
								%>

							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>