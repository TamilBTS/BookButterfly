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
<style type="text/css">
#myInput {
  
  width: 100%; /* Full-width */
  font-size: 16px; /* Increase font-size */
  padding: 12px 20px 12px 40px; /* Add some padding */
  border: 1px solid #ddd; /* Add a grey border */
  margin-bottom: 12px; /* Add some space below the input */
}
#myInput2 {
  background-image: url('/css/searchicon.png'); /* Add a search icon to input */
  background-position: 10px 12px; /* Position the search icon */
  background-repeat: no-repeat; /* Do not repeat the icon image */
  width: 100%; /* Full-width */
  font-size: 16px; /* Increase font-size */
  padding: 12px 20px 12px 40px; /* Add some padding */
  border: 1px solid #ddd; /* Add a grey border */
  margin-bottom: 12px; /* Add some space below the input */</style>
}
<script>
function myFunction() {
  // Declare variables
  var input, filter, table, tr, td, i, txtValue;
  input = document.getElementById("myInput");
  filter = input.value.toUpperCase();
  table = document.getElementById("myTable");
  tr = table.getElementsByTagName("tr");

  // Loop through all table rows, and hide those who don't match the search query
  for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("td")[0];
    if (td) {
      txtValue = td.textContent || td.innerText;
      if (txtValue.toUpperCase().indexOf(filter) > -1) {
        tr[i].style.display = "";
      } else {
        tr[i].style.display = "none";
      }
    }
  }
}
function myFunction2() {
	  // Declare variables
	  var input, filter, table, tr, td, i, txtValue;
	  input = document.getElementById("myInput2");
	  filter = input.value.toUpperCase();
	  table = document.getElementById("myTable");
	  tr = table.getElementsByTagName("tr");

	  // Loop through all table rows, and hide those who don't match the search query
	  for (i = 0; i < tr.length; i++) {
	    td = tr[i].getElementsByTagName("td")[3];
	    if (td) {
	      txtValue = td.textContent || td.innerText;
	      if (txtValue.toUpperCase().indexOf(filter) > -1) {
	        tr[i].style.display = "";
	      } else {
	        tr[i].style.display = "none";
	      }
	    }
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
	<div class="row">
	<div class="col"><input type="text" id="myInput" onkeyup="myFunction()" placeholder="Search by Date"></div>
	<div class="col"><input type="text" id="myInput2" onkeyup="myFunction2()" placeholder="Search by Book Name"></div>
	
	
	</div>

		<table class="table table-striped table-hover" id="myTable">
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
					<%}else if("Delivered".equals(b.getStatus())){ %>
					<td class="text-dark"><b><%=b.getStatus()%></b></td>
					<%
						} 
						else {
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