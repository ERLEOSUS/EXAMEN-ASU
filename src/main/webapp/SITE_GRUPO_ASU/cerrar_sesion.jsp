<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ page session="true"%>
	<%
HttpSession sesionOk = request.getSession();
sesionOk.invalidate();
%>
	<jsp:forward page="inicio_sesion.jsp" />
</body>
</html>