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
			<div class="agrupar">
				<%
				String usuario = "";
				HttpSession sesion = request.getSession();
				if (sesion.getAttribute("usuario") == null) {
				%>
				<jsp:forward page="inicio_sesion.jsp">
					<jsp:param name="error" value="Debe registrarse en el sistema." />
				</jsp:forward>
				<%
				} else {
				out.print((String) sesion.getAttribute("usuario"));
				usuario = (String) sesion.getAttribute("usuario");
				int perfil = (Integer) sesion.getAttribute("perfil");
				%>
				<h1>Sitio Privado Asu Oratorio Padre José Carolo</h1>

				<h4>
					Bienvenido
					<%
				out.print(usuario);
				%>
				</h4>
				<%
				Pagina pag = new Pagina();
				String menu = pag.mostrarMenu(perfil);
				out.print("Menu" + menu);
				}
				%>
				<h4>POSTULACIONES</h4>
				<%
				Usuario user = new Usuario();
				out.println(user.mostrarPostulaciones());
				%>
				<h4>ACEPTACION POSTULACIONES</h4>
				<form action="modificar_solicitud.jsp">
					<label for="postulacion_id">ID de la Postulación:</label> <input
						type="text" id="postulacion_id" name="postulacion_id" required>

					<label for="decision">Decisión:</label> <select id="decision"
						name="decision">
						<option value="Aceptada">Aceptada</option>
						<option value="Rechazada">Rechazada</option>
					</select>

					<button type="submit">Enviar</button>
				</form>
				<h1 style="color: red">
					<c:out value="${param.error_pos}" />
				</h1>
				<h1 style="color: green">
					<c:out value="${param.confirmacion}" />
				</h1>
			</div>
		</section>
	</main>

	<footer> </footer>
</body>
</html>