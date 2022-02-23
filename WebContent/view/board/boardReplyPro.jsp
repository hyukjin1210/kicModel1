<%@page import="model.Board"%>
<%@page import="service.BoardDao"%>
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
request.setCharacterEncoding("UTF-8");
BoardDao bd = new BoardDao();
Board board = new Board();
board.setWriter(request.getParameter("writer"));
board.setPass(request.getParameter("pass"));
board.setSubject(request.getParameter("subject"));
board.setContent(request.getParameter("content"));
board.setFile1("");
board.setIp(request.getLocalAddr());

//게시판별로 작성이 가능하게 해주는 기능
String boardid = (String) session.getAttribute("boardid");
if (boardid==null) boardid = "1";
board.setBoardid(boardid);

int num = Integer.parseInt(request.getParameter("num"));
int ref = Integer.parseInt(request.getParameter("ref"));
int reflevel = Integer.parseInt(request.getParameter("reflevel"));
int refstep = Integer.parseInt(request.getParameter("refstep"));

String msg= "답변 등록시 오류발생";
String url = "boardReplyForm.jsp?num="+num;

bd.refStepAdd(ref, refstep);

board.setNum(bd.nextNum()); //답글도 넘버가 추가됨
board.setRef(ref); //답글을 달 때의 ref는 증감이 없어야함
board.setReflevel(reflevel+1); //기준이되는 글에 +1 함
board.setRefstep(refstep+1); //기준이되는 글에 +1 함

if (bd.insertBoard(board)>0) {
	msg = "답변 등록완료";
	url = "list.jsp";
}
%>
<script>
alert("<%=msg%>")
location.href = "<%=url%>"
</script>
</body>
</html>