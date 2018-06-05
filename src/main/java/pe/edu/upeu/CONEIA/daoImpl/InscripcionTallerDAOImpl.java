package pe.edu.upeu.CONEIA.daoImpl;

import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.sql.Time;
import java.text.DateFormat;
import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.persistence.ParameterMode;
import javax.persistence.Query;
import javax.persistence.StoredProcedureQuery;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.type.StandardBasicTypes;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.google.gson.Gson;

import pe.edu.upeu.CONEIA.dao.InscripcionTallerDAO;
import pe.edu.upeu.CONEIA.entity.DetalleInscripcion;
import pe.edu.upeu.CONEIA.entity.InscripcionTaller;
import pe.edu.upeu.CONEIA.entity.Taller;
import pe.edu.upeu.CONEIA.entity.VistaAsistencia;
import pe.edu.upeu.CONEIA.entity.VistaPersonaTaller;
import pe.edu.upeu.CONEIA.entity.VistaReporteAsistencia;

@Repository
public class InscripcionTallerDAOImpl implements InscripcionTallerDAO {
	
	private static DecimalFormat df2 = new DecimalFormat(".##");
	@Autowired
	private SessionFactory sessionFactory;
	
	public Gson gs = new Gson();

	public InscripcionTallerDAOImpl() {
	
	}

