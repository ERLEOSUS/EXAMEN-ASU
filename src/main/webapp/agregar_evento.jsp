<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" session="true"
	import="com.productos.seguridad.*"%>
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
				<h4>EVENTOS</h4>
				<%
				Usuario user = new Usuario();
				out.println(user.mostrarEventos());
				%>
				<h4>AGREGAR EVENTO</h4> 
					<form class="fromularios_users" action="cargarImagen" style="display: grid; gap: 10px; justify-content: center;" method="post" enctype="multipart/form-data" id="tar-act">
						<label for="id_evento">ID:</label> 
						<input type="text" id="id_evento" name="id_evento" required> 
						<label for="nombre_evento">Nombre evento:</label> 
						<input type="text" id="nombre_evento" name="nombre_evento" required>
						<label for="des_evento">Descripción:</label>
						<textarea id="des_evento" name="des_evento" required></textarea> 
						<label for="lugar_evento">Lugar:</label> 
						<input type="text" id="lugar_evento" name="lugar_evento" required> 
						<label for="fecha">Fecha:</label>
						<input type="date" id="fecha" name="fecha" required> 
						<label for="img_evento">Imagen:</label> 
						<input type="file" id="img_vento" name="img_evento" accept="image/*" required>
						<input type="submit" />
					</form>
			</div>
		</section>
	</main>

	<footer> </footer>
</body>
</html>