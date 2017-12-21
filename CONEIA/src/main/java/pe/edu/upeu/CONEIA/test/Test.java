package pe.edu.upeu.CONEIA.test;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.hibernate.Session;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import pe.edu.upeu.CONEIA.util.HibernateUtils;




public class Test {

	public static Session s;

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		conex();
		//readAll();
		//listarTipo();
		//read();
	}

	public static void conex() {
		s= HibernateUtils.getSessionFactory().openSession();
		if(s.isOpen()) {
			System.out.println("si");
		}else {
			System.out.println("no");
		}
	}
	
//	public static void readAll() {
//		
////		Gson s = new Gson(); 
////		
////		System.out.println(s.toJson(lista));
////		
////		for(Tipo a3: lista){
////			System.out.println(a3.getNombre());
////		}
//		List<Habitacion> lista = h.readAll();
//		Gson gson = new GsonBuilder().excludeFieldsWithoutExposeAnnotation().create();
//		String json="";
//		List<String> ret = new ArrayList<>();
//
//
//	for(Habitacion c: lista){
//			
//			json=gson.toJson(new Habitacion(c.getIdhabitacion(),c.getNumero(), c.getNumeroCamas(), c.getTipo().getIdtipo(),c.getTipo().getNombre()));
//			ret.add(json);
//			System.out.println(json);
//			//System.out.println(c.getTipo().getNombre());
//	}
//
//		System.out.println(ret);
//
//		
//	}
//	public static void listarTipo() {
//		
//		List<Map<String, ?>> ret = new ArrayList<>();
//	      
//		Gson s = new Gson(); 
//		//ret=c.reporte();
//
//		for(Object x:ret) {
//			System.out.println(s.toJson(x));
//		}
//		
//		
//
//	}
//	
//	public static void read() {
//		Tipo ti = t.read(8);
//		
//		Gson gson = new GsonBuilder().excludeFieldsWithoutExposeAnnotation().create();
//
//        String json = gson.toJson(new Tipo(ti.getIdtipo(),ti.getNombre()));
//        System.out.println(json);
//		
//		//Gson s = new GsonBuilder().excludeFieldsWithoutExposeAnnotation().create(); 
//		//System.out.println(s.toJson(t.read(8)));
//		System.out.println(ti.getNombre());
//	}
	
}
