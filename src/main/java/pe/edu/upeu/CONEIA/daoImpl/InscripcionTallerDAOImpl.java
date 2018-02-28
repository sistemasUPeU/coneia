package pe.edu.upeu.CONEIA.daoImpl;

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

import javax.persistence.Query;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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

	@Override
	public List<Map<String, Object>> showVistaPersonaTaller(String time){
		String total="";
		List<VistaPersonaTaller> lista = new ArrayList<>();
		List<Map<String,Object>> liston =  new ArrayList<>();
		Map<String,Object> map = null;
		try {
			Session s = sessionFactory.getCurrentSession();
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
			DateFormat dfDateMedium = DateFormat.getDateInstance(DateFormat.MEDIUM);			
			String date = null;
			Query query = s.createQuery(
					"from VistaPersonaTaller v where v.fecha='"+time+"'");
			int idit=0; int asistencia=0;
			lista = query.getResultList();
			for(VistaPersonaTaller v : lista) {
//				date=dfDateMedium.format(v.getFecha());
				date = v.getFecha().toString();
				System.out.println(date);
				String[] fecha = date.split("-");
//				String anio = fecha[2];String mes = fecha[1];
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
//				String fechon = anio+"-"+mes+"-"+dia;
				
				long num = cuantos(v.getIdd());
//				long num2 = cuantos2(v.getIdd());
				double suma = num;
				if(suma==0) {
					total = "0";
					
				}else {
					double sumando = (suma/27)*100;
					total = df2.format(sumando);
				}
				Map<String,Object> mapita = mapon(v.getIdd(),time);
				asistencia=Integer.parseInt(mapita.get("asistencia").toString());
				idit = Integer.parseInt(mapita.get("idit").toString());
				String tema = mapita.get("tema").toString();
				map = new HashMap<>();
				map.put("idit", idit);
				map.put("idd", v.getIdd());
				map.put("tema", tema);
				map.put("nombre", v.getNombre());
				map.put("apellidos", v.getApellidos());
				map.put("dni", v.getDni());
				map.put("fecha", fechon);
				map.put("porcentaje", total);
				map.put("asistencia", asistencia);
				liston.add(map);
			}

			System.out.println("aquí está la vista persona taller tsk " + lista);

		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("Error showVistaPersonaTaller " + e);
		}

		return liston;
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
		
		
		List<VistaAsistencia> lista = new ArrayList<>();
		List<Map<String,Object>> liston =  new ArrayList<>();
		Map<String,Object> map = null;
		String tema="";
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		Date fechon = formatter.parse(fecha);
		Calendar cal = Calendar.getInstance();
		DateFormat sdf = new SimpleDateFormat("HH:mm:ss");
		String hora = sdf.format(cal.getTime());
//		String limite1 = "06:30:00";
//		String limite2 = "21:30:00";
        Date date = sdf.parse(hora);
//        Date lim1 = sdf.parse(limite1);
//        Date lim2 = sdf.parse(limite2);
        Time time = new Time(date.getTime());
//        Time l1 = new Time(lim1.getTime());
//        Time l2 = new Time(lim2.getTime());
        // MIRA AQUI NO FUNCIONA PARA ALLA SÍ chevereeeee jajajaj 

        
        
        System.out.println("time:" +hora);
        System.out.println(fechon);
		try {
			Session s = sessionFactory.getCurrentSession();
				Query query = s.createQuery(

						"select v from VistaAsistencia v where v.idd=:idd and v.fecha=:fecha and v.hora<='"+hora+"' and fin>='"+hora+"'");
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
					for(VistaAsistencia v : lista) {
						int tipo = v.getIdtipo();
						switch(tipo) {
						case 1:
							tema="Ponencias Paralelas";
							break;
						case 2:
							tema="Talleres especializados";
							break;
						case 3:
							tema="Conferencia Magistral";
							break;
						case 4:
							tema="Visitas técnicas";
							break;
						case 5:
							tema = v.getTema();
							break;
						}												
						map = new HashMap<>();
						map.put("idit", v.getIdit());
						map.put("idd", v.getIdd());
						map.put("tema", tema);
						System.out.println("esta es la hora: "+v.getHoraI());
						map.put("asistencia", v.getAsistencia());
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
		List<VistaReporteAsistencia> lista = new ArrayList<>();
		Map<String,Object> map = null;
		try {
			Session s = sessionFactory.getCurrentSession();
			Query query = s.createQuery(
					"from VistaReporteAsistencia");
			lista = query.getResultList();
			for(VistaReporteAsistencia v : lista) {
				
				long num = cuantos(v.getIdd());
//				long num2 = cuantos2(v.getIdd());
				double suma = num;
				if(suma==0) {
					total = "0";
					
				}else {
					double sumando = (suma/27)*100;
					total = df2.format(sumando);
				}
				map = new HashMap<>();
				map.put("idd", v.getIdd());
				map.put("nombre", v.getNombre());
				map.put("apellidos", v.getApellidos());
				map.put("dni", v.getDni());
				map.put("correo", v.getCorreo());
				map.put("celular", v.getCelular());
				map.put("porcentaje", total);
				liston.add(map);
			}
		} catch (HibernateException e) {
			System.out.println("Error reporte de asistencias "+e);
		}
		
		return liston;
	}
	

}
