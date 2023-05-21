package com.productos.negocios;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.productos.datos.*;

public class Categoria {

	private int id_cat;
	private String desc_cat;

	public int getId_cat() {
		return id_cat;
	}

	public void setId_cat(int id_cat) {
		this.id_cat = id_cat;
	}

	public String getDesc_cat() {
		return desc_cat;
	}

	public void setDesc_cat(String desc_cat) {
		this.desc_cat = desc_cat;
	}

	public String mostrarCategoria()
	{
		String combo="<select name=cmbCategoria>";
		String sql="SELECT * FROM tb_categoria";
		ResultSet rs=null;
		Conexion con=new Conexion();
		try
		{
			rs=con.Consulta(sql);
			while(rs.next())
			{
				combo+="<option value="+rs.getInt(1)+ ">"+rs.getString(2)+"</option>";
			}
			combo+="</select>";
		}
		catch(SQLException e)
		{
			System.out.print(e.getMessage());
		}
		return combo;
	}


}
