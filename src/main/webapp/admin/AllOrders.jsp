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
					<!-- <th scope="col">Email</th> -->
					<th scope="col">Address</th>

					<th scope="col">Book Name</th>
					<th scope="col">Author</th>
					<th scope="col">Quantity</th>
					<th scope="col">Price</th>
					<th scope="col">Payment</th>

					<th scope="col">Status</th>
				</tr>
			</thead>
			<tbody>

				<%
					BookOrdersDaoImp dao = new BookOrdersDaoImp(DBConnect.getConnection());
					List<BookOrders> list = dao.allBooks();
					for (BookOrders b : list) {
				%>
				<tr>
					<th scope="row"><%=b.getOrderId()%></th>
					<td style=""><%=b.getDate()%></td>
					<td style=""><%=b.getUsername()%></td>
					<!-- <td style="font-size=10px;"><%=b.getEmail()%></td> -->
					<td style=""><%=b.getFullAddress()%></td>

					<td style=""><%=b.getBookName()%></td>
					<td style=""><%=b.getAuthor()%></td>
					<td style=""><%=b.getQuantity()%></td>
					<td style=""><%=b.getPrice()%></td>
					<td style=""><%=b.getPaymentType()%></td>

					<%
						if ("Cancelled".equals(b.getStatus())) {
					%>
					<td class="text-danger"><b><%=b.getStatus()%></b></td>
					<%
						} else {
					%>
					<td class="text-success"><b><%=b.getStatus()%></b></td>
					<%
						}
					%>



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