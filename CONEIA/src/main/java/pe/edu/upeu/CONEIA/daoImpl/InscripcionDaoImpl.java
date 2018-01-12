package pe.edu.upeu.CONEIA.daoImpl;

import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.persistence.ParameterMode;
import javax.persistence.Query;
import javax.persistence.StoredProcedureQuery;
import javax.sql.DataSource;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.springframework.jdbc.core.JdbcTemplate;

import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import pe.edu.upeu.CONEIA.dao.InscripcionDAO;
import pe.edu.upeu.CONEIA.entity.Inscripcion;
import pe.edu.upeu.CONEIA.entity.Persona;
import pe.edu.upeu.CONEIA.entity.Rol;
import pe.edu.upeu.CONEIA.util.HibernateUtils;

public class InscripcionDaoImpl implements InscripcionDAO {

	private static Session s;
	private Transaction tt;

	public int create(Object obj, String str) {

		// TODO Auto-generated method stub

		System.out.println("dao impl string> " + str);

		Session session = HibernateUtils.getSessionFactory().openSession();
		Transaction tx = null;
		// int employeeID = null;
		int x = 0;

		try {
			tx = session.beginTransaction();
			StoredProcedureQuery querys = session.createStoredProcedureQuery("insertarInscripcion")
					.registerStoredProcedureParameter("nestado", Integer.class, ParameterMode.IN)
					.registerStoredProcedureParameter("salida", Integer.class, ParameterMode.OUT)
					.setParameter("nestado", 1);

			// StoredProcedureQuery query =
			// this.em.createNamedStoredProcedureQuery("calculate");
			// query.setParameter("x", 1.23d);
			// query.setParameter("y", 4.56d);
			// query.execute();
			// Double sum = (Double) query.getOutputParameterValue("sum");
			querys.execute();

			int idsubscribe = (int) querys.getOutputParameterValue("salida");
			System.out.println("ultimo id inscripcion insertado> " + idsubscribe);

			

			// ----------------------------------------------------------

			JsonParser parser = new JsonParser();

			// Obtain Array
			JsonArray gsonArr = parser.parse(str).getAsJsonArray();
			System.out.println(gsonArr);
			System.out.println("size " + gsonArr.size());
			int cont = 0;

			for (JsonElement obje : gsonArr) {

				// Object of array
				JsonObject gsonObj = obje.getAsJsonObject();
				System.out.println("gsonObj> " + gsonObj);
				// Primitives elements of object

				// int dorsal = gsonObj.get("nombre").getAsInt();

				String nombre = gsonObj.get("nombre").getAsString();
				System.out.println(nombre);
				String apellido = gsonObj.get("apellido").getAsString();
				String carrera = gsonObj.get("carrera").getAsString();
				String correo = gsonObj.get("correo").getAsString();
				String dni = gsonObj.get("dni").getAsString();
				String universidad = gsonObj.get("universidad").getAsString();
				System.out.println(universidad);
				// // List of primitive elements
				// JsonArray demarcation = gsonObj.get("demarcation").getAsJsonArray();
				// List listDemarcation = new ArrayList();
				// for (JsonElement demarc : demarcation) {
				// listDemarcation.add(demarc.getAsString());
				// }

				// Object Constructor

				Persona persona = new Persona();
				persona.setApeMaterno(apellido);
				persona.setApePaterno("paterno");
				persona.setCarrera(carrera);
				persona.setCorreo(correo);
				persona.setDni(dni);
				persona.setNombre(nombre);
				persona.setUniversidad(universidad);
				Rol r = session.get(Rol.class, 4);
				persona.setRol(r);
				System.out.println("clase > " + persona);
				
				session.save(persona);
				

				Query query = session.createNativeQuery("select last_insert_id()");
				// Query query = session.createQuery("select ifnull(max(a.idinscripcion), 0)
				// from Inscripcion a");
				int idpersona = Integer.parseInt(query.getSingleResult().toString());
				System.out.println("idpersona insertada" + idpersona);

				StoredProcedureQuery querys1 = session.createStoredProcedureQuery("insertarDetalleInscripcion")
						.registerStoredProcedureParameter("idins", Integer.class, ParameterMode.IN)
						.registerStoredProcedureParameter("idp", Integer.class, ParameterMode.IN)
						.registerStoredProcedureParameter("nestado", Integer.class, ParameterMode.IN)
						.registerStoredProcedureParameter("salida", Integer.class, ParameterMode.OUT)
						.setParameter("idins", idsubscribe).setParameter("idp", idpersona).setParameter("nestado", 1);

				querys1.execute();

				int iddetalle = (int) querys1.getOutputParameterValue("salida");
				System.out.println("ultimo iddetalle insertado> " + iddetalle);

				

				//
				if (cont++ % 50 == 0) {
					session.flush();
					session.clear();
				}
				//
			}

			// ----------------------------------------------------------

			tx.commit();
			x = 1;

		} catch (HibernateException e) {
			if (tx != null)
				tx.rollback();
			e.printStackTrace();

		} finally {
			session.close();
		}
		
		System.out.println("respiesta del suscribir dao impl");
		return x;
	}

	public int update(Inscripcion d) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int delete(int id) {
		// TODO Auto-generated method stub
		return 0;
	}

	public Inscripcion read(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	public List<Map<String, Object>> readAll() {
		// TODO Auto-generated method stub
		return null;
	}

	public int maxId() {
		// TODO Auto-generated method stub
		Configuration cfg = new Configuration();
		cfg.configure("hibernate.cfg.xml");

		SessionFactory factory = cfg.buildSessionFactory();
		Session session = factory.openSession();

		s = HibernateUtils.getSessionFactory().openSession();
		Query query = s.createNativeQuery("select ifnull(max(idinscripcion)+1, 1) from Inscripcion");
		// Query query = session.createQuery("select ifnull(max(a.idinscripcion), 0)
		// from Inscripcion a");
		int max = Integer.parseInt(query.getSingleResult().toString());
		System.out.println("dao max " + max);

		s.close();
		return max;
	}

}
