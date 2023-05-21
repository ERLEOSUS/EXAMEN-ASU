package com.productos.negocios;

public class pruebas {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		String cedula = "2200109052";
		String prov = cedula.substring(0, 2);
		System.out.println(prov);
		String provincia="";
		String[][] provincias = {{"01","AZUAY"},{"02","BOLIVAR"},{"03","CAÑAR"},{"04","CARCHI"},
				{"05","COTOPAXI"},{"06","CHIMBORAZO"},{"07","EL ORO"},{"08","ESMERALDAS"},
				{"09","GUAYAS"},{"10","IMBABURA"},{"11","LOJA"},{"12","LOS RIOS"},{"13","MANABI"},
				{"14","MORONA SANTIAGO"},{"15","NAPO"},{"16","PASTAZA"},{"17","PICHINCHA"},{"18","TUNGURAHUA"},
				{"19","ZAMORA CHINCHIPE"},{"20","GALAPAGOS"},{"21","SUCUMBIOS"},{"22","ORELLANA"},
				{"23","SANTO DOMINGO DE LOS TSACHILAS"},{"24","SANTA ELENA"}};

		for (int x=0; x < provincias.length; x++) {
			for (int y=0; y < provincias[x].length; y++) {
				System.out.println(provincias[x][y]);
				if(provincias[x][y].equals(prov)){
					System.out.println("Resutado: "+provincias[x][y+1]);
					provincia=provincias[x][y+1];
					break;
				}

			}
		}
	}
}