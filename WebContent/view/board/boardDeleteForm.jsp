<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
int num = Integer.parseInt(request.getParameter("num"));
%>
<body>
<hr>
	<!-- login start -->
	<div class="container">
		<h2   id="center">게시물 삭제</h2>
		<form action="boardDletePro.jsp" method="post">
		<div class="form-group">
			<input type="hidden" name="num" value="<%=num%>"> 
			<label>Password:</label>
			<input type="password" class="form-control" name="pass">
		</div>
		<div id="center" style="padding: 3px;">
			<button type="submit" class="btn btn-dark">삭 제</button>
		</div>
		</form>
	</div>
</body>
</html>