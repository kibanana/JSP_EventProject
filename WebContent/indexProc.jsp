<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>뽑기 결과</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");

	int peopleNum = Integer.parseInt(request.getParameter("peopleNum"));
	int winNum = Integer.parseInt(request.getParameter("winNum"));
%>

<div class="jumbotron jumbotron-fluid">
 <div class="container">
   <h3 class="display-4">뽑기 결과</h3>
 </div>
</div>

<%= peopleNum %>
<%= winNum %>
</body>
</html>