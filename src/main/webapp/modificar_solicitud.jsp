<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" session="true"
	import="com.productos.seguridad.*"%>
<%
Usuario usuario = new Usuario();

String estado = request.getParameter("decision");
String id_pos=request.getParameter("postulacion_id");

boolean respuesta = usuario.modificarPostulacion(estado, id_pos);
if (respuesta) {
%>
<jsp:forward page="postulaciones.jsp">
	<jsp:param name="confirmacion" value="Solicitud procesada." />
</jsp:forward>
<%
response.sendRedirect("postulaciones.jsp"); //Se redirecciona a una página específica
} else {
%>
<jsp:forward page="postulaciones.jsp">
	<jsp:param name="error_pos" value="No se pudo procesar la solicitud." />
</jsp:forward>
<%
}
%>