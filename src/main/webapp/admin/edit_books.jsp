<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<%@page import="com.DAO.BookDaoImp"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.entity.BookDetails"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin:Edit Books</title>
<%@include file="AllCSS.jsp"%>
</head>
<body style="background-color: #fffafd;">
	<%@include file="navbar.jsp"%>
	<%
		response.setHeader("Cache-Control", "no-cache,no-store,must-validate");
	%>
	<c:if test="${empty userobj }">
		<c:redirect url="../login.jsp" />
	</c:if>
	<div class="container">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<h4 class="text-center">Edit Books</h4>


						<%
							Integer id = Integer.parseInt(request.getParameter("id"));
							BookDaoImp dao = new BookDaoImp(DBConnect.getConnection());
							BookDetails b = dao.getBooksById(id);
						%>


						<form action="../EditBooks" method="post">
							<input type="hidden" name="id" value=<%=b.getBookId()%>>
							<div class="form-row">
								<div class="form-group col-md-12">
									<label for="inputEmail4">Book Name</label> <input type="text"
										name="bname" class="form-control" id="inputEmail4"
										required="required" value="<%=b.getBookName()%>">
								</div>
								<div class="form-group col-md-12">
									<label for="inputPassword4">Author's name</label> <input
										type="text" name="author" class="form-control"
										id="inputPassword4" required="required"
										value="<%=b.getAuthor()%>">
								</div>
								<div class="form-group col-md-12">
									<label for="inputPassword4">Price</label> <input type="number"
										name="price" class="form-control" id="inputPassword4"
										required="required" value="<%=b.getPrice()%>">
								</div>
								<div class="form-group col-md-12">
									<label for="inputPassword4">Stock</label> <input type="number"
										name="stock" class="form-control" id="inputPassword4"
										required="required" value="<%=b.getStock()%>">
								</div>

							</div>


							<div class="form-group">
								<select class="custom-select" name="bstatus" required>
									<%
										if ("Active".equals(b.getStatus())) {
									%>
									<option value="Active">Active</option>
									<option value="Inactive">Inactive</option>
									<%
										} else {
									%>
									<option value="Inactive">Inactive</option>
									<option value="Active">Active</option>
									<%
										}
									%>

								</select>
							</div>


							<br> <br>
							<div class="text-center ">
								<button type="submit" class="btn btn-primary">Update</button>
							</div>
						</form>




					</div>
				</div>

			</div>

		</div>

	</div>
	<div style="margin-top: 50px;">
		<%@include file="footer.jsp"%>
	</div>
</body>
</html>