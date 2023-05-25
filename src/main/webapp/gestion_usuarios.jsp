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
				<h4>USUARIOS</h4>
				<%
				Usuario user = new Usuario();
				out.println(user.mostrarUsuarios());
				%>
				<h4>AGREGAR USUARIO</h4>
				<form action="agg_user.jsp" method="post" id="formulario">
					<table border="1">
						<tr>
							<td>ID:</td>
							<td><input type="text" name="txtID" required="required" /></td>
						</tr>
						<tr>
							<td>Perfil:</td>
							<td><input type="text" name="txtPerfil" maxlength="25" /></td>
						</tr>
						<tr>
							<td>Nombre:</td>
							<td><input type="text" name="txtNombre" maxlength="25" /></td>
						</tr>
						<tr>
							<td>Direccion:</td>
							<td><input type="text" name="txtDir" maxlength="25" /></td>
						</tr>
						<tr>
							<td>Login:</td>
							<td><input type="text" name="txtLogin" maxlength="25" /></td>
						</tr>
						<tr>
							<td>Contraseña:</td>
							<td><input type="text" name="txtClave" maxlength="25" /></td>
						</tr>
						<tr>
							<td><input type="submit" /></td>
							<td><input type="reset" /></td>
						</tr>
					</table>
				</form>
			</div>
		</section>
	</main>

	<footer> </footer>
</body>
</html>