<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.DB.*" %>
<%@page import="com.DAO.*" %>
<%@page import="java.sql.*" %>
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
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script type="text/javascript">
 <%HttpSession s=request.getSession();%>
function remove(email) {
	
	var email=document.getElementById("email").value;
	
	if(email==''){
		alert("Email must be filled out");
		return false;
	}
	else{
			
	$.ajax({
		url : 'EmailForgot',
		method : 'GET',
		datatype:'json',
		data : {'email':email}
		success : function(data){
			if(data.isValid){alert('Success')}
			else{alert('Error')}
			
			}
		}
	});
	
}
</script>
</head>
<body style="background-color: #fffafd;">
	<%@include file="AllComp/navbar.jsp"%>
	
	
	
	<div class="container">
		<div class="row mt-4">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<h5 class="text-center">Change Password</h5>

						<c:if test="${not empty error}">
							<h6 class="text-center text-danger">${error}</h6>
							<c:remove var="error" scope="session"></c:remove>
						</c:if>
						<c:if test="${not empty success}">
							<h6 class="text-center text-success ">${success}</h6>
							<c:remove var="success" scope="session"></c:remove>
						</c:if>



						<form action="EmailChangePass" method="post">
							<div class="form-group">
								<label for="exampleInputEmail1">Email address</label> <input
									type="email" class="form-control" id="email"
									aria-describedby="emailHelp" required="required" name="email"><br>
									
									<button type="button" class="btn btn-outline-dark" id="sk" onclick="remove('email')">Generate Security Key</button>

							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Security Key</label> <input
									type="number" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" required="required" name="secKey">

							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">New Password</label> <input
									type="password" class="form-control" id="np" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters"
									aria-describedby="emailHelp" required="required" name="secKey" disabled>

							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Confirm Password</label> <input
									type="password" class="form-control" id="cp" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters"
									aria-describedby="emailHelp" required="required" name="secKey" disabled>

							</div>
							
					
					<div class="text-center">
						<button type="submit" class="btn btn-outline-dark">Submit</button>
						<br>
						
					</div>
					</form>
					</div>
				</div>
			</div>
		</div>
	</div>


	</div>

</body>
</html>