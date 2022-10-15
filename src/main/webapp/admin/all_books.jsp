<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<%@page import="com.DAO.BookDaoImp"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.entity.BookDetails"%>
<%@page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin:All Books</title>
<%@include file="AllCSS.jsp"%>
</head>
<body>
	<%@include file="navbar.jsp"%>
	<%
		response.setHeader("Cache-Control", "no-cache,no-store,must-validate");
	%>

	<c:if test="${empty userobj }">
		<c:redirect url="../login.jsp" />
	</c:if>
	<h5 class="text-center">BOOKS</h5>

	<c:if test="${not empty success }">
		<p class="text-center text-success">${success}
			<c:remove var="success" scope="session" />
		</p>

	</c:if>
	<c:if test="${not empty failure }">
		<p class="text-center text-danger">${failure}
			<c:remove var="failure" scope="session" />
		</p>

	</c:if>

	<div class="container">

		<table class="table table-striped table-hover">
			<thead class="thead-dark">
				<tr>
					<th scope="col">ID</th>
					<th scope="col">Image</th>
					<th scope="col">Book Name</th>
					<th scope="col">Author</th>
					<th scope="col">Categories</th>
					<th scope="col">Price</th>
					<th scope="col">Status</th>
					<th scope="col">Action</th>
				</tr>
			</thead>
			<tbody>
				<%
					BookDaoImp dao = new BookDaoImp(DBConnect.getConnection());
					List<BookDetails> list = dao.getAllBooks();
					for (BookDetails b : list) {
				%>
				<tr>
					<th><%=b.getBookId()%></th>
					<td><img src="../books/<%=b.getPhotoName()%>"
						style="height: 50px;"></td>
					<td><%=b.getBookName()%></td>
					<td><%=b.getAuthor()%></td>
					<td><%=b.getBookCategory()%></td>
					<td><%=b.getPrice()%></td>
					<td><%=b.getStatus()%></td>
					<%if(b.getBookCategory().equals("Old Book")){ %>
						
						<td><a role="link"
								class="btn btn-sm btn-secondary" aria-disabled="true" style="color:white; "><i class="fa-solid fa-user-pen"></i>&nbsp;Edit</a>
								<a href="../DeleteBooks?id=<%=b.getBookId()%>"
								class="btn btn-sm btn-danger"><i
									class="fa-solid fa-trash-can-arrow-up"></i>&nbsp;Delete</a></td>
						
					<% } else {%>
					<td><a href="edit_books.jsp?id=<%=b.getBookId()%>"
						class="btn btn-sm btn-primary"><i class="fa-solid fa-user-pen"></i>&nbsp;Edit</a>
						<a href="../DeleteBooks?id=<%=b.getBookId()%>"
						class="btn btn-sm btn-danger"><i
							class="fa-solid fa-trash-can-arrow-up"></i>&nbsp;Delete</a></td><%} %>
				</tr>
				<%
					}
				%>


			</tbody>
		</table>




	</div>
	<div style="margin-top: 290px;">
		<%@include file="footer.jsp"%>
	</div>

</body>
</html>