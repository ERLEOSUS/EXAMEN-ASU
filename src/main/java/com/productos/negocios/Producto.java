package com.productos.negocios;
import com.productos.datos.*;

import java.sql.ResultSet;
import java.sql.SQLException;

public class Producto {
	Conexion c= new Conexion();
	private int id;
	private int idcat;
	private String nombre;
	private int cantidad;
	private int precio;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getIdcat() {
		return idcat;
	}
	public void setIdcat(int idcat) {
		this.idcat = idcat;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public int getCantidad() {
		return cantidad;
	}
	public void setCantidad(int cantidad) {
		this.cantidad = cantidad;
	}
	public int getPrecio() {
		return precio;
	}
	public void setPrecio(int precio) {
		this.precio = precio;
	}
	public String consultarTodo()
	{
		String sql="SELECT * FROM tb_producto ORDER BY id_pr";
		Conexion con=new Conexion();
		String tabla="<table border=2><th>ID</th><th>Producto</th><th>Precio</th><th>Cantidad</th>";
		ResultSet rs=null;
		rs=con.Consulta(sql);
		try {
			while(rs.next())
			{
				tabla+="<tr><td>"+rs.getInt(1)+"</td>"
						+ "<td>"+rs.getString(3)+"</td>"
						+ "<td>"+rs.getDouble(4)+"</td>"
						+ "<td>"+rs.getInt(5)+"</td>"
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
	public String buscarProductoCategoria(int cat)
	{
		String sentencia="SELECT descripcion_pr, precio_pr FROM tb_producto WHERE id_cat="+cat;
		Conexion con=new Conexion();
		ResultSet rs=null;
		String resultado="<table border=3>";
		try
		{
			rs=con.Consulta(sentencia);
			while(rs.next())
			{
				resultado+="<tr><td>"+ rs.getString(1)+"</td>"
						+ "<td>"+rs.getDouble(2)+"</td></tr>";
			}
			resultado+="</table>";
		}
		catch(SQLException e)
		{
			System.out.print(e.getMessage());
		}
		//System.out.print(resultado);
		return resultado;
	}
	public String buscarProductoCategoriaImg(int cat)
	{
		String sentencia="SELECT descripcion_pr, precio_pr,imagen FROM tb_producto WHERE id_cat="+cat;
		Conexion con=new Conexion();
		ResultSet rs=null;
		String resultado="";
		try
		{
			rs=con.Consulta(sentencia);
			while(rs.next())
			{
				resultado+="<div class=\"pro\"><img src=\""+rs.getString(3)+"\" alt=\"producto1\"><br><h3>"+
							rs.getString(1)+"</h3><br><p>$"+rs.getDouble(2)+"</p></div>";
			}
		}
		catch(SQLException e)
		{
			System.out.print(e.getMessage());
		}
		//System.out.println(resultado);
		return resultado;
	}
	public String consultarTodoImg()
	{
		String sql="SELECT descripcion_pr, precio_pr,imagen FROM tb_producto";
		Conexion con=new Conexion();
		String resultado="";
		ResultSet rs=null;
		rs=con.Consulta(sql);
		try {
			while(rs.next())
			{
				resultado+="<div class=\"pro\"><img src=\""+rs.getString(3)+"\" alt=\"producto1\"><br><h3>"+
						rs.getString(1)+"</h3><br><p>$"+rs.getDouble(2)+"</p></div>";
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.print(e.getMessage());
		}
		return resultado;
	}
}
