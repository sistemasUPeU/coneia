package pe.edu.upeu.CONEIA.dao;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.persistence.Query;

import org.hibernate.Session;
import org.hibernate.Transaction;

import pe.edu.upeu.CONEIA.entity.DetalleInscripcion;
import pe.edu.upeu.CONEIA.entity.Inscripcion;
import pe.edu.upeu.CONEIA.entity.InscripcionTaller;
import pe.edu.upeu.CONEIA.entity.Taller;
import pe.edu.upeu.CONEIA.util.HibernateUtils;



public class TallerDAO {
	private static Session s;
	private Transaction tr;
	
	public int create(InscripcionTaller t) {
		int x=0;		
		try {	
			s = HibernateUtils.getSessionFactory().openSession();
	    	tr = s.beginTransaction();
	    	s.save(t);
	    	tr.commit();	
	    	x=1;
		} catch (Exception e) {
			tr.rollback();
			System.out.println("Error al insertar: "+e);
		}finally {
			s.close();
		}
		return x;
	}

	public int buscarTaller(Date hora,Date fecha, int id) {
		Session s = HibernateUtils.getSessionFactory().openSession();
		int cantidad =0;

		Map<String, Object> map = null;
		try {
			
			
			Query query2 = s.createNamedQuery("Inscritos");
			query2.setParameter("iddetalleInscripcion", id);		
			List<DetalleInscripcion> lista2 = query2.getResultList();
			
			DetalleInscripcion d =  s.get(DetalleInscripcion.class, lista2.get(0).getIddetalleInscripcion());
			
			Query inscripcion = s.createNamedQuery("InscripcionTaller");
			inscripcion.setParameter("detalleInscripcion", d);
			inscripcion.setParameter("hora", hora);
			inscripcion.setParameter("fecha", fecha);
			List<InscripcionTaller> lista3 = inscripcion.getResultList();
			
			cantidad = lista3.size();
			

		} catch (Exception e) {
			System.out.println(e);
		} finally {
			s.close();
		}

		return cantidad;
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String,Object>> readAll() {
		s = HibernateUtils.getSessionFactory().openSession();
		Map<String,Object> objeto = null;
		List<Taller> lista= s.createQuery("from Taller").list();
		List<Map<String,Object>> liston = new ArrayList<>();
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
		return liston;
	}
}
