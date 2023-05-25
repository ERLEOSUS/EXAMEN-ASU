<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" session="true"
	import="com.productos.seguridad.*"%>
<%
Usuario usuario = new Usuario();

String nclave = request.getParameter("contraseña");
String v_contraseña=request.getParameter("conf_contraseña");
HttpSession sesion = request.getSession(); //Se crea la variable de sesión
String login_us ="";
String nlogin_us = String.valueOf(sesion.getAttribute("login_us"));
boolean respuesta = usuario.cambiarContraseña(nlogin_us, nclave, v_contraseña);
if (respuesta) {
	response.sendRedirect("cerrar_sesion.jsp"); //Se redirecciona a una página específica
} else {
%>
<jsp:forward page="cambiar_contraseña.jsp">
	<jsp:param name="error"
		value="No se pudo cambiar la contrasenia.Vuelva a intentarlo." />
</jsp:forward>
<%
}
%>