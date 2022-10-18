<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.entity.User"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>ONLINE PAYMENT</title>
<%@include file="AllComp/AllCSS.jsp"%>
<style type="text/css">
html, body {
	margin: 0px;
	padding: 0px;
	overflow-x: hidden;
}
</style>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script type="text/javascript">
	function setreq() {

		document.getElementById("otp").setAttribute('required', 'required');
	}
	function remove() {
		alert("An OTP has sent to your Email...Please Check")
		document.getElementById("otp").removeAttribute('required', 'required');
		$.ajax({
			url : 'GetOTP',
			method : 'GET',
		});
	}
</script>
</head>
<body style="background-color: #f7f2fa;">
	<%@include file="AllComp/navbar.jsp"%>
	<%
		response.setHeader("Cache-Control", "no-cache,no-store,must-validate");
	%>
	<c:if test="${empty userobj }">
		<c:redirect url="login.jsp" />
	</c:if>
	


	<%
		HttpSession s = request.getSession();
		Object TotalPrice = s.getAttribute("tp");
		User us = (User) s.getAttribute("userobj");
	%>

	<div class="container">
		<div class="row mt-4">
			<div class="col-md-4 offset-md-1">
				<div class="card" style="width: 1000px; height: 500px;">
					<div class="card-body text-center">
						<h5 class="text-center" style="color: #5B194E;">ONLINE
							PAYMENT</h5>
							<c:if test="${not empty otpmsg }">
		<h6 class="text-center text-danger ">${otpmsg}</h6>
		<c:remove var="otpmsg" scope="session"></c:remove>
	</c:if>
						<c:if test="${not empty failure }">
							<p class="text-center text-danger">${failure}</p>
							<c:remove var="failure" scope="session" />
						</c:if>
						<br>
						<form action="OnlineConfirmOrder" method="post">
							<input type="hidden" name="id" value="${userobj.id }"> <input
								type="hidden" name="Total" value="<%=TotalPrice%>">
							<div class="row">
								<div class="col">
									<input type="text" class="form-control" name="username"
										placeholder="Name on Card" required="required" id="name"
										value="">
								</div>

							</div>
							<br>
							<div class="row">
								<div class="col">
									<input type="text" class="form-control" name="cno"
										placeholder="Card Number" required="required" maxlength="16"  pattern="[0-9]*" inputmode="numeric"
										id="cno" value="">
								</div>
								<div class="col">
									<input type="password" class="form-control" placeholder="CVV"
										name="cvv" required="required" id="cvv" maxlength="3" pattern="[0-9]*" inputmode="numeric">
								</div>
							</div>
							<br>
							<div class="row">
								<div class="form-group col-6">
									<input type="text" class="form-control" name="email"
										value="${userobj.email} " readonly>

								</div>

								<div class="form-group col-md-4">
									<input type="text" class="form-control" placeholder="OTP"
										name="otp" id="otp">
								</div>
								<div class="form-group col-md-2">
									<button type="button" class="btn btn-dark" name="getotp"
										value="Get OTP" onclick="remove()">Get OTP</button>
								</div>
								<%
									User u = (User) session.getAttribute("userobj");
									String email = u.getEmail();
									s.setAttribute("email", email);
								%>
							</div>
							<br>

							<div class="row">
								<div class="col">
									<input type="text" class="form-control"
										placeholder="Total : <%=TotalPrice%>" disabled>
								</div>

							</div>

							<br>

							<center>
								<input type="submit" class="btn btn-success" value="Place Order"
									onclick="setreq()">
							</center>

						</form>
					</div>
				</div>
			</div>
		</div>
	</div>


</body>
</html>