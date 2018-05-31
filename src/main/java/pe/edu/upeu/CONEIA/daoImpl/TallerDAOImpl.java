package pe.edu.upeu.CONEIA.daoImpl;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import pe.edu.upeu.CONEIA.dao.TallerDAO;
import pe.edu.upeu.CONEIA.entity.DetalleInscripcion;
import pe.edu.upeu.CONEIA.entity.InscripcionTaller;
import pe.edu.upeu.CONEIA.entity.Taller;
import pe.edu.upeu.CONEIA.entity.Tipo;

@Repository
public class TallerDAOImpl implements TallerDAO{
	@Autowired
	private SessionFactory sessionFactory;
	
	public TallerDAOImpl() {
	}

	public TallerDAOImpl(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}


	@Override
	public int nuevoTaller(Taller t) {
		int x=0;		
		try {	
			Session s = sessionFactory.getCurrentSession();
	    	s.save(t);
	    	x=1;
		} catch (HibernateException e) {
			System.out.println("Error al insertar taller: "+e);
		}
		return x;
	}

	@Override
	public int eliminar(int id) {
		int x=0;
		try {
			Session s = sessionFactory.getCurrentSession();
	    	Taller t = s.get(Taller.class, id);
	    	s.delete(t);
	    	x=1;
		} catch (HibernateException e) {
			System.out.println("Error al eliminar taller: "+e);
		}
		return x;
	}

	@Override
	public int update(int idtaller, int idtipo, String tema, String ponente, String lugar, int stock) {
		int x=0;
		try {
			Session s = sessionFactory.getCurrentSession();
	    	Tipo ti = s.get(Tipo.class, idtipo);
	    	Taller t = s.get(Taller.class, idtaller);
	    	t.setNombre(tema);t.setPonente(ponente);t.setDescripcion(lugar);t.setNroVacantes(stock);t.setTipo(ti);
	    	s.update(t);
	    	x=1;
		} catch (HibernateException e) {
			System.out.println("Error al actualizar taller: "+e);
		}
		return x;
	}

	@Override
	public int buscarTaller(int id) {
		int cantidad =0;
		try {
			Session s = sessionFactory.getCurrentSession();
			Query query = s.createNamedQuery("Inscritos");
			query.setParameter("iddetalleInscripcion", id);		
			@SuppressWarnings("unchecked")
			List<DetalleInscripcion> lista = query.getResultList();			
			DetalleInscripcion d =  s.get(DetalleInscripcion.class, lista.get(0).getIddetalleInscripcion());			
			Query inscripcion = s.createNamedQuery("InscripcionTaller");
			inscripcion.setParameter("detalleInscripcion", d);	
			List<InscripcionTaller> lista3 = inscripcion.getResultList();			
			cantidad = lista3.size();		

		} catch (HibernateException e) {
			System.out.println("Error al buscar taller "+e);
		}

		return cantidad;
	}

	@Override
	public List<Map<String, Object>> buscarTaller2(int id) {
		
		Map<String,Object> objeto = null;
		List<Map<String,Object>> liston = new ArrayList<>();

		try {
			Session s = sessionFactory.getCurrentSession();
			DetalleInscripcion d =  s.get(DetalleInscripcion.class, id);			
			Query inscripcion = s.createNamedQuery("InscripcionTaller");
			inscripcion.setParameter("detalleInscripcion", d);
			@SuppressWarnings("unchecked")
			List<InscripcionTaller> lista3 = inscripcion.getResultList();
			for(int i=0;i<lista3.size();i++) {
				objeto = new HashMap<>();
				objeto.put("nombre", lista3.get(i).getTaller().getNombre());
				objeto.put("ponente", lista3.get(i).getTaller().getPonente());
				objeto.put("lugar", lista3.get(i).getTaller().getDescripcion());
				objeto.put("idt", lista3.get(i).getTaller().getTipo().getIdtipo());
				objeto.put("horaI", lista3.get(i).getTaller().getHoraInicio());
				objeto.put("horaF", lista3.get(i).getTaller().getHoraFin());
				liston.add(objeto);
			}

		} catch (HibernateException e) {
			System.out.println("Error buscar taller 2"+e);
		}

		return liston;
	}

	@Override
	public List<Map<String, Object>> readAll() {
		List<Map<String,Object>> liston = new ArrayList<>();
		try {
			Session s = sessionFactory.getCurrentSession();
			Map<String,Object> objeto = null;
			List<Taller> lista= s.createQuery("from Taller").list();
			
			for(int i=0;i<lista.size();i++) {
				objeto = new HashMap<>();
				objeto.put("idtaller", lista.get(i).getIdtaller());
				objeto.put("tema", lista.get(i).getNombre());
				objeto.put("ponente", lista.get(i).getPonente());
				objeto.put("lugar", lista.get(i).getDescripcion());
				objeto.put("fecha", lista.get(i).getFecha());
				objeto.put("horaI", lista.get(i).getHoraInicio());
				objeto.put("horaF", lista.get(i).getHoraFin());
				objeto.put("stock", lista.get(i).getNroVacantes());
				liston.add(objeto);
			}
		} catch (HibernateException e) {
			System.out.println("Error readAll "+e);
		}
		
		return liston;
	}