	public InscripcionTallerDAOImpl(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public int create(InscripcionTaller t, int idd, int idt) {
		int x=0;		
		try {	
			Session s = sessionFactory.getCurrentSession();
	    	DetalleInscripcion d = s.get(DetalleInscripcion.class, idd);
	    	t.setDetalleInscripcion(d);
	    	Taller ta = s.get(Taller.class, idt);
	    	t.setTaller(ta);
	    	s.save(t);
	    	x=1;
		} catch (HibernateException e) {
			System.out.println("Error create inscripcion: "+e);
		}
		return x;
	}

	@Override
	public int actualizarAsistencia(int idit) {
		int x=0; int value=0;
		try {
			Session s = sessionFactory.getCurrentSession();
	    	InscripcionTaller it = s.get(InscripcionTaller.class, idit);
	    	value = it.getAsistencia();
	    	switch(value) {
	    	case 0:
	    		value=1;
	    		break;
	    	case 1:
	    		value=0;
	    		break;
	    	}
	    	it.setAsistencia(value);
	    	 	
	    	s.update(it);
	    	x=1;
		} catch (HibernateException e) {
			System.out.println("Error al marcar asistencia: "+e);
		}
		return x;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Map<String, Object>> showVistaPersonaTaller(String time){
		String total="";
		List<InscripcionTaller> lista = new ArrayList<>();
		List<Map<String,Object>> liston =  new ArrayList<>();
		
		List<Map<String, Object>> talleres = new ArrayList<>();
		
		Map<String,Object> map = null;
		try {
			Session s = sessionFactory.getCurrentSession();
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
			Date fechita = formatter.parse(time);
			
			DateFormat dfDateMedium = DateFormat.getDateInstance(DateFormat.MEDIUM);			
			String date = null;
//			Query query = s.createQuery(
//					"from VistaPersonaTaller v where v.fecha='"+time+"' and v.dni like concat('%',:dni,'%')");
//			Query query = s.createQuery(
//					"from VistaPersonaTaller v where v.fecha='"+time+"'");
//			Query querynative = s.createNativeQuery("Select * from inscripciontaller it left join taller t on it.idtaller=t.idtaller left join detalleInscripcion di on it.iddetalleinscripcion = di.iddetalleinscripcion left join persona p on di.idpersona = di.idpersona;");
			Query query = s.createQuery("select distinct i from InscripcionTaller i join fetch i.taller a join fetch i.detalleInscripcion b join fetch b.persona p where a.fecha=:time group by i.detalleInscripcion.iddetalleInscripcion");
			
			query.setParameter("time", fechita);
			
			
		
			
//					query.setParameter("dni", dni);
			int idit=0; int asistencia=0;
						  
			lista = query.getResultList();
			
			System.out.println(lista);
			

			System.out.println("tamaa;ooo> " + lista.size());
			List<String> ret = new ArrayList<>();
			Map<String, Object> map1 = null;


			
			for (InscripcionTaller c : lista) {
				System.out.println("entro a reccorer");
				
				
				
//			date=dfDateMedium.format(v.getFecha());
			date = c.getTaller().getFecha().toString();
			System.out.println(date);
			String[] fecha = date.split("-");
//			String anio = fecha[2];String mes = fecha[1];
			String dia = fecha[0];
			String fechon="";
			switch(dia) {
			case "04":
				fechon="lunes";
			break;
			case "05":
				fechon="martes";
				break;
			case "06":
				fechon="miercoles";
				break;
			case "07":
				fechon="jueves";
				break;
			case "08":
				fechon="viernes";
				break;
			}
//			String fechon = anio+"-"+mes+"-"+dia;
			
			long num = cuantos(c.getDetalleInscripcion().getIddetalleInscripcion());
//			long num2 = cuantos2(v.getIdd());
			double suma = num;
			if(suma==0) {
				total = "0";
				
			}else {
				double sumando = (suma/27)*100;
				total = df2.format(sumando);
			}
				
				
//				Map<String,Object> mapita = mapon(c.getDetalleInscripcion().getIddetalleInscripcion(),time);
//				asistencia=Integer.parseInt(mapita.get("asistencia").toString());
//				idit = Integer.parseInt(mapita.get("idit").toString());
//				String tema = mapita.get("tema").toString();
				
				
				map1 = new HashMap<>();

//				String tema="";
//				map1.put("idit" , c.getIdinscripcionTaller() );
				map1.put("idd", c.getDetalleInscripcion().getIddetalleInscripcion());
//				switch(c.getTaller().getTipo().getIdtipo()) {
//				case 1:
//					tema="Ponencias Paralelas";
//					break;
//				case 2:
//					tema="Visitas técnicas";
//					break;
//				case 3:
//					tema="Conferencia Magistral";
//					break;
//				case 4:
//					tema="Talleres especializados";
//					break;
//				case 5:
//					tema = c.getTaller().getNombre();
//					break;
//				}
				
				Map<String,Object> mapita = mapon(c.getDetalleInscripcion().getIddetalleInscripcion(),time);
				asistencia=Integer.parseInt(mapita.get("asistencia").toString());
				idit = Integer.parseInt(mapita.get("idit").toString());
				String tema = mapita.get("tema").toString();
				map1.put("idit" , idit);
				map1.put("tema", tema);
				map1.put("nombre", c.getDetalleInscripcion().getPersona().getNombre());
				map1.put("apellidos", c.getDetalleInscripcion().getPersona().getApellidos());
				map1.put("dni", c.getDetalleInscripcion().getPersona().getDni());
				map1.put("fecha", fechon);
				map1.put("porcentaje", total);
				map1.put("asistencia", asistencia);
				
				
				System.out.println(map1);
				talleres.add(map1);

			}
			System.out.println("administrador controller de los talleres");
			System.out.println(talleres);
			System.out.println(gs.toJson(talleres));

		
		
//			for(VistaPersonaTaller v : lista) {
////				date=dfDateMedium.format(v.getFecha());
//				date = v.getFecha().toString();
//				System.out.println(date);
//				String[] fecha = date.split("-");
////				String anio = fecha[2];String mes = fecha[1];
//				String dia = fecha[0];
//				String fechon="";
//				switch(dia) {
//				case "04":
//					fechon="lunes";
//				break;
//				case "05":
//					fechon="martes";
//					break;
//				case "06":
//					fechon="miercoles";
//					break;
//				case "07":
//					fechon="jueves";
//					break;
//				case "08":
//					fechon="viernes";
//					break;
//				}
////				String fechon = anio+"-"+mes+"-"+dia;
//				
//				long num = cuantos(v.getIdd());
////				long num2 = cuantos2(v.getIdd());
//				double suma = num;
//				if(suma==0) {
//					total = "0";
//					
//				}else {
//					double sumando = (suma/27)*100;
//					total = df2.format(sumando);
//				}
//				Map<String,Object> mapita = mapon(v.getIdd(),time);
//				asistencia=Integer.parseInt(mapita.get("asistencia").toString());
//				idit = Integer.parseInt(mapita.get("idit").toString());
//				String tema = mapita.get("tema").toString();
//				map = new HashMap<>();
//				map.put("idit", idit);
//				map.put("idd", v.getIdd());
//				map.put("tema", tema);
//				map.put("nombre", v.getNombre());
//				map.put("apellidos", v.getApellidos());
//				map.put("dni", v.getDni());
//				map.put("fecha", fechon);
//				map.put("porcentaje", total);
//				map.put("asistencia", asistencia);
//				liston.add(map);
//			}

//			System.out.println("aquí está la vista persona taller tsk " + lista);

		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("Error showVistaPersonaTaller " + e);
		}

		return talleres;
	}

	@Override
	public List<Map<String, Object>> showVistaAsistencia(int idd, String time) throws ParseException {
		List<VistaAsistencia> lista = new ArrayList<>();
		List<Map<String,Object>> liston =  new ArrayList<>();
		Map<String,Object> map = null;
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		Date fechon = formatter.parse(time);		
		try {
			Session s = sessionFactory.getCurrentSession();
			Query query = s.createQuery(
					"from VistaAsistencia v where v.idd=:idd and v.fecha=:fecha order by v.hora asc" );
			query.setParameter("idd", idd);query.setParameter("fecha", fechon);						
			lista = query.getResultList();
			for(VistaAsistencia v : lista) {		
				map = new HashMap<>();			
				map.put("idit", v.getIdit());
				map.put("idd", v.getIdd());
				map.put("tema", v.getTema());
				System.out.println(v.getHoraI());
				map.put("asistencias", v.getAsistencia());
				liston.add(map);
			}

			System.out.println("aquí está la vista persona taller " + liston);

		} catch (HibernateException e) {
			// TODO: handle exception
			System.out.println("Error showVistaAsistencia " + e);
		} finally {

		}

		return liston;
	}

	@Override
	public long cuantos(int idd) {
		long cont =0;
		try {
			Session s = sessionFactory.getCurrentSession();
			Query query = s.createQuery(
					"select count(*) as cant from InscripcionTaller i where i.detalleInscripcion =:detalleInscripcion and i.asistencia=1" );
			DetalleInscripcion di = s.get(DetalleInscripcion.class, idd);
			query.setParameter("detalleInscripcion", di);
			cont = (long) query.getSingleResult();
		} catch (HibernateException e) {
			System.out.println("Error cuantos " + e);
		}
	
		return cont;
	}

	@Override
	public long cuantos2(int idd) {
		long cont =0;
		try {
			Session s = sessionFactory.getCurrentSession();
			Query query = s.createQuery(
					"select count(*) as cant from InscripcionTaller i where i.detalleInscripcion =:detalleInscripcion and i.asistencia=2" );
			DetalleInscripcion di = s.get(DetalleInscripcion.class, idd);
			query.setParameter("detalleInscripcion", di);
			cont = (long) query.getSingleResult();
		} catch (HibernateException e) {
			System.out.println("Error cuantos2 " + e);
		}
	
		return cont;
	}

	@SuppressWarnings("unchecked")
	@Override
	public Map<String, Object> mapon(int idd, String fecha) throws ParseException {
		
		
		List<InscripcionTaller> lista = new ArrayList<>();
		List<Map<String,Object>> liston =  new ArrayList<>();
		Map<String,Object> map = null;
		String tema="";
		int idit =0;
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		Date fechon = formatter.parse(fecha);
		Calendar cal = Calendar.getInstance();
		Calendar calen = Calendar.getInstance();
		DateFormat sdf = new SimpleDateFormat("HH:mm:ss");
		String hora = sdf.format(cal.getTime());
		calen.add(Calendar.MINUTE, 15);
		String hora2 = sdf.format(calen.getTime());
//		String limite1 = "06:30:00";
//		String limite2 = "21:30:00";
        Date date = sdf.parse(hora);
        Date date2 = sdf.parse(hora2);
//        Date lim1 = sdf.parse(limite1);
//        Date lim2 = sdf.parse(limite2);
        Time time = new Time(date.getTime());
        Time time2 = new Time(date2.getTime());
//        Time l1 = new Time(lim1.getTime());
//        Time l2 = new Time(lim2.getTime());
        // MIRA AQUI NO FUNCIONA PARA ALLA SÍ chevereeeee jajajaj 
    
        
        
        System.out.println("time:" +hora);
        System.out.println("time2:" +hora2);
        System.out.println(fechon);
		try {
			Session s = sessionFactory.getCurrentSession();
				Query query = s.createQuery(
						
						"select distinct i from InscripcionTaller i "
						+ "join fetch i.taller a "
						+ "join fetch a.tipo ti "
						+ "join fetch i.detalleInscripcion b "
						+ "join fetch b.persona p "
						+ "where i.detalleInscripcion.iddetalleInscripcion=:idd and a.fecha=:fecha and a.horaInicio<='"+hora+"' and a.horaFin>='"+hora2+"' "
								+ "group by i.detalleInscripcion.iddetalleInscripcion order by a.horaInicio");
				query.setParameter("idd",idd);
//				query.setParameter("fin",time);
				query.setParameter("fecha", fechon); 
//				query.setParameter("time", time);
				System.out.println(idd);
				lista = query.getResultList();
				
				System.out.println(lista + " ------------- " + lista.size());
				
				if(lista.size()==0) {
					map = new HashMap<>();
					map.put("idit", 0);
					map.put("tema", "No se encuentra dentro del horario");
					map.put("asistencia", 0);
					System.out.println("No se encuentra en horario de evento" + map);
				}else {
					for(InscripcionTaller i : lista) {
						int tipo = i.getTaller().getTipo().getIdtipo();
						switch(tipo) {
						case 1:
							tema="Ponencias Paralelas";
							break;
						case 2:
							tema="Visitas técnicas - Talleres especializados";
							break;
						case 3:
							tema="Conferencia Magistral";
							break;
						case 4:
							tema="Talleres especializados - Visitas técnicas";
							break;
						case 5:
							tema = i.getTaller().getNombre();
							break;
						}												
						map = new HashMap<>();
						map.put("idit", i.getIdinscripcionTaller());
						map.put("idd", i.getDetalleInscripcion().getIddetalleInscripcion());
						map.put("tema", tema);
						System.out.println("esta es la hora: "+i.getTaller().getHoraInicio());
						map.put("asistencia", i.getAsistencia());
					}

					System.out.println("aquí está mapon " + map);
				}

		} catch (HibernateException e) {
			// TODO: handle exception
			System.out.println("Error en mapon " + e);
		} 
		
		return map;
	}

	@Override
	public List<Map<String, Object>> reporteAsistencia() {
		String total="";
		List<Map<String,Object>> liston = new ArrayList<>();
		List<InscripcionTaller> lista = new ArrayList<>();
		Map<String,Object> map = null;
		try {
			Session s = sessionFactory.getCurrentSession();
			Query query = s.createQuery(
					"select distinct i from InscripcionTaller i join fetch i.detalleInscripcion b join fetch b.persona p group by i.detalleInscripcion.iddetalleInscripcion");
			lista = query.getResultList();
			for(InscripcionTaller v : lista) {
				
				long num = cuantos(v.getDetalleInscripcion().getIddetalleInscripcion());
//				long num2 = cuantos2(v.getIdd());
				double suma = num;
				if(suma==0) {
					total = "0";
					
				}else {
					double sumando = (suma/27)*100;
					total = df2.format(sumando);
				}
				map = new HashMap<>();
				map.put("idd", v.getDetalleInscripcion().getIddetalleInscripcion());
				map.put("nombre", v.getDetalleInscripcion().getPersona().getNombre());
				map.put("apellidos", v.getDetalleInscripcion().getPersona().getApellidos());
				map.put("dni", v.getDetalleInscripcion().getPersona().getDni());
				map.put("correo", v.getDetalleInscripcion().getPersona().getCorreo());
				map.put("celular", v.getDetalleInscripcion().getPersona().getCelular());
				map.put("porcentaje", total);
				liston.add(map);
			}
		} catch (HibernateException e) {
			System.out.println("Error reporte de asistencias "+e);
		}
		
		return liston;
	}

	@Override
	public List<Map<String, Object>> impresiones(int idt) {
		String total="";
		List<Map<String,Object>> liston = new ArrayList<>();
		Map<String,Object> map = null;
		try {
			Session s = sessionFactory.getCurrentSession();
//			StoredProcedureQuery query = s.createStoredProcedureQuery("printWorkshop")
//					.registerStoredProcedureParameter("idt", Integer.class, ParameterMode.IN)
//					.setParameter("idt", idt);
			String q = "SELECT p.nombre as nombres,p.apellidos as apellidos,p.dni as dni,p.correo as correo,p.celular as celular,t.nombre as tema,it.asistencia as asistencia ,it.iddetalle_inscripcion as idd from persona p \r\n" + 
					"LEFT JOIN detalle_inscripcion di ON p.idpersona=di.idpersona\r\n" + 
					"LEFT JOIN inscripcion_taller it ON di.iddetalle_inscripcion=it.iddetalle_inscripcion\r\n" + 
					"LEFT JOIN taller t ON it.idtaller=t.idtaller\r\n" + 
					"WHERE it.idtaller=?";
			Query query = s.createNativeQuery(q);
			query.setParameter(1, idt);

//			Query query = s.createQuery("call printWorkshop(:idt)");
//			query.setParameter("idt", idt);
			List<Object[]> resultado = query.getResultList();
			for(Object[] lista :resultado){
				long num = cuantos(Integer.parseInt(lista[7].toString()));
//				long num2 = cuantos2(v.getIdd());
				double suma = num;
				if(suma==0) {
					total = "0";
					
				}else {
					double sumando = (suma/27)*100;
					total = df2.format(sumando);
				}
				
				map = new HashMap<>();
				map.put("nombres", lista[0]);
				map.put("apellidos", lista[1]);
				map.put("dni", lista[2]);
				map.put("correo", lista[3]);
				map.put("celular", lista[4]);
				map.put("tema", lista[5]);
				map.put("asistencia", lista[6]);
				map.put("porcentaje", total);
				liston.add(map);
			}
//			System.out.println(gs.toJson(resultado));
		} catch (Exception e) {
			System.out.println("Error impresiones "+e);
		}
		
		
		return liston;
	}
	

}
