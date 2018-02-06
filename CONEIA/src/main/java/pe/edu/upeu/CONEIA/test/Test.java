package pe.edu.upeu.CONEIA.test;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.hibernate.Session;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import pe.edu.upeu.CONEIA.dao.PersonaDAO;
import pe.edu.upeu.CONEIA.dao.TallerDAO;
import pe.edu.upeu.CONEIA.entity.DetalleInscripcion;
import pe.edu.upeu.CONEIA.entity.InscripcionTaller;
import pe.edu.upeu.CONEIA.entity.Taller;
import pe.edu.upeu.CONEIA.util.HibernateUtils;




public class Test {

	public static Session s;
	private static PersonaDAO pd = new PersonaDAO();
	private static TallerDAO td = new TallerDAO();
	private static Taller t  = new Taller();;
	private static DetalleInscripcion d = new DetalleInscripcion();;
	private static Gson gson = new Gson();

	public static void main(String[] args) throws ParseException {
		// TODO Auto-generated method stub
//		conex();
//		login();
//		taller();
//		createTaller();
		listar();
	}

	public static void conex() {
		s= HibernateUtils.getSessionFactory().openSession();
		if(s.isOpen()) {
			System.out.println("si");
		}else {
			System.out.println("no");
		}
	}
	
	public static void createTaller() {
		InscripcionTaller it = new InscripcionTaller();
		t.setIdtaller(1);	
		d.setIddetalleInscripcion(1);
		it.setDetalleInscripcion(d);
		it.setTaller(t);
		if(td.create(it)==1) {
			System.out.println("Jonas estas de suerte");
		}else {
			System.out.println("nada Jonas");
		}
	}
	
	public static void listar() {
		System.out.println(gson.toJson(td.readAll()));
	}
	
	public static void login() {
		System.out.println(gson.toJson(pd.login("48417500")));
	}
	
	public static void taller() throws ParseException {
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		Date fecha= formatter.parse("2018-06-04");
		SimpleDateFormat formatter2 = new SimpleDateFormat("HH:mm");
		Date hora = formatter2.parse("10:30");
		System.out.println(gson.toJson(td.buscarTaller(hora, fecha, 1)));
	}

}
