package pe.edu.upeu.CONEIA.daoImpl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.persistence.Query;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.google.gson.Gson;

import pe.edu.upeu.CONEIA.dao.PersonaDAO;
import pe.edu.upeu.CONEIA.entity.DetalleInscripcion;
import pe.edu.upeu.CONEIA.entity.DetallePrivilegio;
import pe.edu.upeu.CONEIA.entity.Persona;
import pe.edu.upeu.CONEIA.entity.Rol;
@Repository
public class PersonaDaoImpl implements PersonaDAO {

	
	@Autowired
	private SessionFactory sessionFactory;

	public PersonaDaoImpl() {
	}

	public PersonaDaoImpl(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	public Map<String, Object> login(String dni) {

		Session f = sessionFactory.getCurrentSession();
		Gson gs = new Gson();
		List<Map<String, Object>> lista_login = new ArrayList<>();
		Map<String, Object> map = null;
		try {
			
			
			Query query = f.createNamedQuery("ListarUser");
			query.setParameter("dni", dni);
			@SuppressWarnings("unchecked")
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
		

			}
			



		} catch (Exception e) {
			System.out.println(e);
		} finally {

		}
		System.out.println(gs.toJson(map));
		return map;
	}


	public List<Map<String, Object>> listarPrivilegios(int idrol) {
		Session h = sessionFactory.getCurrentSession();
		Map<String, Object> maleta = null;
		List<Map<String, Object>> privilegioListon = null;

		
		try {
			Query privilegios = h.createNamedQuery("MostrarPrivilegios");
			Rol r = h.get(Rol.class, idrol);
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
			System.out.println("error dao persona lista privi" + e);
		}

		return privilegioListon;

	}


	@Override
	public Map<String, Object> validarEstado(int idpersona) {
		// TODO Auto-generated method stub
		Session f = sessionFactory.getCurrentSession();
		Gson gs = new Gson();

		Map<String, Object> map = null;
		try {

			
			Query query = f.createQuery(
					"select d from DetalleInscripcion d join fetch d.persona a join fetch d.inscripcion b where b.estado = 1 and a.idpersona =:idpersona");
			query.setParameter("idpersona", idpersona);
			@SuppressWarnings("unchecked")
			List<DetalleInscripcion> lista = query.getResultList();

			if(lista.size()!=0) {
				for (int j = 0; j < lista.size(); j++) {
					map = new HashMap<String, Object>();
					map.put("op", 1);
					map.put("idpersona", lista.get(j).getPersona().getIdpersona());
					map.put("dni", lista.get(j).getPersona().getDni());
					map.put("nombre", lista.get(j).getPersona().getNombre());
					map.put("apellidos", lista.get(j).getPersona().getApellidos());
					map.put("rol", lista.get(j).getPersona().getRol().getNombre());
					map.put("carrera", lista.get(j).getPersona().getCarrera());
					map.put("importe", lista.get(j).getPersona().getImporte());
					map.put("correo", lista.get(j).getPersona().getCorreo());
					map.put("idrol", lista.get(j).getPersona().getRol().getIdrol());
					map.put("inscripcion", lista.get(j).getIddetalleInscripcion());
					map.put("estadoinscripcion", lista.get(j).getInscripcion().getEstado());
				

				}
			}else {
				map = new HashMap<String, Object>();
				map.put("op", 0);
			}
		

		} catch (Exception e) {
			System.out.println(e);
		}
		
		
		System.out.println("dao impl persona estado inscirpcion "+gs.toJson(map));
		return map;
	}
}
