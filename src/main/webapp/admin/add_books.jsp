<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin:Add Books</title>
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
						<h4 class="text-center">Add Books</h4>
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

						<form action="../BooksAdd" method="post"
							enctype="multipart/form-data">
							<div class="form-row">
								<div class="form-group col-md-12">
									<label for="inputEmail4">Book Name</label> <input type="text"
										name="bname" class="form-control" id="inputEmail4"
										required="required">
								</div>
								<div class="form-group col-md-12">
									<label for="inputPassword4">Author's name</label> <input
										type="text" name="author" class="form-control"
										id="inputPassword4" required="required">
								</div>
								<div class="form-group col-md-12">
									<label for="inputPassword4">Price</label> <input type="number"
										name="price" class="form-control" id="inputPassword4"
										required="required">
								</div>

							</div>
							<div class="form-group">
								<select class="custom-select" name="btype" required>
									<option value="">Book Categories</option>
									<option value="Entertainment">Entertainment</option>
									<option value="Educational">Educational</option>
									

								</select>
								<div class="invalid-feedback">Example invalid custom
									select feedback</div>
							</div>
							<div class="form-group">
								<select class="custom-select" name="bstatus" required>
									<option value="">Book Status</option>
									<option value="Active">Active</option>
									<option value="Inactive">Inactive</option>

								</select>
								<div class="invalid-feedback">Example invalid custom
									select feedback</div>
							</div>

							<div class="custom-file">
								<input type="file" class="custom-file-input" name="bimg"
									id="validatedCustomFile" required> <label
									class="custom-file-label" for="validatedCustomFile">Upload
									Photo...</label>
								<div class="invalid-feedback">Example invalid custom file
									feedback</div>
							</div>
							<br> <br>
							<div class="text-center ">
								<button type="submit" class="btn btn-primary">Add</button>
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