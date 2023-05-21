package com.productos.seguridad;
import com.productos.datos.*;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;

public class Usuario {
	private int id_us;
	private String Nombre;
	private String Login;
	private String Clave;
	private int perfil;

	public int getId_us() {
		return id_us;
	}
	public void setId_us(int id_us) {
		this.id_us = id_us;
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
				tabla+="<tr><td>"+rs.getInt(1)+"</td>"
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
	public boolean agregarProducto(int id,int cat, String descripcion,double precio,int cant)
	{
		boolean respuesta=false;
		String sentencia="";
		sentencia= "INSERT INTO public.tb_producto("
				+ "	id_pr, id_cat, descripcion_pr, precio_pr, cantidad_pr)"
				+ "	VALUES ("+id+","+cat+",'"+descripcion+"',"+precio+","+cant+");";
		System.out.print(sentencia);
		try
		{
			ResultSet rs;
			Conexion clsCon=new Conexion();
			rs=clsCon.Consulta(sentencia);
			respuesta=true;
		}
		catch(Exception ex)
		{
			System.out.println( ex.getMessage());
		}
		return respuesta;
	}
	public boolean cambiarPrecio(int id,double nuevo_precio)
	{
		boolean respuesta=false;
		String sentencia= "UPDATE public.tb_producto set precio_pr ='"+nuevo_precio+"'where id_pr='"+id+"';";
		System.out.print(sentencia);
		try
		{
			ResultSet rs;
			Conexion clsCon=new Conexion();
			rs=clsCon.Consulta(sentencia);
			respuesta=true;
		}
		catch(Exception ex)
		{
			System.out.println( ex.getMessage());
		}
		return respuesta;
	}
	public boolean agregarUsuario(int id,int per, String nombre,String direccion,String login,String clave)
	{
		boolean respuesta=false;
		String sentencia="";
		sentencia= "INSERT INTO public.tb_usuario("
				+ "	id_us, id_per,nombre_us,direccion_us,login_us,clave_us)"
				+ "	VALUES ("+id+","+per+",'"+nombre+"','"+direccion+"','"+login+"','"+clave+"');";
		System.out.print(sentencia);
		try
		{
			ResultSet rs;
			Conexion clsCon=new Conexion();
			rs=clsCon.Consulta(sentencia);
			respuesta=true;
		}
		catch(Exception ex)
		{
			System.out.println( ex.getMessage());
		}
		return respuesta;
	}
	public boolean agregarPostulacion(String id,int us, Date fecha,String estado,String hoja_vida,String cedula)
	{
		boolean respuesta=false;
		String sentencia="";
		estado="En proceso";
		sentencia= "INSERT INTO public.tb_postulacion("
				+ "	id_pos, id_us,fecha_pos,estado_pos,hoja_vida,cedula)"
				+ "	VALUES ('"+id+"',"+us+",'"+fecha+"','"+estado+"','"+hoja_vida+"','"+cedula+"');";
		System.out.print(sentencia);
		try
		{
			ResultSet rs;
			Conexion clsCon=new Conexion();
			rs=clsCon.Consulta(sentencia);
			respuesta=true;
		}
		catch(Exception ex)
		{
			System.out.println( ex.getMessage());
		}
		return respuesta;
	}
	public String mostrarEventos()
	{
		String sql="SELECT nombre_evento,des_evento,fecha FROM tb_evento ORDER BY id_evento";
		Conexion con=new Conexion();
		String tabla="<table border=2><th>Nombre Evento</th><th>Descripcion</th><th>Fecha</th>";
		ResultSet rs=null;
		rs=con.Consulta(sql);
		try {
			while(rs.next())
			{
				tabla+="<tr><td>"+rs.getString(1)+"</td>"
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
	public String mostrarPostulaciones()
	{
		String sql="SELECT id_pos,fecha_pos,estado_pos FROM tb_postulacion ORDER BY id_pos";
		Conexion con=new Conexion();
		String tabla="<table border=2><th>ID POS</th><th>FECHA</th><th>ESTADO</th>";
		ResultSet rs=null;
		rs=con.Consulta(sql);
		try {
			while(rs.next())
			{
				tabla+="<tr><td>"+rs.getString(1)+"</td>"
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

}
