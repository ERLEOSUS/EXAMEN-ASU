<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
			<a class=".a_header"> <img src="img/logo_asu.svg"></a> <a
				href="https://www.ups.edu.ec/"><img src="img/logo_ups.png"
				width="100" height="100"></a>
		</div>
	</header>
	<main>
		<section>
			<H3>REGISTRO</H3>
			<form action="conf_registro.jsp" method="post" id="formulario">
				<table border=1>
					<tr>
						<td>Nombre:</td>
						<td><input type="text" name="txtNombre" required="required" /></td>
					</tr>
					<tr>
						<td>Direccion:</td>
						<td><input type="text" name="txtDir" value="Sur" />
					</tr>
					<tr>
						<td>Mes y año de nacimiento:</td>
						<td><input type="date" name="fecha" /></td>
					</tr>
					<tr>
						<td>Correo electronico:</td>
						<td><input type="text" name="login" /></td>
					</tr>
					<tr>
						<td>Contraseña:</td>
						<td><input type="password" name="txtClave" /></td>
					</tr>
					<tr>
						<td><input type="submit" /></td>
						<td><input type="reset" /></td>
					</tr>
				</table>
			</form>
			<h1 style="color: red"><c:out value="${param.error_registro}"/></h1>
			<a href="inicio_sesion.jsp">Volver</a>
		</section>
	</main>

	<footer> </footer>
</body>
</html>