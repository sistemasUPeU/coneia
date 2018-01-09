package pe.edu.upeu.CONEIA.test;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.hibernate.Session;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import pe.edu.upeu.CONEIA.dao.PersonaDAO;
import pe.edu.upeu.CONEIA.util.HibernateUtils;




public class Test {

	public static Session s;
	private static PersonaDAO pd = new PersonaDAO();
	private static Gson gson = new Gson();

	public static void main(String[] args) {
		// TODO Auto-generated method stub
//		conex();
		login();

	}

	public static void conex() {
		s= HibernateUtils.getSessionFactory().openSession();
		if(s.isOpen()) {
			System.out.println("si");
		}else {
			System.out.println("no");
		}
	}
	
	public static void login() {
		System.out.println(gson.toJson(pd.login("48417500")));
	}

}
