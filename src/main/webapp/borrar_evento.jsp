<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" session="true"
	import="com.productos.seguridad.*"%>
<%
Usuario usuario = new Usuario();

String id_evento=request.getParameter("id_evento");

boolean respuesta = usuario.eliminarEvento(id_evento);
if (respuesta) {
%>
<jsp:forward page="eliminar_evento.jsp">
	<jsp:param name="confirmacion" value="Evento eliminado." />
</jsp:forward>
<%
response.sendRedirect("eliminar_evento.jsp"); //Se redirecciona a una página específica
} else {
%>
<jsp:forward page="elimnar_evento.jsp">
	<jsp:param name="error" value="No se pudo procesar la solicitud." />
</jsp:forward>
<%
}
%>