<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function inputChk(f) {
	if (f.pass.value=="") {
		alert("비밀번호를 입력해주세요")
		f.pass.focus()
		return false;
	}
	if (f.newpass.value=="") {
		alert("새로운 비밀번호를 입력해주세요")
		f.newpass.focus()
		return false;
	}
	if (f.newpass.value == f.pass.value) {
		alert("같은 비밀번호는 사용할 수 없습니다")
		f.newpass2.value = ""
		f.newpass.focus()
		return false;
	}
	if(f.newpass.value != f.newpass2.value) {
		alert("비밀번호가 일치하지 않습니다")
		f.newpass2.value = ""
		f.newpass2.focus()
		return false;
	}
	return true;
}
</script>
</head>
<body>
<%
String login = (String) session.getAttribute("memberId");
//login 불가이면.
if (login ==null || login.trim().equals("")) {
%>
<script>
alert("로그인이 필요 합니다.")
location.href="<%=request.getContextPath()%>/view/member/loginForm.jsp"
</script>
<%}else {%>
<hr>
	<div class="container">
		<h2   id="center">비밀번호 변경</h2>
		<form action="<%=request.getContextPath() %>/view/member/passwordPro.jsp" 
		method="post" name="f" onsubmit="return inputChk(this)">
		<div class="form-group">
			<label for="usr">ID:</label> 
			
			<input type="text" class="form-control" name="id" readonly = "readonly" value="<%=login %>"> 
			<label for="pwd">현재 비밀번호:</label>
			<input type="password" class="form-control" name="pass">
			
			<label for="pwd">변경 비밀번호:</label>
			<input type="password" class="form-control" name="newpass">
			
			<label for="pwd">변경 비밀번호 확인:</label>
			<input type="password" class="form-control" name="newpass2">
		</div>
		<div id="center" style="padding: 3px;">
			<button type="submit" class="btn btn-dark">비밀번호 변경</button>
		</div>
		</form>
	</div>
<%} %>
</body>
</html>