<%@page import="com.DB.DBConnect"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.DAO.CartDaoImp"%>
<%@page import="com.entity.User"%>
<%@page import="com.entity.Cart"%>
<%@page import="java.util.*"%>
<%@page import="com.entity.*"%>
<%@page import="com.DAO.BookDaoImp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>MyCart</title>
<%@include file="AllComp/AllCSS.jsp"%>
<style type="text/css">
html, body {
	margin: 0px;
	padding: 0px;
	overflow-x: hidden;
}

.view_img {
	height: 50px;
	width: 40px;
	border: 1px solid black;
}

.form-control {
	width: 10%;
}

#icon {
	margin-top: 7px;
}
</style>

</head>
<body style="background-color: #f7f2fa;">
	<%@include file="AllComp/navbar.jsp"%>
	<%
		response.setHeader("Cache-Control", "no-cache,no-store,must-validate");
	%>
	<c:if test="${empty userobj }">
		<c:redirect url="login.jsp" />
	</c:if>




	<div class="container">

		<c:if test="${not empty successmsg} ">
			<div class="alert alert-success">${successmsg }</div>
			<c:remove var="success" scope="session" />
		</c:if>

		<c:if test="${not empty failed} ">
			<div class="alert alert-danger" role="alert">${failed}</div>
			<c:remove var="success" scope="session" />
		</c:if>

		<div class="row mt-5">
			<div class="col-md-12">

				<div class="card">
					<div class="card-body">
						<c:if test="${not empty msg }">
							<p class="text-center text-warning">${msg}</p>
							<c:remove var="msg" scope="session" />
						</c:if>
						<c:if test="${not empty sucmsg }">
							<p class="text-center text-success">${sucmsg}</p>
							<c:remove var="sucmsg" scope="session" />
						</c:if>

						<c:if test="${not empty failmsg }">
							<p class="text-center text-danger">${failmsg}</p>
							<c:remove var="failmsg" scope="session" />
						</c:if>
						<h5 class="text-center" style="color: #5B194E;">YOUR CART</h5>
						<table class="table table-striped ">
							<thead>
								<tr>
									<th scope="col">Book</th>
									<th scope="col">Book Name</th>
									<th scope="col">Author</th>
									<th scope="col">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Quantity</th>
									<th scope="col">Price</th>
									<th scope="col">Action</th>
								</tr>
							</thead>
							<tbody>
								<%
									User u = (User) session.getAttribute("userobj");
									Cart c1 = new Cart();
									CartDaoImp dao = new CartDaoImp(DBConnect.getConnection());
									BookDaoImp dao1 = new BookDaoImp(DBConnect.getConnection());
									List<Cart> list = dao.getBookByUser(u.getId());
									Double TotalPrice = 0.0;

									for (Cart c : list) {
										TotalPrice = c.getTotalPrice();
								%>
								<tr>
									<th><img src="books/<%=c.getPhoto()%>" class="view_img"></th>
									<th><%=c.getBookName()%></th>
									<td><%=c.getAuthor()%></td>
									<td><div class="form-group d-flex justify-content-between">
											<div class="row">
												<div class="col-sm-8 mx-auto">
													<div class="input-group">
														<span class="input-group-prepend"> <a
															class="btn btn-outline-dark btn-sm btn-incre"
															href="quantityIncDec?action=inc&id=<%=c.getCid()%>&uid=<%=c.getUserId()%>&bid=<%=c.getBid()%>"><span
																class="fa-solid fa-plus" id="icon"></span></a></span> <input
															type="text" name="quantity" class="form-control"
															value="<%=c.getQuantity()%>" readonly><span
															class="input-group-append"> <a
															class="btn btn-outline-dark btn-sm btn-decre"
															href="quantityIncDec?action=dec&id=<%=c.getCid()%>&uid=<%=c.getUserId()%>&bid=<%=c.getBid()%>"><span
																class="fa-solid fa-minus" id="icon"></span></a>
														</span>
													</div>
												</div>
											</div>
										</div></td>

									<td><%=c.getPrice()%></td>
									<td><a
										href="RemoveBook?bid=<%=c.getBid()%>&&uid=<%=c.getUserId()%>&&cid=<%=c.getCid()%>"
										class="btn btn-sm btn-danger">Remove</a></td>
								</tr>

								<%
									}
								%>
								<tr style="background-color: #ffe6ff">
									<th scope="row">TOTAL PRICE</th>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td align="justify"><b><%=TotalPrice%></b></td>
								</tr>

							</tbody>
						</table>
						<br>
						<center>

							<a href="checkout.jsp?tp=<%=TotalPrice%>" class="btn btn-info ">Proceed
								to Checkout</a>&nbsp;&nbsp;<a href="index.jsp"
								class="btn btn-warning ">Continue Shopping</a>
						</center>
					</div>
				</div>
			</div>
		</div>


	</div>
</body>
</html>