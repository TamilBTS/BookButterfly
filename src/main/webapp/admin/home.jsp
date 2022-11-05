<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>Admin:Home</title>
<%@include file="AllCSS.jsp"%>
<style type="text/css">
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
</style>
</head>

<body>
	<%@include file="navbar.jsp"%>
	<%
		response.setHeader("Cache-Control", "no-cache,no-store,must-validate");
	%>
	<c:if test="${empty userobj }">
		<c:redirect url="../login.jsp" />
	</c:if>

	<div class="container">
		<div class="row p-5">
			<div class="col-md-3">
				<a href="add_books.jsp">
					<div class="card crd-ho">
						<div class="card-body text-center">
							<i class="fa-solid fa-circle-plus fa-3x text-primary"></i><br>
							<h4>Add Books</h4>
						</div>

					</div>
				</a>
			</div>
			<div class="col-md-3">
				<a href="AllOrders.jsp">
					<div class="card crd-ho">
						<div class="card-body text-center">
							<i class="fa-solid fa-gift fa-3x text-info"></i><br>
							<h4>All Orders</h4>
						</div>

					</div>
				</a>
			</div>
			
			<div class="col-md-3">
				<a href="all_books.jsp">
					<div class="card crd-ho">
						<div class="card-body text-center">
							<i class="fa-solid fa-book-open-reader fa-3x text-primary"></i><br>
							<h4>All Books</h4>
						</div>

					</div>
				</a>
			</div>
			<div class="col-md-3">
				<a data-toggle="modal" data-target="#exampleModalCenter">
					<div class="card crd-ho">
						<div class="card-body text-center">
							<i class="fa-solid fa-right-from-bracket fa-3x text-danger"></i><br>
							<h4>Logout</h4>
						</div>

					</div>
				</a>

			</div>
			</div>
			<div class="row p-5">
			<div class="col-md-3">
				<a href="orders.jsp">
					<div class="card crd-ho">
						<div class="card-body text-center">
							<i class="fa-solid fa-box-open fa-3x text-warning"></i><br>
							<h4>Order Requests</h4>
						</div>

					</div>
				</a>

			</div>
			<div class="col-md-3">
				<a href="CancelOrders.jsp">
					<div class="card crd-ho">
						<div class="card-body text-center">
							<i class="fa-solid fa-rectangle-xmark fa-3x text-danger"></i><br>
							<h4>Cancelled Orders</h4>
						</div>

					</div>
				</a>
			</div>
			<div class="col-md-3">
				<a href="salesReport.jsp">
					<div class="card crd-ho">
						<div class="card-body text-center">
							<i class="fa-solid fa-file-lines fa-3x text-dark"></i><br>
							<h4>Sales Report</h4>
						</div>

					</div>
				</a>
			</div>
			<div class="col-md-3">
				<a href="chart.jsp">
					<div class="card crd-ho">
						<div class="card-body text-center">
							<i class="fa-solid fa-chart-pie fa-3x text-info"></i><br>
							<h4>Pie Chart</h4>
						</div>

					</div>
				</a>
			</div>
			

		</div>


	</div>
	<!-- Logout Modal -->

	<!-- Button trigger modal -->


	<!-- Modal -->
	<div class="modal fade" id="exampleModalCenter" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalCenterTitle"
		aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLongTitle"></h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="text-center">
						<h4>Do you really want to Logout</h4>
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">Close</button>
						<a href="../Logout" type="button" class="btn btn-primary">Logout</a>
					</div>
				</div>
				<div class="modal-footer"></div>

			</div>
		</div>
	</div>
	<!-- End Of Logout Modal -->
	<div style="margin-top: 300px;">
		<%@include file="footer.jsp"%>
	</div>

</body>

</html>