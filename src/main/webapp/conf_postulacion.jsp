<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" session="true"
	import="com.productos.seguridad.*,java.time.LocalDate, java.time.format.DateTimeFormatter"%>
<%
Usuario usuario = new Usuario();
LocalDate fechaActual = LocalDate.now();
DateTimeFormatter formato = DateTimeFormatter.ofPattern("dd/MM/yyyy");
String fechaFormateada = fechaActual.format(formato);
String cedula = request.getParameter("txtCed");
String foto = request.getParameter("fileFoto");
String cv = request.getParameter("fleCurriculum");
HttpSession sesion = request.getSession(); //Se crea la variable de sesión
String id_us = "";
String id = "p-" + String.valueOf(usuario.contarFilas("tb_postulacion") + 1);
boolean respuesta = usuario.agregarPostulacion(id, String.valueOf(sesion.getAttribute("id_us")),
		fechaFormateada, "En proceso", cv, cedula);

if (respuesta) {
%>
<jsp:forward page="postular.jsp">
	<jsp:param name="confirmacion" value="Solicitud enviada." />
</jsp:forward>
<%
response.sendRedirect("postular.jsp"); //Se redirecciona a una página específica
} else {
%>
<jsp:forward page="postular.jsp">
	<jsp:param name="error_solicitud" value="No se pudo enviar su solicitud." />
</jsp:forward>
<%
}
%>