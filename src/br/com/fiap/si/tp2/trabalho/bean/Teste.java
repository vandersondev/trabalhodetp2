package br.com.fiap.si.tp2.trabalho.bean;

import java.util.Date;


public class Teste {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		String data = "2013-06-13";
		String dataSlice[] = data.split("-");
		
		Date teste = new Date();
		teste.setDate(Integer.parseInt(dataSlice[2]));
		teste.setMonth(Integer.parseInt(dataSlice[1]));
		teste.setYear(Integer.parseInt(dataSlice[0]));
		System.out.print(teste.getDate() + "/" + teste.getMonth() + "/" + teste.getYear());
		

	}

}
