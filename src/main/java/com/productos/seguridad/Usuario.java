package com.productos.seguridad;
import com.productos.datos.*;

import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.io.File;

public class Usuario {
	private String id_us;
	private String Nombre;
	private String Login;
	private String Clave;
	private int perfil;

	public String getId_us() {
		return id_us;
	}
	public void setId_us(String string) {
		this.id_us = string;
	}

	public String getNombre() {
		return Nombre;
	}



	public void setNombre(String nombre) {
		Nombre = nombre;
	}



	public String getLogin() {
		return Login;
	}



	public void setLogin(String login) {
		Login = login;
	}



	public String getClave() {
		return Clave;
	}



	public void setClave(String clave) {
		Clave = clave;
	}



	public int getPerfil() {
		return perfil;
	}



	public void setPerfil(int perfil) {
		this.perfil = perfil;
	}

	public String mostrarUsuarios()
	{
		String sql="SELECT * FROM tb_usuario ORDER BY id_us";
		Conexion con=new Conexion();
		String tabla="<table border=2><th>ID</th><th>Perfil</th><th>Nombre</th><th>Login</th><th>Direccion</th>";
		ResultSet rs=null;
		rs=con.Consulta(sql);
		try {
			while(rs.next())
			{
				tabla+="<tr><td>"+rs.getString(1)+"</td>"
						+ "<td>"+rs.getInt(2)+"</td>"
						+ "<td>"+rs.getString(3)+"</td>"
						+ "<td>"+rs.getString(5)+"</td>"
						+"<td>"+rs.getString(4)+"</td>"
						+ "</td></tr>";
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.print(e.getMessage());
		}
		tabla+="</table>";
		return tabla;
	}

	public boolean verificarUsuario(String nlogin, String nclave)
	{
		boolean respuesta=false;
		String sentencia= "Select * from tb_usuario where login_us='"+nlogin+
				"' and clave_us='"+nclave+"';";
		//System.out.print(sentencia);
		try
		{
			ResultSet rs;
			Conexion clsCon=new Conexion();
			rs=clsCon.Consulta(sentencia);
			if(rs.next())
			{
				respuesta=true;
				this.setLogin(nlogin);
				this.setClave(nclave);
				this.setId_us(rs.getString(1));
				this.setPerfil(rs.getInt(2));
				this.setNombre(rs.getString(3));
			}
			else
			{
				respuesta=false;
				rs.close();
			}
		}
		catch(Exception ex)
		{
			System.out.println( ex.getMessage());
		}
		return respuesta;
	}
	public boolean cambiarContraseña(String nlogin, String nclave,String nueva_clave)
	{
		boolean respuesta=false;
		String sentencia=null;
		if(nclave.equals(nueva_clave)) {
			sentencia= "UPDATE public.tb_usuario set clave_us ='"+nueva_clave+"'where login_us='"+nlogin+"';";
			respuesta=true;	
		}

		System.out.print(sentencia);
		try
		{
			ResultSet rs;
			Conexion clsCon=new Conexion();
			rs=clsCon.Consulta(sentencia);
		}
		catch(Exception ex)
		{
			System.out.println( ex.getMessage());
		}
		return respuesta;
	}
	public boolean agregarUsuario(String id,int per, String nombre,String direccion,String login,String clave)
	{
		boolean respuesta=false;
		String sentencia="";
		sentencia= "INSERT INTO public.tb_usuario("
				+ "	id_us, id_per,nombre_us,direccion_us,login_us,clave_us)"
				+ "	VALUES ('"+id+"',"+per+",'"+nombre+"','"+direccion+"','"+login+"','"+clave+"');";

		try
		{
			String rs;
			Conexion clsCon=new Conexion();
			rs=clsCon.Ejecutar(sentencia);
			if (rs=="Datos insertados") {
				System.out.print("Agregar usuario: "+sentencia);
				respuesta=true;
			}
		}
		catch(Exception ex)
		{
			System.out.println( ex.getMessage());
		}
		return respuesta;
	}
	public String verificarMebresia(String us)
	{
		boolean respuesta=false;
		String sentencia="";
		String estado="";
		sentencia= "SELECT ESTADO_POS FROM PUBLIC.TB_POSTULACION WHERE ID_US='"+us+"'";
		System.out.print(sentencia);
		try
		{
			ResultSet rs;
			Conexion clsCon=new Conexion();
			rs=clsCon.Consulta(sentencia);
			while(rs.next()) {
			estado+=rs.getString(1);
			}
		}
		catch(Exception ex)
		{
			System.out.println( ex.getMessage());
		}
		return "\"Su solicitud esta "+estado+"\"";
	}
	public boolean agregarPostulacion(String id,String us, String fecha,String estado,String hoja_vida,String cedula)
	{
		boolean respuesta=false;
		String sentencia="";
		estado="En proceso";
		sentencia= "INSERT INTO public.tb_postulacion("
				+ "	id_pos, id_us,fecha_pos,estado_pos,hoja_vida,cedula)"
				+ "	VALUES ('"+id+"','"+us+"','"+fecha+"','"+estado+"','"+hoja_vida+"','"+cedula+"');";
		System.out.print(sentencia);
		try
		{
			String rs;
			Conexion clsCon=new Conexion();
			rs=clsCon.Ejecutar(sentencia);
			if (rs=="Datos insertados") {
				System.out.print("exe: "+sentencia);
				respuesta=true;
			}
		}
		catch(Exception ex)
		{
			System.out.println( ex.getMessage());
		}
		return respuesta;
	}
	public String mostrarEventos()
	{
		String sql="SELECT id_evento,nombre_evento,des_evento,fecha FROM tb_evento ORDER BY id_evento";
		Conexion con=new Conexion();
		String tabla="<table border=2><th>ID</><th>Nombre Evento</th><th>Descripcion</th><th>Fecha</th>";
		ResultSet rs=null;
		rs=con.Consulta(sql);
		try {
			while(rs.next())
			{
				tabla+="<tr><td>"+rs.getString(1)+"</td>"
						+ "<td>"+rs.getString(2)+"</td>"
						+ "<td>"+rs.getString(3)+"</td>"
						+ "<td>"+rs.getString(4)+"</td>"
						+ "</td></tr>";
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.print(e.getMessage());
		}
		tabla+="</table>";
		return tabla;
	}
	public String mostrarPostulaciones()
	{
		String sql="SELECT id_pos,fecha_pos,estado_pos FROM tb_postulacion WHERE estado_pos='En proceso' ORDER BY id_pos";
		Conexion con=new Conexion();
		String tabla="<table border=2><th>ID POS</th><th>FECHA</th><th>ESTADO</th>";
		ResultSet rs=null;
		rs=con.Consulta(sql);
		try {
			while(rs.next())
			{
				int numCelda=1;
				tabla+="<tr><td id=\"celda"+numCelda+"\">"+rs.getString(1)+"</td>"
						+ "<td>"+rs.getString(2)+"</td>"
						+ "<td>"+rs.getString(3)+"</td>"
						+ "</td></tr>";
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.print(e.getMessage());
		}
		tabla+="</table>";
		return tabla;
	}
	public int contarFilas(String nombre_tabla )
	{
		int row_count =0;
		String sql="SELECT COUNT(*) AS row_count FROM "+nombre_tabla;
		Conexion con=new Conexion();
		ResultSet rs=null;
		System.out.println(sql);
		rs=con.Consulta(sql);
		try {
			if (rs.next()) {
				row_count = rs.getInt("row_count");
				System.out.println("Número de filas: " + row_count );
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.print(e.getMessage());
		}
		return row_count ;
	}
	public boolean modificarPostulacion(String estado,String id)
	{
		boolean respuesta=false;
		String sentencia="UPDATE tb_postulacion SET estado_pos='"+estado+"' WHERE id_pos ='"+id+"';";
		System.out.print(sentencia);
		try
		{
			String rs;
			Conexion clsCon=new Conexion();
			rs=clsCon.Ejecutar(sentencia);
			if (rs=="Datos insertados") {
				System.out.print("exe: "+sentencia);
				respuesta=true;
			}
		}
		catch(Exception ex)
		{
			System.out.println( ex.getMessage());
		}
		return respuesta;
	}
	public String mostrarActividades() throws IOException{
		String sentencia="SELECT * FROM tb_evento";
		Conexion con=new Conexion();
		ResultSet rs=null;
		rs=con.Consulta(sentencia);
		String resul = "";

		File ruta = new File("C:\\Users\\leosu\\eclipse-workspace\\site_Asus\\src\\main\\webapp\\TEMPORALES"); 
		File tempFile;
		FileOutputStream fos;
		int cont=0;


		try {
			while(rs.next())
			{
				tempFile = new File(ruta+"\\actividad"+cont+".jpg");
				fos = new FileOutputStream(tempFile);
				byte[] foto = rs.getBytes("imagen");
				fos.write(foto); 
				fos.close();
				
				resul+="<div class = \"grid-item\" >"
						+ "<h2>"+ rs.getString(2) + "</h2>"
						+ "<p>" + rs.getString(3) + "</p>"
						+ "</div><div class=\"grid-item\">"
						+ "<img class=\"imagen-redonda\" src='TEMPORALES/actividad"+cont+".jpg' alt='Imagen de la actividad' width='150px' height='300px'>"
						+ "</div>";
				cont++;
			}
			} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		resul+="</table></div>";
		return resul;
	}
	public boolean eliminarEvento(String id)
	{
		boolean respuesta=false;
		String sentencia="DELETE FROM public.tb_evento WHERE id_evento ='"+id+"';";
		System.out.print(sentencia);
		try
		{
			String rs;
			Conexion clsCon=new Conexion();
			rs=clsCon.Ejecutar(sentencia);
			if (rs=="Datos insertados") {
				System.out.print("exe: "+sentencia);
				respuesta=true;
			}
		}
		catch(Exception ex)
		{
			System.out.println( ex.getMessage());
		}
		return respuesta;
	}
}
