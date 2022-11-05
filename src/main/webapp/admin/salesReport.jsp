<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.DAO.BookDaoImp"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.entity.BookDetails"%>
<%@page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>sales</title>
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
<h4 class="text-center">Sales Report</h4>
		<table class="table table-striped table-hover">
			<thead class="thead-dark">
				<tr>
					<th scope="col">Image</th>
					
					<th scope="col">Book Name</th>
					<th scope="col">Author</th>
					<th scope="col">Categories</th>
					<th scope="col">TotalSales</th>
					
				</tr>
				<%	BookDaoImp dao=new BookDaoImp(DBConnect.getConnection());
				
					List<BookDetails> list=dao.salesreport();
					
					for(BookDetails b:list){
					%>
					<tr>
					<td><img src="../books/<%=b.getPhotoName()%>"
						style="height: 50px;"></td>
					<td><%=b.getBookName() %></td>
					<td><%=b.getAuthor() %></td>
					<td><%=b.getBookCategory() %></td>
					<td><%=b.getTotalsales() %></td>
					</tr>
					<%} %>
			</thead>
			<tbody>
			</tbody>
		</table>
	</div>
</body>
</html>