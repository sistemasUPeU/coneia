package pe.edu.upeu.CONEIA.daoImpl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.persistence.ParameterMode;
import javax.persistence.Query;
import javax.persistence.StoredProcedureQuery;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.google.gson.Gson;

import pe.edu.upeu.CONEIA.dao.PersonaDAO;
import pe.edu.upeu.CONEIA.entity.DetalleInscripcion;
import pe.edu.upeu.CONEIA.entity.DetallePrivilegio;
import pe.edu.upeu.CONEIA.entity.Inscripcion;
import pe.edu.upeu.CONEIA.entity.InscripcionTaller;
import pe.edu.upeu.CONEIA.entity.Persona;
import pe.edu.upeu.CONEIA.entity.Rol;
import pe.edu.upeu.CONEIA.entity.Taller;
@Repository
public class PersonaDaoImpl implements PersonaDAO {

	
	@Autowired
	private SessionFactory sessionFactory;

	public PersonaDaoImpl() {
	}

	public PersonaDaoImpl(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	public Map<String, Object> login(String dni, String clave) {

		Session f = sessionFactory.getCurrentSession();
		Gson gs = new Gson();
		List<Map<String, Object>> lista_login = new ArrayList<>();
		Map<String, Object> map = null;
		try {
			
			
			Query query = f.createNamedQuery("ListarUser");
			query.setParameter("dni", dni);
			query.setParameter("clave", clave);
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
					map.put("clave", lista.get(j).getPersona().getPassword());
				

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
	
	
	@Override
	public int checkpass(int idpersona) {
		// TODO Auto-generated method stub
		Session f = sessionFactory.getCurrentSession();
		Gson gs = new Gson();

		Map<String, Object> map = null;
		int respuesta = 0;
		try {

			
			Query query = f.createQuery(
					"select d from Persona d where d.idpersona =:idpersona");
			query.setParameter("idpersona", idpersona);
			@SuppressWarnings("unchecked")
			List<Persona> lista = query.getResultList();

			if(lista.size()!=0) {
				
					String dni = lista.get(0).getDni();
					String clave = lista.get(0).getPassword();
					int estado_update_pass = lista.get(0).getUpdate_pass();
					System.out.println("1 era "+dni + " , " + clave);
					

					if(estado_update_pass==0) {
						//es necesario cambiar la contrase;a
						respuesta = 1;
						
					}else {
						 //la contrase;a ya se cambio
						respuesta = 2;
					}

			}else {
			 //hubo un error, la lista esta vacia
				respuesta = 0;
			}
		

		} catch (Exception e) {
			System.out.println(e);
		}
		
	return respuesta;
	}
	
	@Override
	public int updatePassword(int idpersona, String nuevapass, int estado) {
		// TODO Auto-generated method stub

		int x = 0;
		Session s = sessionFactory.getCurrentSession();

		StoredProcedureQuery querys2 = s.createStoredProcedureQuery("updatePassword")
				.registerStoredProcedureParameter("idp", Integer.class, ParameterMode.IN)
				.registerStoredProcedureParameter("newpass", String.class, ParameterMode.IN)
				.registerStoredProcedureParameter("estado", Integer.class, ParameterMode.IN)
				.setParameter("idp", idpersona).setParameter("newpass", nuevapass).setParameter("estado", estado);

		System.out.println("change pass "+querys2.execute());

		x = 1;
		System.out.println("casi final");
		return x;
	}
	
	
	
	@Override
	public Map<String, Object> validarCambio(String numero, String correo) {
		// TODO Auto-generated method stub
		Map<String, Object> map = null;
		int x = 0;
		Session s = sessionFactory.getCurrentSession();
		
		
		Query query = s.createQuery(
				"select d from DetalleInscripcion d join fetch d.persona a join fetch d.inscripcion b where b.estado = 1 and a.celular =:numero and a.correo=:correo");
		query.setParameter("numero", numero);
		query.setParameter("correo", correo);
		
		
		@SuppressWarnings("unchecked")
		List<DetalleInscripcion> lista = query.getResultList();
		if(lista.size()!=0) {
			for (int j = 0; j < lista.size(); j++) {
				map = new HashMap<String, Object>();
				map.put("op", 1);
				map.put("idpersona", lista.get(j).getPersona().getIdpersona());
				map.put("nombre", lista.get(j).getPersona().getNombre());
				map.put("apellidos", lista.get(j).getPersona().getApellidos());
				map.put("dni", lista.get(j).getPersona().getDni());
				map.put("clave", lista.get(j).getPersona().getPassword());
			

			}
		}else {
			map = new HashMap<String, Object>();
			map.put("op", 0);
		}

		x = 1;
		System.out.println("casi final" + map);
		return map;
	}

	@Override
	public List<Map<String, Object>> listarPersonal() {
		int x = 0;
		List<Map<String,Object>> liston = new ArrayList<>();
		Map<String, Object> map = null;
		try {
			Session s = sessionFactory.getCurrentSession();
			Query query = s.createQuery(
					"select p from Persona p where p.rol=:rol");
			Rol r = s.get(Rol.class, 7);
			query.setParameter("rol", r);
			@SuppressWarnings("unchecked")
			List<Persona> lista = query.getResultList();
			if(lista.size()!=0) {
				for (int j = 0; j < lista.size(); j++) {
					map = new HashMap<String, Object>();
					map.put("op", 1);
					map.put("idpersona", lista.get(j).getIdpersona());
					map.put("nombre", lista.get(j).getNombre());
					map.put("apellidos", lista.get(j).getApellidos());
					map.put("dni", lista.get(j).getDni());
					map.put("clave", lista.get(j).getPassword());
					map.put("celular", lista.get(j).getCelular());
					liston.add(map);
				}
			}else {
				map = new HashMap<String, Object>();
				map.put("op", 0);
			}

			x = 1;
			
		} catch (Exception e) {
			System.out.println("Error al listar personal" +e);
		}
		
		return liston;
	}

	@Override
	public int actualizar(Persona p) {
		int x=0;
		try {
			Session s = sessionFactory.getCurrentSession();
			s.update(p);	
	    	x=1;
		} catch (HibernateException e) {
			System.out.println("Error al actualizar persona: "+e);
		}
		return x;
	}

	@Override
	public int eliminar(int id) {
		int x=0;
		try {
			Session s = sessionFactory.getCurrentSession();
	    	Persona p = s.get(Persona.class, id);
	    	s.delete(p);;	
	    	x=1;
		} catch (HibernateException e) {
			System.out.println("Error al eliminar persona: "+e);
		}
		return x;
	}

	@Override
	public Map<String,Object> search(int id) {
		Persona p =null;
		Map<String,Object> map = null;
		try {
			Session s = sessionFactory.getCurrentSession();
			p = s.get(Persona.class, id);
			map = new HashMap<>();
			map.put("idpersona", p.getIdpersona());
			map.put("nombres", p.getNombre());
			map.put("apellidos", p.getApellidos());
			map.put("dni", p.getDni());
			map.put("clave", p.getPassword());
			map.put("celular", p.getCelular());
		} catch (Exception e) {
			System.out.println("Error al buscar persona: " +e);
		}
		return map;
	}

	@Override
	public int nuevaPersona(Persona p) {
		int x=0;
		try {
			Session s = sessionFactory.getCurrentSession();
	    	s.save(p);	
	    	x=1;
		} catch (HibernateException e) {
			System.out.println("Error al insertar persona: "+e);
		}
		return x;
	}
	
	
	
	
	
	
}
