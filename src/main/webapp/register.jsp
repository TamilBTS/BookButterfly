<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Registration Page</title>
<%@include file="AllComp/AllCSS.jsp"%>
<%@ page import = "com.user.servlet.*" %>
<style>
html,body{
margin:0px;
padding:0px;
overflow-x:hidden;
}
#message {
  display:none;
  background: #f1f1f1;
  color: #000;
  position: relative;
  padding: 20px;
  margin-top: 10px;
}

#message p {
  padding: 10px 35px;
  font-size: 18px;
}

/* Add a green text color and a checkmark when the requirements are right */
.valid {
  color: green;
}

.valid:before {
  position: relative;
  left: -35px;
  content: "";
}

/* Add a red text color and an "x" when the requirements are wrong */
.invalid {
  color: red;
}

.invalid:before {
  position: relative;
  left: -35px;
  content: "";
}
</style>
</head>
<body style="background-color:#fffafd;">
	<%@include file="AllComp/navbar.jsp"%>
	<div class="container">
		<div class="row mt-2">
			<div class="col-md-4 offset-md-4">
				<div class="card" style="width:450px;">
					<div class="card-body">
					<h4 class="text-center">Registration Page</h4>
					
					<c:if test="${not empty success}">
						<p class="text-center text-success">${success}</p>
						<c:remove var="success" scope="session"></c:remove>
						
					</c:if>
					<c:if test="${not empty failure}">
						<p class="text-center text-danger">${failure}</p>
						<c:remove var="failure" scope="session"></c:remove>
					
					</c:if>
						<form action="RegisterServlet" method="post">
							<div class="form-group">
								<label for="exampleInputEmail1">Enter Name</label> <input
									type="text" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" required="required" name="Uname">
								
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Email address</label> <input
									type="email" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" required="required" name="Uemail">
								
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Phone Number</label> <input
									type="number" maxlength="10" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" required="required" name="Uphno" >
								
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Password</label> <input
									type="password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters" class="form-control" id="exampleInputPassword1"
									required="required" name="Upass">
							</div>
							<div id="message">
  <h3>Password must contain the following:</h3>
  <p id="letter" class="invalid">A <b>lowercase</b> letter</p>
  <p id="capital" class="invalid">A <b>capital (uppercase)</b> letter</p>
  <p id="number" class="invalid">A <b>number</b></p>
  <p id="length" class="invalid">Minimum <b>8 characters</b></p>
</div>
							<div class="form-group">
							<label for="exampleInputPassword1">Security Question</label>
								<select class="custom-select" name="securityQues" required>
									<option value="">--select question--</option>
									<option value="What city were you born in?">What city were you born in?</option>
									<option value="What is your date of birth?">What is your date of birth?</option>
									<option value="What is the name of your first pet?">What is the name of your first pet?</option>
									<option value="What was your favorite subject in high school?">What was your favorite subject in high school?</option>
								</select>
								<div class="invalid-feedback">Example invalid custom
									select feedback</div>
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Your Answer</label> <input
									type="text" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" required="required" name="Answer">
								
							</div>
							
							<div class="form-check">
								<input type="checkbox" class="form-check-input"
									id="exampleCheck1" name="Ucheck" required="required"> <label class="form-check-label"
									for="exampleCheck1">I Agree To The Terms And Conditions</label>
							</div><br>
							<div class="text-center">
							<button type="submit" class="btn btn-primary text-center">Register</button>
							</div>
						</form>

					</div>

				</div>

			</div>

		</div>

	</div>
	<%@include file="AllComp/footer.jsp" %>
</body>
</html>