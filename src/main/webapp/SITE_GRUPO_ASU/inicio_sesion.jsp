<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Oratorio Padre José Carolo</title>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Open+Sans">
<link rel="stylesheet" href="css/estilos.css">

</head>
<body>

	<header>
		<div>
			<a class=".a_header"> <img src="imagenes/logo_asu.svg"></a> <a
				href="https://www.ups.edu.ec/"><img src="imagenes/logo_ups.png"
				width="100" height="100"></a>
		</div>

		<nav>
			<ul>
				<li><a href="index.jsp" class="letra-grande">INICO</a></li>
				<li><a href="informacion.jsp" class="letra-grande">INFORMACION</a></li>
				<li><a href="eventos.jsp" class="letra-grande">EVENTOS</a></li>
				<li><a href="inicio_sesion.jsp" class="letra-grande">LOGIN</a></li>
			</ul>
		</nav>
	</header>
	<main>
		<section>
			<div class="div_inicio_sesion">
				<h2 class="h2_inicio_sesion">Iniciar sesión</h2>
				<form class="form_inicio_sesion" action="verificar_login.jsp"
					method="post" id="formulario">
					<label class="label_inicio_sesion" for="usuario">Usuario:</label> <input
						type="text" id="usuario" name="usuario"><br> <br>
					<label class="label_inicio_sesion" for="contrasena">Contraseña:</label>
					<input type="password" id="contrasena" name="contrasena"><br>
					<button class="button_inicio_sesion" type="submit">Iniciar</button>
				</form>
				<h1>¿No tienes cuenta?</h1>
				<a href="registro.jsp"><button class="button_inicio_sesion"
						type="button">Registrarse</button></a>
			</div>
			<h1 style="color: red"><c:out value="${param.error}"/></h1>
		</section>
	</main>

	<footer> </footer>
</body>
</html>