package pe.edu.upeu.CONEIA.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.persistence.Query;

import org.hibernate.Session;

import com.google.gson.Gson;

import pe.edu.upeu.CONEIA.entity.DetalleInscripcion;
import pe.edu.upeu.CONEIA.entity.DetallePrivilegio;
import pe.edu.upeu.CONEIA.entity.Persona;
import pe.edu.upeu.CONEIA.entity.Rol;
import pe.edu.upeu.CONEIA.util.HibernateUtils;

public class PersonaDAO {

	public Map<String, Object> login(String dni) {
		Session s = HibernateUtils.getSessionFactory().openSession();
		// final Session s = HibernateUtils.getSessionFactory();
		// List<Map<String, ?>> liston = new ArrayList<>();
		Gson gs = new Gson();
		Map<String, Object> map = null;
		try {
			Query query = s.createNamedQuery("ListarUser");
			query.setParameter("dni", dni);
			List<Persona> lista = query.getResultList();
			Persona u = null;

			 for (int j = 0; j < lista.size(); j++) {
			 map = new HashMap<String, Object>();
			 map.put("idpersona", lista.get(j).getIdpersona());
			 map.put("dni", lista.get(j).getDni());
			 map.put("nombre", lista.get(j).getNombre());
			 map.put("apellidos", lista.get(j).getApellidos());
			 map.put("rol", lista.get(j).getRol().getNombre());
			 map.put("carrera", lista.get(j).getCarrera());
			 map.put("importe", lista.get(j).getImporte());
			 map.put("correo", lista.get(j).getCorreo());
			 map.put("idrol", lista.get(j).getRol().getIdrol());
			 // liston.add(map);
			
			 }
//			for (int j = 0; j < lista.size(); j++) {
//				map = new HashMap<String, Object>();
//				map.put("idpersona", lista.get(j).getPersona().getIdpersona());
//				map.put("dni", lista.get(j).getPersona().getDni());
//				map.put("nombre", lista.get(j).getPersona().getNombre());
//				map.put("apellidos", lista.get(j).getPersona().getApellidos());
//				map.put("rol", lista.get(j).getPersona().getRol());
//				map.put("carrera", lista.get(j).getPersona().getCarrera());
//				map.put("importe", lista.get(j).getPersona().getImporte());
//				map.put("correo", lista.get(j).getPersona().getCorreo());
//				map.put("idrol", lista.get(j).getPersona().getRol().getIdrol());
//				// liston.add(map);
//
//			}

		} catch (Exception e) {
			System.out.println(e);
		} finally {
			s.close();
		}
		System.out.println(gs.toJson(map));
		return map;
	}
	
	
	public List<Map<String, Object>> listarPrivilegios(int idrol){
		Map<String, Object> maleta = null;
		List<Map<String, Object>> privilegioListon = null;
		Session s = HibernateUtils.getSessionFactory().openSession();
		
		try {
			Query privilegios = s.createNamedQuery("MostrarPrivilegios");
			Rol r = s.get(Rol.class, idrol);
			privilegios.setParameter("rol", r);

			@SuppressWarnings("unchecked")
			List<DetallePrivilegio> liston = privilegios.getResultList();
			privilegioListon = new ArrayList<>();
			for (int j = 0; j < liston.size(); j++) {
				maleta = new HashMap<>();
				maleta.put("nombre", liston.get(j).getPrivilegio().getNombre());
				System.out.println(liston.get(j).getPrivilegio().getNombre());
				maleta.put("url", liston.get(j).getPrivilegio().getUrl());
				maleta.put("icons", liston.get(j).getPrivilegio().getIcons());
				privilegioListon.add(maleta);
			}
		} catch (Exception e) {
			System.out.println("error dao persona lista priv" + e);
		}
		
	
		
		return privilegioListon;
		
	}
}
