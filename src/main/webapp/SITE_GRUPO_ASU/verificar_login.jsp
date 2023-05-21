<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1" session="true" 
	import="com.productos.seguridad.*"%>
<%
Usuario usuario = new Usuario();
String nlogin = request.getParameter("usuario");
String nclave = request.getParameter("contrasena");
HttpSession sesion = request.getSession(); //Se crea la variable de sesión
boolean respuesta = usuario.verificarUsuario(nlogin, nclave);
if (respuesta) {
	sesion.setAttribute("id_us", usuario.getId_us());
	sesion.setAttribute("login_us", usuario.getLogin());
	sesion.setAttribute("usuario", usuario.getNombre()); //Se añade atributos
	sesion.setAttribute("perfil", usuario.getPerfil()); //Se añade atributos
	response.sendRedirect("menu.jsp"); //Se redirecciona a una página específica
} else {
%>
<jsp:forward page="inicio_sesion.jsp">
	<jsp:param name="error"
		value="Datos incorrectos.Vuelva a intentarlo." />
</jsp:forward>
<%
}
%>