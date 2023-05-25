<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" session="true"
	import="com.productos.seguridad.*,java.util.Date"%>
<%
Usuario usuario = new Usuario();
Date fechaActual = new Date();
String nombre = request.getParameter("txtNombre");
String cedula = request.getParameter("txtCedula");
String dir = request.getParameter("txtDir");
String login = request.getParameter("login");
String clave = request.getParameter("txtClave");

HttpSession sesion = request.getSession(); //Se crea la variable de sesión
String id_us = "";
String estado = "";
String id = "u-" + String.valueOf(usuario.contarFilas("tb_usuario") + 1);
boolean respuesta = usuario.agregarUsuario(id, 2, nombre, dir, login, clave);

if (respuesta) {
	sesion.setAttribute("id_us", usuario.getId_us());
	sesion.setAttribute("login_us", usuario.getLogin());
	sesion.setAttribute("usuario", usuario.getNombre()); //Se añade atributos
	sesion.setAttribute("perfil", usuario.getPerfil()); //Se añade atributos
%>
<jsp:forward page="inicio_sesion.jsp">
	<jsp:param name="confirmacion" value="Usuario registrado." />
</jsp:forward>
<%
response.sendRedirect("inicio_sesion.jsp"); //Se redirecciona a una página específica
} else {
%>
<jsp:forward page="registro.jsp">
	<jsp:param name="error_registro"
		value="No se pudo registrar. Intentelo de nuevo." />
</jsp:forward>
<%
}
%>