<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.DAO.BookDaoImp"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.entity.BookDetails"%>
<%@page import="java.util.*"%>
<%@page import="com.DAO.*"%>
<%@page import="com.entity.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin:Orders</title>
<%@include file="AllCSS.jsp"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

<script type="text/javascript">
	function fun() {
		document.getElementById("c1").addAttribute("disabled");
	}
	$('.btn').on('click', function(e) {
		e.preventDefault();
		$(this).off("click").attr('href', "javascript: void(0);");
		add.off()
	});
</script>
<script>
	function clickAndDisable(link) {
		// disable subsequent clicks
		link.onclick = function(event) {
			event.preventDefault();
		}
	}
</script>
</head>
<body>
	<%@include file="navbar.jsp"%>
	<%
		response.setHeader("Cache-Control", "no-cache,no-store,must-validate");
	%>

	<c:if test="${empty userobj }">
		<c:redirect url="../login.jsp" />
	</c:if>
	<h5 class="text-center">ORDERS</h5>

	<div class="container-fluid" style="width: 100%">

		<table class="table table-striped table-hover">
			<thead class="thead-dark">
				<tr>
					<th scope="col">Order ID</th>
					<th scope="col">Date</th>
					<th scope="col">Name</th>
					<!-- <th scope="col">Email</th>
					<th scope="col">Address</th> -->
					<th scope="col">Phone No</th>
					<th scope="col">Book Name</th>
					<th scope="col">Author</th>
					<th scope="col">Quantity</th>
					<th scope="col">Price</th>
					<th scope="col">Payment</th>
					<th scope="col">Action</th>
					<!--<th scope="col">Status</th> -->
				</tr>
			</thead>
			<tbody>

				<%
					BookOrdersDaoImp dao = new BookOrdersDaoImp(DBConnect.getConnection());
					List<BookOrders> list = dao.getAllBooks();
					for (BookOrders b : list) {
				%>
				<tr >
					<th scope="row"><%=b.getOrderId()%></th>
					<td style="font-size=10px;"><%=b.getDate()%></td>
					<td style="font-size=10px;"><%=b.getUsername()%></td>
					<!-- <td style="font-size=10px;"><%=b.getEmail()%></td> -->
					<!--  <td style="font-size=10px;"><%=b.getFullAddress()%></td>-->
					<td style="font-size=10px;"><%=b.getPhno()%></td>
					<td style="font-size=10px;"><%=b.getBookName()%></td>
					<td style="font-size=10px;"><%=b.getAuthor()%></td>
					<td style="font-size=10px;"><%=b.getQuantity()%></td>
					<td style="font-size=10px;"><%=b.getPrice()%></td>
					<td style="font-size=10px;"><%=b.getPaymentType()%></td>
					<td>
						<div class="row">
							<div class="col-4">
								<a href="../OrderStatus?oid=<%=b.getId()%>"
									class="btn btn-sm btn-primary" id="c1"
									onClick="clickAndDisable(this)" style=""><i
									class="fa-solid fa-check"></i></a>
							</div>
							<div class="col-4">
								<a href="../OrderCancel?oid=<%=b.getId()%>"
									class="btn btn-sm btn-danger" id="c1"
									onClick="clickAndDisable(this)"><i
									class="fa-solid fa-xmark"></i></a>
							</div>
						</div>

					</td>




				</tr>
				<%
					}
				%>


			</tbody>
		</table>




	</div>
<!-- 	<div style="margin-top: 290px;">
		<%@include file="footer.jsp"%>
	</div>  -->

</body>
</html>