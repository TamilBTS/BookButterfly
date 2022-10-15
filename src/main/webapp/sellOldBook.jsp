<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>User:Sell Old Book</title>
<%@include file="AllComp/AllCSS.jsp"%>
<style type="text/css">
html, body {
	margin: 0px;
	padding: 0px;
	overflow-x: hidden;
}
</style>
</head>
<body style="background-color: #fffafd;">
	<%@include file="AllComp/navbar.jsp"%>
	<%
		response.setHeader("Cache-Control", "no-cache,no-store,must-validate");
	%>

	<c:if test="${empty userobj }">
		<c:redirect url="login.jsp" />
	</c:if>
	<div class="container">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<h4 class="text-center">Sell Books</h4>
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

						<form action="AddOldBook" method="post"
							enctype="multipart/form-data">
							<div class="form-row">
								<c:if test=""></c:if>
								<input type="hidden" value="${userobj.email}" name="useremail">
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

									<option value="Old Book">Old</option>

								</select>
								<div class="invalid-feedback">Example invalid custom
									select feedback</div>
							</div>
							<div class="form-group">
								<select class="custom-select" name="bstatus" required>
									<option value="">Book Status</option>
									<option value="Active">Active</option>
									

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

</body>
</html>