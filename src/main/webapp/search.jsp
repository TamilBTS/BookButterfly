
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.DAO.BookDaoImp"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.entity.BookDetails"%>
<%@page import="java.util.*"%>
<%@page import="com.entity.User"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<html>
<head>
	<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>User:Search Page</title>
<%@include file="AllComp/AllCSS.jsp"%>
<style type="text/css">
.card-img-top {
	object-fit: cover;
	padding: 15px;
	margin-left: 44px;
	width: 260px;
	height: 370px;
	margin-top: 13px;
	border: 1rm solid black;
}

h5 {
	color: #AD21A9;
}

.crd-ho:hover {
	background: #f9f2fa;
}
.cart:hover{
   color:white;
}
html,body{
margin:0px;
padding:0px;
overflow-x:hidden;
}

.btn1 {
	
	color: #800D6D;
	height: 40px;
	border-color:#800D6D; 
}

.btn1-ho:hover {
	background-color: #800D6D;
	color: white;
}
</style>


</head>
<body style="background-color: #f7f2fa;">

	<%
		User u = (User) session.getAttribute("userobj");
	%>
	<%
		response.setHeader("Cache-Control", "no-cache,no-store,must-validate");
	%>

	<%@include file="AllComp/navbar.jsp"%>
	
	
	
	
	<div class="container-fluid back-img">
		<h5 class="text-center">Your Search Results</h5>
<c:if test="${not empty failure}">
					<h6 class="text-center text-danger">${failure}</h6>
					<c:remove var="failure" scope="session"></c:remove>
					</c:if>
				<!--  	<c:if test="${not empty addcart}">
					<h6 class="text-center text-success ">${addcart}</h6>
					<c:remove var="addcart" scope="session"></c:remove>
					</c:if> -->

	</div>


	<div class="container">

		<div class="card">
			<div class="row">
				<!-- Old Books Button disabled -->

				<%
					String ch=request.getParameter("ch");
					BookDaoImp dao = new BookDaoImp(DBConnect.getConnection());
					List<BookDetails> list = dao.getBooksBySearch(ch);
					for (BookDetails b : list) {

						if (b.getBookCategory().equals("Old Book"))

						{
				%>
				<div class="col-md-4">

					<div class="card mb-4 crd-ho">

						<img src="books\<%=b.getPhotoName()%>" alt="HTML5 Tamil"
							class="card-img-top img-fluid" />
						<div class="card-body ">
							<h5 class="card-title"><%=b.getBookName()%></h5>
							<span class="badge mb-2 badge-pill badge-secondary"><%=b.getBookCategory()%></span>
							<p class="card-text text-muted">
								Author :<%=b.getAuthor()%>
							</p>
							<p class="card-text text-dark">
								Price : <i class="fa-solid fa-indian-rupee-sign"></i><%=b.getPrice()%>
							</p>
							<a role="link"
								class="btn btn-outline-secondary btn-block text-center"
								aria-disabled="true"> <i class="fa-solid fa-bag-shopping"></i>&nbsp;Add To Bag
							</a> <a href="view_books.jsp?bid=<%=b.getBookId()%>"
								class="btn btn-outline btn1 btn1-ho btn-block text-center"> <i
								class="fa-solid fa-book pr-2"></i>View
							</a>
						</div>

						<div class="card-footer">
							<small class="text-muted">Last Updated on: August, 2022 </small>
						</div>
					</div>

				</div>




				<%
					} else {
				%>
				<!-- New Books  -->

				<div class="col-md-4">

					<div class="card mb-4 crd-ho">

						<img src="books\<%=b.getPhotoName()%>" alt="HTML5 Tamil"
							class="card-img-top img-fluid" />
						<div class="card-body ">
							<h5 class="card-title"><%=b.getBookName()%></h5>
							<%if(b.getBookCategory().equals("Entertainment")) {%>
							<span class="badge mb-2 badge-pill badge-dark"><%=b.getBookCategory()%></span><%} else{%>
							<span class="badge mb-2 badge-pill badge-primary"><%=b.getBookCategory()%></span>
							
							<%} %>
							<p class="card-text text-muted">
								Author :<%=b.getAuthor()%>
							</p>
							<p class="card-text text-dark">
								Price : <i class="fa-solid fa-indian-rupee-sign"></i><%=b.getPrice()%>
							</p>
							<%
								if (u == null) {
							%>
							<a href="login.jsp" class="btn btn-outline-info btn-block text-center">
								<i class="fa-solid fa-bag-shopping"></i>&nbsp;Add To Bag
							</a>

							<%
								} else {
									int bookId=b.getBookId();
							%>
							<a href="MyCart?bid=<%=b.getBookId()%>&&uid=<%=u.getId()%>" class="btn btn-outline-info btn-block text-center">
								<i class="fa-solid fa-bag-shopping"></i>&nbsp;Add To Bag
							</a>
							<%
								}
							%>
							<a href="view_books.jsp?bid=<%=b.getBookId()%>"
								class="btn btn-outline btn1 btn1-ho btn-block text-center"> <i
								class="fa-solid fa-book pr-2"></i>View
							</a>
						</div>
						<div class="card-footer">
							<small class="text-muted">Last Updated on: August, 2022 </small>
						</div>

					</div>

				</div>







				<%
					}
				%>


				<%
					}
				%>




			</div>

		</div>
	</div>







	<%@include file="AllComp/footer.jsp"%>


</body>
</html>