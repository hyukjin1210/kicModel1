<%@page import="model.Member"%>
<%@page import="service.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String msg = "";
String url = "";
String login = (String) session.getAttribute("memberId");
//login 불가이면.
if (login ==null || login.trim().equals("")) {
%>
<script>
alert("로그인이 필요 합니다.")
location.href="<%=request.getContextPath()%>/view/member/loginForm.jsp"
</script>
<%}else { //login ok
	String pass = request.getParameter("pass");
	MemberDao md = new MemberDao();
	Member mb = md.selectOne(login);
	if (mb.getPass().equals(pass)) { //pass 확인 ok
		int num = md.deleteMember(login);
		if (num == 0) { //delete no
			msg = login + "님이 탈퇴시 오류 발생";
			url = request.getContextPath()+"/view/main.jsp";
		} else { //delete ok
			session.invalidate(); //logout
			msg = login + "님의 회원 탈퇴 완료";
			url = request.getContextPath()+"/view/main.jsp";
		}
	} else { //pass no
		msg = "비밀번호가 맞지 않습니다";
		url = request.getContextPath()+"/view/member/deleteForm.jsp";
	}
	
}%>
<script>
alert ("<%=msg%>");
location.href = "<%=url%>";
</script>
</body>
</html>