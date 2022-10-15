<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>User:Settings</title>
<%@include file="AllComp/AllCSS.jsp"%>
<style>
a {
	text-decoration: none;
	color: black;
}

a:hover {
	text-decoration: none;
	color: black;
}

.crd-ho:hover {
	background: #f4e9f7;
}
html,body{
margin:0px;
padding:0px;
overflow-x:hidden;
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
	
	<h4 class="text-center">Hello ${userobj.name}</h4>
	
		
		<div class="row p-5">
			<div class="col-md-4">
				<a href="sellOldBook.jsp">
					<div class="card crd-ho">
						<div class="card-body text-center">
							<div class="text-warning"><i class="fa-solid fa-book-open-reader fa-3x "></i></div>
							<h3 class="p-2">Sell Old Book</h3>
							<h6>Add your book</h6>
						</div>
					</div>

				</a>
			</div>
			<div class="col-md-4">
				<a href="UserOldBooks.jsp">
					<div class="card crd-ho">
						<div class="card-body text-center">
							<div class="text-success"><i class="fa-solid fa-book-bookmark fa-3x"></i></div>
							<h3 class="p-2">Old Books</h3>
							<h6>Edit your book</h6>
						</div>
					</div>

				</a>
			</div>
			<div class="col-md-4">
				<a href="EditProfile.jsp">
					<div class="card crd-ho">
						<div class="card-body text-center">
							<div class="text-danger"><i class="fa-solid fa-pen-to-square fa-3x"></i></div>
							<h4 class="p-2">Login and Security</h4>
							<h6>Edit Profile</h6>
						</div>
					</div>

				</a>
			</div>
			<div class="col-md-4 mt-3">
				<a href="UpdatedAddress.jsp">
					<div class="card crd-ho">
						<div class="card-body text-center">
							<div class="text-primary"><i class="fa-solid fa-location-dot fa-3x"></i></div>
							<h3 class="p-2">Your Address</h3>
							<h6>Edit Address</h6>
						</div>
					</div>

				</a>
			</div>
			<div class="col-md-4 mt-3">
				<a href="MyOrders.jsp">
					<div class="card crd-ho">
						<div class="card-body text-center">
							<div class="text-info"><i class="fa-solid fa-gift fa-3x"></i></div>
							<h3 class="p-2">My Orders</h3>
							<h6>View My Orders</h6>
						</div>
					</div>

				</a>
			</div>
			<div class="col-md-4 mt-3">
				<a href="HelpLine.jsp">
					<div class="card crd-ho">
						<div class="card-body text-center">
							<div class="text-primary"><i class="fa-solid fa-circle-info fa-3x"></i></div>
							<h3 class="p-2">Help Center</h3>
							<h6>24/7</h6>
						</div>
					</div>

				</a>
			</div>
		</div>
	</div>
</body>
</html>