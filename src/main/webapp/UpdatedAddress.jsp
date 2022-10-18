<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.entity.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>User:Add Address</title>
<%@include file="AllComp/AllCSS.jsp"%>
<style>
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
	
	<div class="container">
		<div class="row p-5">
			<div class="col-md-12">
				<div class="card">
					<div class="card-body">
						<c:if test="${not empty failure}">
							<h6 class="text-center text-danger">${failure}</h6>
							<c:remove var="failure" scope="session"></c:remove>
						</c:if>
						<c:if test="${not empty success}">
							<h6 class="text-center text-success ">${success}</h6>
							<c:remove var="success" scope="session"></c:remove>
						</c:if>
						<h5 class="text-center">Add Address</h5>
						<br>
						<form action="" method="post">
							<div class="row">
								<input type="hidden" value="${userobj.id }" name="uid">
								<div class="col">
									<input type="text" class="form-control" placeholder="Address" name="Address"
										required="required" value="${userobj.address }" readonly>
								</div>
								<div class="col">
									<input type="text" class="form-control" placeholder="Landmark" name="Landmark"
										required="required" value="${userobj.landmark }" readonly>
								</div>
							</div>
							<br>
							<div class="row">
								<div class="col">
									<input type="text" class="form-control" placeholder="City" name="City"
										required="required" value="${userobj.city }" readonly>
								</div>
								<div class="col">
									<input type="text" class="form-control" placeholder="State" name="State"
										required="required" value="${userobj.state }" readonly>
								</div>
							</div>
							<br>
							<div class="row text-center">
								<div class="col ">
									<input type="number" class="form-control" placeholder="Pincode" name="Pincode"
										required="required" value="${userobj.pincode }" readonly>
								</div>

							</div>
							<br>
							<div class="row p-3">
								<div class="col text-center">
									<a href="UserAddress.jsp" class="btn btn-info">Update</a>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>