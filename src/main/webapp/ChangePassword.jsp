<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>User:Edit Profile</title>
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
	
	<div class="container">
		<div class="row p-3">
			<div class="col-md-4 offset-md-4">
			
			
				<div class="card">
					<div class="card-body">
					<h5 class="text-center">Change Password</h5>
					<c:if test="${not empty success }">
			<p class="text-success text-center">${success }</p>
			<c:remove var="success" scope="session"/>
			</c:if>
			
				<c:if test="${not empty failure }">
			<p class="text-danger text-center">${failure }</p>
						<c:remove var="failure" scope="session"/>
			
			</c:if>
						<form action="UpdatePassword" method="post">
						<input type="hidden" value="${userobj.id }" name="uid">
						<input type="hidden" value="${userobj.email }" name="email">
							
							<div class="form-group">
								<label for="exampleInputEmail1">Email address</label> <input
									type="email" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" required="required" name="Uemail" value="${userobj.email }" readonly>

							</div>
							
							<div class="form-group">
								<label for="exampleInputPassword1">Old Password</label> <input
									type="password" class="form-control" id="exampleInputPassword1"
									required="required" name="opass">
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">New Password</label> <input
									type="password" class="form-control" id="exampleInputPassword1"
									required="required" name="npass" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters" class="form-control" id="exampleInputPassword1">
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Confirm Password</label> <input
									type="password" class="form-control" id="exampleInputPassword1"
									required="required" name="cpass" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters" class="form-control" id="exampleInputPassword1">
							</div>
							
							<br>
							<div class="text-center">
								<button type="submit" class="btn btn-outline-dark text-center">Update</button>
								
							</div>
						</form>

					</div>
				</div>
			</div>
		</div>


	</div>
</body>
</html>