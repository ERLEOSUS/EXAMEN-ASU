<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" session="true"
	import="com.productos.seguridad.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Oratorio Padre José Carolo</title>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Open+Sans">
<link rel="stylesheet" href="estilos.css">

</head>
<body>

	<header>
		<div>
			<a class=".a_header"> <img src="img/logo_asu.svg"></a> <a
				href="https://www.ups.edu.ec/"><img src="img/logo_ups.png"
				width="100" height="100"></a>
		</div>
	</header>
	<main>
		<section>
			<div class="div_inicio_sesion">
				<%
				HttpSession sesion = request.getSession();
				String login_us,id_us = "";
				out.println("<h1>Usuario:" + sesion.getAttribute("login_us"));
				out.println("<h1>ID:" + sesion.getAttribute("id_us"));
				%>

				<h2 >Cambiar constrase&ntildea</h2>
				<form action="verificar_nueva_contraseña.jsp" method="post"
					id="formulario">
					<label for="contraseña">Nueva contrase&ntildea:</label> 
					<input type="text" id="usuario" name="contraseña"><br> <br> 
					<label class="label_inicio_sesion" for="conf_contraseña"> Confirmar contrase&ntildea:</label> 
					<input type="password" id="contrasena"name="conf_contraseña"><br>
					<button type="submit">Cambiar contraseña</button>
				</form>
				<a href="menu.jsp">Volver</a>
			</div>
			<h1 style="color: red">
				<c:out value="${param.error}" />
			</h1>
		</section>
	</main>

	<footer> </footer>
</body>
</html>