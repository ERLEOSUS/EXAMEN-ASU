<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.productos.seguridad.*"%>
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

		<nav>
			<ul>
				<li><a href="index.jsp" class="letra-grande">INICIO</a></li>
				<li><a href="informacion.jsp" class="letra-grande">INFORMACION</a></li>
				<li><a href="eventos.jsp" class="letra-grande">EVENTOS</a></li>
				<li><a href="inicio_sesion.jsp" class="letra-grande">LOGIN</a></li>
			</ul>
		</nav>
	</header>
	<main>
		<section>
			<div class="grid-container">
				<%
				Usuario user = new Usuario();
				out.println(user.mostrarActividades());
				%>
			</div>
		</section>
	</main>
</body>
	<footer> 
	 <div class="footer-icons">
    <img class="icon" style="width: 80px; height: 80px; margin: 0 10px;" src="img/facebook.png" alt="Icono 1">
    <img class="icon" style="width: 80px; height: 80px; margin: 0 10px;" src="img/instagram.png" alt="Icono 2">
    <img class="icon" style="width: 80px; height: 80px; margin: 0 10px;" src="img/whatsapp.png" alt="Icono 3">
  	</div>
</footer>
</html>