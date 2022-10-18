<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.DAO.BookDaoImp"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.entity.BookDetails"%>
<%@page import="java.util.*"%>
<%@page import="com.entity.User"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>User:Old Books</title>
<%@include file="AllComp/AllCSS.jsp"%>
<style type="text/css">
html, body {
	margin: 0px;
	padding: 0px;
	overflow-x: hidden;
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
		<br> <br>

		<div class="row p-2">
		<div class="col-md-12">
			<div class="card">
				<div class="card-body">
					<c:if test="${not empty sucmsg }">
						<center>
							<p class="text-center text-success">${sucmsg}</p>
						</center>
						<c:remove var="sucmsg" scope="session" />
						

					</c:if>
					<c:if test="${not empty failmsg }">
						<p class="text-center text-danger">${failmsg}
							<c:remove var="failmsg" scope="session" />
						</p>

					</c:if>

					<table class="table table-hover">
						<thead class="thead-dark">
							<tr>
								<th scope="col">Book</th>
								<th scope="col">Book Name</th>
								<th scope="col">Author</th>
								<th scope="col">Price</th>
								<th scope="col">Category</th>
								<th scope="col">Action</th>
							</tr>
						</thead>
						<tbody>
							<%
								User us = (User) session.getAttribute("userobj");
								String email = us.getEmail();

								BookDaoImp dao = new BookDaoImp(DBConnect.getConnection());
								List<BookDetails> list = dao.getBookByOld(email, "Old Book");

								for (BookDetails b : list) {
							%>
							<tr>
								<td><img src="books/<%=b.getPhotoName()%>"
									style="height: 50px;"></td>
								<th scope="row"><%=b.getBookName()%></th>
								<td><%=b.getAuthor()%></td>
								<td><%=b.getPrice()%></td>
								<td><%=b.getBookCategory()%></td>
								<td><a
									href="DeleteOldBook?email=<%=email%>&&bid=<%=b.getBookId()%>"
									class="btn btn-sm btn-danger">Delete</a></td>
							</tr>

							<%
								}
							%>


						</tbody>
					</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>