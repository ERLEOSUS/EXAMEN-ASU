<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.productos.seguridad.*"%>
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
		<div class="agrupar"><h3>POSTULAR</h3>
			<h2>Forma parte de nuestra familia :)</h2>
			<h1 style="color: green">
				<c:out value="${param.estado}" />
			</h1>
			<form action="conf_postulacion.jsp" style="display: grid; gap: 10px; justify-content: center;" method="post" id="formulario">
				<table border=1>
					<tr>
						<td>Cedula:</td>
						<td><input type="text" name="txtCed" /></td>
					</tr>
					<tr>
						<td>Foto:</td>
						<td><input type="file" name="fileFoto"
							accept=".jpg, .jpeg, .png" /></td>
					</tr>
					<tr>
						<td>Curriculum:</td>
						<td><input type="file" name="fleCurriculum" accept=".pdf" /></td>
					</tr>
					<tr>
						<td><input type="submit" /></td>
						<td><input type="reset" /></td>
					</tr>
				</table>
			</form>
			<h1 style="color: red">
				<c:out value="${param.error_solicitud}" />
			</h1>
			<h1 style="color: green">
				<c:out value="${param.confirmacion}" />
			</h1>
			<a href="menu.jsp">Volver</a></div>
			
		</section>
	</main>

	<footer> </footer>
</body>
</html>