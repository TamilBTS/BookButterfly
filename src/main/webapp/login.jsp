<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login Page</title>
<%@include file="AllComp/AllCSS.jsp"%>
<style>
html, body {
	margin: 0px;
	padding: 0px;
	overflow-x: hidden;
}
</style>
</head>
<body style="background-color: #fffafd;">
	<%@include file="AllComp/navbar.jsp"%>
	
	<div class="container">
		<div class="row mt-4">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<h5 class="text-center">Login</h5>

						<c:if test="${not empty failure}">
							<h6 class="text-center text-danger">${failure}</h6>
							<c:remove var="failure" scope="session"></c:remove>
						</c:if>
						<c:if test="${not empty success}">
							<h6 class="text-center text-success ">${success}</h6>
							<c:remove var="success" scope="session"></c:remove>
						</c:if>



						<form action="Login" method="post">
							<div class="form-group">
								<label for="exampleInputEmail1">Email address</label> <input
									type="email" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" required="required" name="email">

							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Password</label> <input
									type="password" class="form-control" id="exampleInputPassword1"
									required="required" name="pass">
							</div>
					</div>
					<div class="text-center">
						<button type="submit" class="btn btn-primary">Submit</button>&nbsp;&nbsp;&nbsp;&nbsp;<a href="ForgotPassword.jsp" class="btn btn-dark">Forgot Password</a>
						<br>
						<br>&nbsp;&nbsp;<a href="register.jsp">Create Account</a>
					</div>
					</form>
				</div>
			</div>
		</div>
	</div>


	</div>

</body>
</html>