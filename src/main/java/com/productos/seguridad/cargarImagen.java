package com.productos.seguridad;
import com.productos.datos.*;
import java.sql.SQLException;
import java.time.format.DateTimeFormatter;
import java.io.IOException;
import java.io.InputStream;
import java.sql.PreparedStatement;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.http.HttpServlet;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/cargarImagen")
@MultipartConfig
public class cargarImagen extends HttpServlet{

	// CARGAR TODOS LOS DATOS 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		InputStream inputStream = null;
		Conexion con=new Conexion();
		PreparedStatement pr=null;

		try {
			// Obtén el archivo seleccionado desde el campo de carga de archivos
			Part filePart = request.getPart("img_evento");
			String fechaString = request.getParameter("fecha");
			DateFormat formato = new SimpleDateFormat("dd-MM-yyyy");
			//String fecha_evento = String.valueOf(f);
			String  id =request.getParameter("id_evento");
			String descripcion = request.getParameter("des_evento");
			String nombre = request.getParameter("nombre_evento");
			String lugar = request.getParameter("lugar_evento");
			// Obtén el nombre del archivo
			String fileName = filePart.getSubmittedFileName();

			// Obtén el contenido del archivo como un InputStream
			inputStream = filePart.getInputStream();

			// Prepara la sentencia SQL para la inserción
			String sql = "INSERT INTO tb_evento (id_evento,nombre_evento,des_evento,fecha,lugar,imagen)"
					+" VALUES(?,?,?,'"+fechaString+"',?,?)";
			pr=con.getConexion().prepareStatement(sql);

			// Lee el contenido de la imagen en un arreglo de bytes
			byte[] imageBytes = inputStream.readAllBytes();
			pr.setString(1, id);
			pr.setString(2, nombre);
			pr.setString(3, descripcion);
			pr.setString(4, lugar);
			pr.setBytes(5, imageBytes);

			if(pr.executeUpdate()==1)
			{
				System.out.println("Insercion Correcta");
			}
			else
			{
				System.out.println("Insercion Incorrecta");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		response.sendRedirect(request.getContextPath() + "/agregar_evento.jsp");
	}
}