<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@page import="com.DAO.BookDaoImp"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.entity.BookDetails"%>
<%@page import="java.util.*"%>
<%@page import="com.entity.User"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View Books</title>
<%@include file="AllComp/AllCSS.jsp"%>
<style type="text/css">
.btn1 {
	background-color: white;
	color: #800D6D;
	width: 150px;
	height: 40px;
}

.btn1-ho:hover {
	background-color: #800D6D;
	color: white;
}

.view_img {
	height: 300px;
	width: 200px;
	border: 1px solid black;
}

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
		User u = (User) session.getAttribute("userobj");
	%>
	<%
		response.setHeader("Cache-Control", "no-cache,no-store,must-validate");
	%>
	<c:if test="${empty userobj }">
		<c:redirect url="login.jsp" />
	</c:if>
	<%
		int bid = Integer.parseInt(request.getParameter("bid"));
		BookDaoImp dao = new BookDaoImp(DBConnect.getConnection());
		BookDetails b = dao.getBooksById(bid);
	%>

	<div class="container p-4">
		<div class="row">
			<div class="col-md-6 p-5 text-center border bg-white"
				style="color: #800D6D;">
				<img src="books/<%=b.getPhotoName()%>" class="view_img"><br>
				<br>
				<h4 class="mt-3">
					Book Name &nbsp;&nbsp;: <span class="text-info"><%=b.getBookName()%></span>
				</h4>


				<h4>
					Author Name : <span class="text-info"><%=b.getAuthor()%></span>
				</h4>
				<h4>
					Book Category &nbsp;: <span class="text-info"><%=b.getBookCategory()%></span>
				</h4>
			</div>
			<div class="col-md-6 p-5 text-center border bg-white"
				style="color: #800D6D;">
				<h2><%=b.getBookName()%></h2>

				<%
					if ("Old Book".equals(b.getBookCategory())) {
				%>
				<h4 class="text-info">Contact To Seller</h4>
				<h4 class="text-info">
					<i class="fa-solid fa-envelope-circle-check"></i>&nbsp;Email
					:&nbsp;<%=b.getUserEmail()%></h4>
				<%
					}
				%>
				<br> <br> <br>
				<div class="row">
					<div class="col-md-4 text-center p-2">
						<i class="fa-solid fa-coins fa-2x"></i><br>
						<p>Cash On delivery</p>
					</div>
					<div class="col-md-4 text-center p-2">
						<i class="fa-solid fa-arrow-rotate-left fa-2x"></i><br>
						<p>No Return</p>
					</div>
					<div class="col-md-4 text-center p-2">
						<i class="fa-solid fa-truck fa-2x"></i><br>
						<p>Free Delivery</p>
					</div>

				</div>
				<br> <br>
				<%
					if ("Old Book".equals(b.getBookCategory())) {
				%>
				<div class="text-center p-4">
					<a href="index.jsp" class="btn btn-outline-info btn1 btn1-ho"
						style="width: 200px;"><i class="fa-solid fa-cart-arrow-down"></i>&nbsp;Continue
						Shopping</a>&nbsp;&nbsp;&nbsp; <a href="#"
						class="btn btn-outline-info btn1 btn1-ho"><i
						class="fa-solid fa-indian-rupee-sign"></i>&nbsp;<%=b.getPrice()%></a>
				</div>

				<%
					} else {
				%>
				<div class="text-center p-4">
					<%
						if (u == null) {
					%>
					<a href="login.jsp" class="btn btn-outline-info btn1 btn1-ho"><i class="fa-solid fa-bag-shopping"></i>&nbsp;Add To Bag</a>&nbsp;&nbsp;&nbsp;

					<%
						} else {
					%>
					<a href="MyCart?bid=<%=b.getBookId()%>&&uid=<%=u.getId()%>"
						class="btn btn-outline-info btn1 btn1-ho"><i class="fa-solid fa-bag-shopping"></i>&nbsp;Add To Bag</a>&nbsp;&nbsp;&nbsp;
					<%
						}
					%>

					<a href="#" class="btn btn-outline-info btn1 btn1-ho"><i
						class="fa-solid fa-indian-rupee-sign"></i>&nbsp;<%=b.getPrice()%></a>
				</div>
				<%
					}
				%>
			</div>
		</div>
	</div>



</body>
</html>