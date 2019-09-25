<%@page import="java.util.Arrays"%>
<%@page import="java.lang.Object"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>

<script>
	$(document).ready(function() {
		 $(".unvisual").click(function() {
             $(this).removeClass("unvisual");
         });
		 
		 $("#btnOpen").click(function() {
             $(".unvisual").removeClass("unvisual");
         });
	});
</script>

<style>
	.unvisual {
        opacity: 0;
	}
</style>

<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<style>
* {
	font-family: 'Noto Sans KR', sans-serif;
}
</style>
<title>뽑기 결과</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");

	int peopleNum = Integer.parseInt(request.getParameter("peopleNum"));
	int winNum = Integer.parseInt(request.getParameter("winNum"));
	
	Integer[] arrInt = new Integer[peopleNum];
	Integer[] arrIntDupl = new Integer[peopleNum];
	String[] arrStr = new String[peopleNum];
	
	for(int i = 0; i < peopleNum; i++) {
		arrInt[i] = (int)(Math.random()*100+1);
	}
	
	System.arraycopy(arrInt, 0, arrIntDupl, 0, peopleNum);
	Arrays.sort(arrInt);
	
	System.out.println(Arrays.toString(arrIntDupl));
	System.out.println(Arrays.toString(arrInt));
	
	for(int i = 0, j = winNum; i < peopleNum; i++) {
		if(j > 0) {
			arrStr[Arrays.asList(arrIntDupl).indexOf(arrInt[i])] = "당첨";
		} else {
			arrStr[Arrays.asList(arrIntDupl).indexOf(arrInt[i])] = "-";
		}

		j--;
	}
%>

<div class="jumbotron jumbotron-fluid">
 <div class="container">
   <h3 class="display-4">뽑기 결과</h3>
 </div>
</div>

<div class="container">
	<div class="row">
		<div class="col-md-12" style="text-align: center;">
			<h3><%= winNum %> of <%= peopleNum %></h3>
			<button type="button" id="btnOpen" class="form-control btn btn-outline-success btn-lg btn-block">전체 공개</button>
		</div>
	
		<% for(int i = 0; i < peopleNum; i++) { %>
			<% if(peopleNum % 2 == 0) { %>
				<div class="card" style="width: 25%; text-align: center; margin-top: 30px;">
			<% } else { %>
				<div class="card" style="width: 33%; text-align: center; margin-top: 30px;">
			<% } %>
					<div class="card-header bg-primary text-white">
						<h4><%= i+1 %> 번째</h4>
					</div>
				    <div class="card-body unvisual" style="font-size: 25px;">
				    <%= arrStr[i] %>
				    </div>
	    		</div>
		<% }//for %>
	</div>
</div>
</body>
</html>