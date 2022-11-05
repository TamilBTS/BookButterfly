<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.google.gson.Gson"%>
<%@ page import="com.google.gson.JsonObject"%>
<%@page import="com.DAO.BookDaoImp"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.entity.BookDetails"%>
<%@page import="java.util.*"%>
 <%	BookDaoImp dao=new BookDaoImp(DBConnect.getConnection());

List<BookDetails> list1=dao.salesreport();
List<Map<Object,Object>> list = new ArrayList<Map<Object,Object>>();
Gson gsonObj = new Gson();
Map<Object,Object> map = null;
for(BookDetails b:list1){
%>
<%
if(b.getTotalsales()>0){

map = new HashMap<Object,Object>(); map.put("label", b.getBookName()); map.put("y", b.getTotalsales()); list.add(map);

}

}
String dataPoints = gsonObj.toJson(list);
%>
 
<!DOCTYPE HTML>
<html>
<head>
<%@include file="AllCSS.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
window.onload = function() { 
 
var chart = new CanvasJS.Chart("chartContainer", {
	theme: "light2", // "light1", "dark1", "dark2"
	exportEnabled: true,
	animationEnabled: true,
	title: {
		text: "Book Sales"
	},
	data: [{
		type: "pie",
		toolTipContent: "<b>{label}</b>: {y}%",
		indexLabelFontSize: 16,
		indexLabel: "{label} - {y}%",
		dataPoints: <%out.print(dataPoints);%>
	}]
});
chart.render();
 
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
<div id="chartContainer" style="height: 370px; width: 100%;"></div>
 <script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
</body>
</html>      