	@Override
	public List<Map<String, Object>> findTalleres(int idtipo, String fecha) throws ParseException {

		Map<String,Object> objeto = null;
		List<Map<String,Object>> liston = null;
		try {
			Session s = sessionFactory.getCurrentSession();
			Query query = s.createNamedQuery("TalleresPersonalizado");
			Tipo t = s.get(Tipo.class, idtipo);
			query.setParameter("tipo", t);
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
			Date date = formatter.parse(fecha);
			query.setParameter("fecha", date);
			List<Taller> lista = query.getResultList();
			liston = new ArrayList<>();
			for(int i=0;i<lista.size();i++) {
				objeto = new HashMap<>();
				objeto.put("idtaller", lista.get(i).getIdtaller());
				objeto.put("idtipo", lista.get(i).getTipo().getIdtipo());
				objeto.put("tema", lista.get(i).getNombre());
				objeto.put("ponente", lista.get(i).getPonente());
				objeto.put("lugar", lista.get(i).getDescripcion());
				objeto.put("fecha", lista.get(i).getFecha());
				objeto.put("horaI", lista.get(i).getHoraInicio());
				objeto.put("horaF", lista.get(i).getHoraFin());
				objeto.put("stock", lista.get(i).getNroVacantes());
				liston.add(objeto);
		}
		} catch (HibernateException e) {
			System.out.println("Error findtalleres "+e);
		}
		
		return  liston;
	}

	@Override
	public List<Map<String, Object>> findTalleres2(int idtipo, String fecha, String hora) throws ParseException {
		Map<String,Object> objeto = null;
		List<Map<String,Object>> liston = null;
		try {
			Session s = sessionFactory.getCurrentSession();
			Query query = s.createNamedQuery("TalleresPersonalizado2");
			Tipo t = s.get(Tipo.class, idtipo);
			query.setParameter("tipo", t);
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
			Date date = formatter.parse(fecha);
			SimpleDateFormat formatter2 = new SimpleDateFormat("HH:mm");
			Date hour = formatter2.parse(hora);
			query.setParameter("fecha", date);
			query.setParameter("horaInicio", hour);
			List<Taller> lista = query.getResultList();
			liston = new ArrayList<>();
		for(int i=0;i<lista.size();i++) {
			objeto = new HashMap<>();
			objeto.put("idtaller", lista.get(i).getIdtaller());
			objeto.put("idtipo", lista.get(i).getTipo().getIdtipo());
			objeto.put("tema", lista.get(i).getNombre());
			objeto.put("ponente", lista.get(i).getPonente());
			objeto.put("lugar", lista.get(i).getDescripcion());
			objeto.put("fecha", lista.get(i).getFecha());
			objeto.put("horaI", lista.get(i).getHoraInicio());
			objeto.put("horaF", lista.get(i).getHoraFin());
			objeto.put("stock", lista.get(i).getNroVacantes());
			liston.add(objeto);
		}
		} catch (HibernateException e) {
			System.out.println("Error findtalleres2 "+e);
		}
		
		return  liston;
	}

	@Override
	public List<Map<String, Object>> findTalleres3(int idtipo, String fecha) throws ParseException {
		Map<String,Object> objeto = null;
		List<Map<String,Object>> liston = null;
		try {
			Session s = sessionFactory.getCurrentSession();
			Query query = s.createNamedQuery("TalleresPersonalizado3");
			Tipo t = s.get(Tipo.class, idtipo);
			query.setParameter("tipo", t);
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
			Date date = formatter.parse(fecha);
			query.setParameter("fecha", date);
			List<Taller> lista = query.getResultList();
			liston = new ArrayList<>();
			for(int i=0;i<lista.size();i++) {
				objeto = new HashMap<>();
				objeto.put("idtaller", lista.get(i).getIdtaller());
				objeto.put("idtipo", lista.get(i).getTipo().getIdtipo());
				objeto.put("tema", lista.get(i).getNombre());
				objeto.put("ponente", lista.get(i).getPonente());
				objeto.put("lugar", lista.get(i).getDescripcion());
				objeto.put("fecha", lista.get(i).getFecha());
				objeto.put("horaI", lista.get(i).getHoraInicio());
				objeto.put("horaF", lista.get(i).getHoraFin());
				objeto.put("stock", lista.get(i).getNroVacantes());
				liston.add(objeto);
		}
		} catch (HibernateException e) {
			System.out.println("Error findtalleres "+e);
		}
		
		return  liston;
	}

	@Override
	public List<Map<String, Object>> findTalleres4(int idtipo, String fecha, String hora) throws ParseException {
		Map<String,Object> objeto = null;
		List<Map<String,Object>> liston = null;
		try {
			Session s = sessionFactory.getCurrentSession();
			Query query = s.createNamedQuery("TalleresPersonalizado4");
			Tipo t = s.get(Tipo.class, idtipo);
			query.setParameter("tipo", t);
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
			Date date = formatter.parse(fecha);
			SimpleDateFormat formatter2 = new SimpleDateFormat("HH:mm");
			Date hour = formatter2.parse(hora);
			query.setParameter("fecha", date);
			query.setParameter("horaInicio", hour);
			List<Taller> lista = query.getResultList();
			liston = new ArrayList<>();
		for(int i=0;i<lista.size();i++) {
			objeto = new HashMap<>();
			objeto.put("idtaller", lista.get(i).getIdtaller());
			objeto.put("idtipo", lista.get(i).getTipo().getIdtipo());
			objeto.put("tema", lista.get(i).getNombre());
			objeto.put("ponente", lista.get(i).getPonente());
			objeto.put("lugar", lista.get(i).getDescripcion());
			objeto.put("fecha", lista.get(i).getFecha());
			objeto.put("horaI", lista.get(i).getHoraInicio());
			objeto.put("horaF", lista.get(i).getHoraFin());
			objeto.put("stock", lista.get(i).getNroVacantes());
			liston.add(objeto);
		}
		} catch (HibernateException e) {
			System.out.println("Error findtalleres2 "+e);
		}
		
		return  liston;
	}

}
