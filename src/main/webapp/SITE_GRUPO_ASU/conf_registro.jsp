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
String cv = request.getParameter("fileCv");
HttpSession sesion = request.getSession(); //Se crea la variable de sesión
String id_us ="";
String estado="";
int nid_us = Integer.parseInt(sesion.getAttribute("id_us").toString()); 
boolean respuesta = usuario.agregarPostulacion("p-001", nid_us,fechaActual,estado,cv,cedula);
if (respuesta) {
	sesion.setAttribute("id_us", usuario.getId_us());
	sesion.setAttribute("login_us", usuario.getLogin());
	sesion.setAttribute("usuario", usuario.getNombre()); //Se añade atributos
	sesion.setAttribute("perfil", usuario.getPerfil()); //Se añade atributos
	response.sendRedirect("registro.jsp"); //Se redirecciona a una página específica
} else {
%>
<jsp:forward page="registro.jsp">
	<jsp:param name="error"
		value="Datos incorrectos.<br>Vuelva a intentarlo." />
</jsp:forward>
<%
}
%>