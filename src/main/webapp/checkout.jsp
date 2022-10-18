<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Checkout page</title>
<%@include file="AllComp/AllCSS.jsp"%>
<style type="text/css">
html, body {
	margin: 0px;
	padding: 0px;
	overflow-x: hidden;
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
	<c:if test="${not empty sucmsg }">
		<p class="text-center text-success">${sucmsg}</p>
		<c:remove var="sucmsg" scope="session" />
	</c:if>

	<c:if test="${not empty failmsg }">
		<p class="text-center text-danger">${failmsg}</p>
		<c:remove var="failmsg" scope="session" />
	</c:if>

	<%
		String TotalPrice = request.getParameter("tp");
		String Total = TotalPrice;

		if ("0.0".equals(TotalPrice)) {
			session.setAttribute("msg", "Please Add Books..");
			response.sendRedirect("cart.jsp");
		}
	%>

	<div class="container">
		<div class="row mt-4">
			<div class="col-md-4 offset-md-1">
				<div class="card" style="width: 1000px; height: 500px;">
					<div class="card-body text-center">
						<h5 class="text-center" style="color: #5B194E;">CHECKOUT
							DETAILS</h5>
						<c:if test="${not empty failure }">
							<p class="text-center text-danger">${failure}</p>
							<c:remove var="failure" scope="session" />
						</c:if>
						<br>
						<form action="UserOrders" method="post">
							<input type="hidden" name="id" value="${userobj.id }"> <input
								type="hidden" name="Total" value="<%=TotalPrice%>">
							<div class="row">
								<div class="col">
									<input type="text" class="form-control" name="username"
										placeholder="First name" required="required"
										value="${userobj.name }">
								</div>
								<div class="col">
									<input type="text" class="form-control" placeholder="Email"
										name="email" required="required" value="${userobj.email }">
								</div>
							</div>
							<br>
							<div class="row">
								<div class="col">
									<input type="number" class="form-control" name="phno"
										placeholder="Phone Number" required="required"
										value="${userobj.phno }">
								</div>
								<div class="col">
									<input type="text" class="form-control" placeholder="Address"
										name="address" required="required" value="${userobj.address }">
								</div>
							</div>
							<br>
							<div class="row">
								<div class="col">
									<input type="text" class="form-control" placeholder="Landmark"
										name="landmark" required="required"
										value="${userobj.landmark }">
								</div>
								<div class="col">
									<input type="text" class="form-control" placeholder="City"
										name="city" required="required" value="${userobj.city }">
								</div>
							</div>
							<br>
							<div class="row">
								<div class="col">
									<input type="text" class="form-control" placeholder="State"
										name="state" required="required" value="${userobj.state }">
								</div>
								<div class="col">
									<input type="number" class="form-control" placeholder="Pincode"
										name="pincode" pattern="[0-9]{6}" maxlength="6"
										
										oninput="javascript: if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);"
										required="required" value="${userobj.pincode }">
								</div>
							</div>
							<br>
							<div class="row">
								<div class="col">
									<input type="text" class="form-control"
										placeholder="Total : <%=TotalPrice%>" disabled>
								</div>
								<div class="col">
									<select class="custom-select" name="payment" required>
										<option value="">---Payment Mode---</option>
										<option value="COD">Cash On Delivery</option>
										<option value="Online">Credit/Debit Card</option>
									</select>
								</div>
							</div>
							
							<br>

							<center>
								<button type="submit" class="btn btn-success" value="Validate">Place
									Order</button>
							</center>



						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>