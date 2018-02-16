package pe.edu.upeu.CONEIA.daoImpl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.persistence.ParameterMode;
import javax.persistence.Query;
import javax.persistence.StoredProcedureQuery;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import pe.edu.upeu.CONEIA.dao.ConfiguracionDAO;
import pe.edu.upeu.CONEIA.entity.Configuracion;
import pe.edu.upeu.CONEIA.entity.Inscripcion;

@Repository
public class ConfiguracionDaoImpl implements ConfiguracionDAO {

	@Autowired
	private SessionFactory sessionFactory;

	public ConfiguracionDaoImpl() {
	}

	public ConfiguracionDaoImpl(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> getPrecios() {
		// TODO Auto-generated method stub

		List<Configuracion> lista = new ArrayList<>();
		List<Map<String, Object>> config = new ArrayList<>();

		Session s = sessionFactory.getCurrentSession();

		try {
			Map<String, Object> map = null;
			Query query = null;

			// obtener correo personal
			query = s.createQuery("select d from Configuracion d");

			lista = query.getResultList();

			System.out.println("dao impl lista emails> " + lista);

			for (Configuracion c : lista) {
				System.out.println("entro a reccorer");
				map = new HashMap<>();
				map.put("idc", c.getIdconfiguracion());
				map.put("delegacion", c.getDelegacion());
				map.put("profesional", c.getProfesional());
				map.put("alumno", c.getAlumno());
				map.put("estado", c.getEstado());

				System.out.println(map);
				config.add(map);

			}
			System.out.println("convertido >>> " + config);

		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("Error getting emails, dao impl " + e);
		} finally {

		}

		return config;
	}

	public int updateSeason(int idactivo, int idtoactive) {
		// TODO Auto-generated method stub

		int x = 0;
		Session s = sessionFactory.getCurrentSession();

		StoredProcedureQuery querys2 = s.createStoredProcedureQuery("updateSeason")
				.registerStoredProcedureParameter("ida", Integer.class, ParameterMode.IN)
				.registerStoredProcedureParameter("idp", Integer.class, ParameterMode.IN).setParameter("ida", idactivo)
				.setParameter("idp", idtoactive);

		querys2.execute();

		x = 1;
		System.out.println("casi final");
		return x;
	}

	public int updateCost(int idc, int dele, int alu, int pro) {
		// TODO Auto-generated method stub

		int x = 0;
		Session s = sessionFactory.getCurrentSession();

		StoredProcedureQuery querys3 = s.createStoredProcedureQuery("updateCost")
				.registerStoredProcedureParameter("idc", Integer.class, ParameterMode.IN)
				.registerStoredProcedureParameter("pdele", Integer.class, ParameterMode.IN)
				.registerStoredProcedureParameter("palu", Integer.class, ParameterMode.IN)
				.registerStoredProcedureParameter("ppro", Integer.class, ParameterMode.IN).setParameter("idc", idc)
				.setParameter("pdele", dele).setParameter("palu", alu).setParameter("ppro", pro);

		querys3.execute();

		x = 1;
		System.out.println("casi final");
		return x;
	}

}
