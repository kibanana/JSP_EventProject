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

<script>
	function chk_eventForm() {
		let frm = document.eventForm;
		let message = document.getElementById("failMessage");
		
		if(!frm.peopleNum.value) {
			frm.peopleNum.focus();
			message.innerHTML = "사람 수를 입력해주세요";
		} else if(!frm.winNum.value) {
			frm.winNum.focus();
			message.innerHTML = "뽑기 수를 입력해주세요";
		} else {
			frm.submit();
		}
	}
	
	function changeMax() {
		document.getElementById("winNum").setAttribute("max", parseInt(document.getElementById("peopleNum").value)-1);
	}
</script>

<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<style>
* {
	font-family: 'Noto Sans KR', sans-serif;
}
</style>
<title>뽑기</title>
</head>
<body>
<div class="jumbotron jumbotron-fluid">
 <div class="container">
   <h3 class="display-4">뽑기</h3>
   <p>뽑기를 진행하기 전 사람마다 번호를 정해주세요</p>
 </div>
</div>
		
<div class="container">
	<div class="row">
		
		<div class="col-md-8 col-md-offset-2">
			<form action="indexProc.jsp" method="post" name="eventForm">
				<div class="form-group">
					<label>
						사람 수
						<input type="number" id="peopleNum" name="peopleNum" min="0" max="100" onChange="changeMax()" class="form-control">
					</label>
					
					<label>
						뽑기 수
						<input type="number" id="winNum" name="winNum" min="0" max="100" class="form-control  form-inline">
					</label>
				</div>
				
				<div>
					<span id="failMessage" style="color: red;"></span>
				</div>
				
				<button type="button" onClick="chk_eventForm()" class="form-control btn btn-outline-success btn-lg btn-block">뽑기</button>
				<input type="reset" value="양식 초기화" class="form-control btn btn-outline-warning btn-lg btn-block">
			</form>
		</div>
	</div>
</div>
</body>
</html>