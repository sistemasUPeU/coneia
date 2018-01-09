package pe.edu.upeu.CONEIA.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.persistence.Query;

import org.hibernate.Session;

import pe.edu.upeu.CONEIA.entity.Persona;
import pe.edu.upeu.CONEIA.util.HibernateUtils;

public class PersonaDAO {
	
	public Map<String, Object> login(String dni) {
		Session s = HibernateUtils.getSessionFactory().openSession();
		// List<Map<String, ?>> liston = new ArrayList<>();

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
				map.put("paterno", lista.get(j).getApePaterno());
				map.put("materno", lista.get(j).getApeMaterno());
				map.put("rol", lista.get(j).getRol().getNombre());
				map.put("carrera", lista.get(j).getCarrera());
				map.put("deporte", lista.get(j).getDeporte());
				map.put("correo", lista.get(j).getCorreo());
				// liston.add(map);

			}

		} catch (Exception e) {
			System.out.println(e);
		} finally {
			s.close();
		}

		return map;
	}
}
