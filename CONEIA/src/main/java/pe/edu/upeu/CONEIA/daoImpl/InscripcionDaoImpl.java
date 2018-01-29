package pe.edu.upeu.CONEIA.daoImpl;



import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.persistence.ParameterMode;
import javax.persistence.Query;
import javax.persistence.StoredProcedureQuery;
import javax.sql.DataSource;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.mail.MailException;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import pe.edu.upeu.CONEIA.dao.InscripcionDAO;
import pe.edu.upeu.CONEIA.entity.DetalleInscripcion;
import pe.edu.upeu.CONEIA.entity.Inscripcion;
import pe.edu.upeu.CONEIA.entity.Persona;
import pe.edu.upeu.CONEIA.entity.Rol;
import pe.edu.upeu.CONEIA.entity.VistaDetalleInscripcion;
import pe.edu.upeu.CONEIA.util.HibernateUtils;

public class InscripcionDaoImpl implements InscripcionDAO {

	private static Session s;
	private Transaction tt;
	Gson gs = new Gson();

	public int create(Object obj, String str) {

		// TODO Auto-generated method stub

		System.out.println("dao impl string> " + str);
		// final Session s = HibernateUtils.getSessionFactory();
		Session s = HibernateUtils.getSessionFactory().openSession();
		Transaction tx = null;
		// int employeeID = null;
		int x = 0;
		int idsubscribe = 0;
		try {
			tx = s.beginTransaction();
			StoredProcedureQuery querys = s.createStoredProcedureQuery("insertarInscripcion")
					.registerStoredProcedureParameter("nestado", Integer.class, ParameterMode.IN)
					.registerStoredProcedureParameter("salida", Integer.class, ParameterMode.OUT)
					.setParameter("nestado", 0);

			// StoredProcedureQuery query =
			// this.em.createNamedStoredProcedureQuery("calculate");
			// query.setParameter("x", 1.23d);
			// query.setParameter("y", 4.56d);
			// query.execute();
			// Double sum = (Double) query.getOutputParameterValue("sum");
			querys.execute();

			idsubscribe = (int) querys.getOutputParameterValue("salida");
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
				String celular = gsonObj.get("celular").getAsString();
				String universidad = gsonObj.get("universidad").getAsString();
				int tipo = gsonObj.get("tipo").getAsInt();
				Double importe = gsonObj.get("importe").getAsDouble();
				System.out.println("importe "+importe);
				// // List of primitive elements
				// JsonArray demarcation = gsonObj.get("demarcation").getAsJsonArray();
				// List listDemarcation = new ArrayList();
				// for (JsonElement demarc : demarcation) {
				// listDemarcation.add(demarc.getAsString());
				// }

				// Object Constructor

				Persona persona = new Persona();
				persona.setApellidos(apellido);
				persona.setCarrera(carrera);
				persona.setCorreo(correo);
				persona.setDni(dni);
				persona.setNombre(nombre);
				persona.setUniversidad(universidad);
				persona.setCelular(celular);
				persona.setTipo(tipo);
				persona.setImporte(importe);

				Rol r = s.get(Rol.class, 4);
				persona.setRol(r);
				System.out.println("clase > " + persona);

				s.save(persona);

				Query query = s.createNativeQuery("select last_insert_id()");
				// Query query = session.createQuery("select ifnull(max(a.idinscripcion), 0)
				// from Inscripcion a");
				int idpersona = Integer.parseInt(query.getSingleResult().toString());
				System.out.println("idpersona insertada" + idpersona);

				StoredProcedureQuery querys1 = s.createStoredProcedureQuery("insertarDetalleInscripcion")
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
					s.flush();
					s.clear();
				}
				//
			}

			// ----------------------------------------------------------

			tx.commit();
			x = 1;

		} catch (HibernateException e) {
			if (tx != null)
				tx.rollback();
			idsubscribe = 0;
			e.printStackTrace();

			System.out.println("Error dao impl insertar inscripcion>" + e);

		} finally {
			s.close();
		}

		System.out.println("respiesta del suscribir dao impl" + idsubscribe);
		return idsubscribe;
	}

	public int update(Inscripcion d) {
		// TODO Auto-generated method stub
		System.out.println("dao imp nro>" + d.getNroVoucher());
		System.out.println("dao imp id>" +d.getIdinscripcion());
		System.out.println("dao imp url>" +d.getUrlVoucher());
		int x = 0;
		// final Session s = HibernateUtils.getSessionFactory();
//		try {

			Session s = HibernateUtils.getSessionFactory().openSession();
			tt = s.beginTransaction();

			StoredProcedureQuery querys2 = s.createStoredProcedureQuery("updateInscripcion")
					.registerStoredProcedureParameter("id", Integer.class, ParameterMode.IN)
					.registerStoredProcedureParameter("url", String.class, ParameterMode.IN)
					.registerStoredProcedureParameter("voucher", String.class, ParameterMode.IN)
					.setParameter("id", d.getIdinscripcion()).setParameter("url", d.getUrlVoucher())
					.setParameter("voucher", d.getNroVoucher());

			// StoredProcedureQuery query =
			// this.em.createNamedStoredProcedureQuery("calculate");
			// query.setParameter("x", 1.23d);
			// query.setParameter("y", 4.56d);
			// query.execute();
			// Double sum = (Double) query.getOutputParameterValue("sum");
			querys2.execute();
			tt.commit();
			x = 1;
			System.out.println("casi final");
			s.close();
//		} catch (Exception e) {
//			// TODO: handle exception
//			tt.rollback();
//			System.out.println("Error" + e);
//		} finally {
//			s.close();
//		}
		return x;
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

	@SuppressWarnings("unchecked")
	public List<DetalleInscripcion> PendientesPersonales() {
		// TODO Auto-generated method stub

		List<DetalleInscripcion> lista = new ArrayList<>();

		// private Session se = HibernateUtils.getSessionFactory();
		Session s = HibernateUtils.getSessionFactory().openSession();
		// final Session s = HibernateUtils.getSessionFactory();
		try {

			// Query query0 = s.createQuery("select d from DetalleInscripcion d join
			// d.persona a where a.tipo = 1");
			Query query = s.createQuery(
					"select d from DetalleInscripcion d join d.persona a join d.inscripcion b join VistaDetalleInscripcion c on c.id.idinscripcion = b.idinscripcion where b.estado = 0 and c.id.cuenta = 1 ");
			// Query query1 = s.createQuery("select a from VistaDetalleInscripcion a where
			// a.id.cuenta = 1");

			lista = query.getResultList();

			// System.out.println(query.getResultList());
			System.out.println("dao impl lista> " + lista);

		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("Error lista pendientes personales, dao impl " + e);
		} finally {

		}

		return lista;
	}

	@SuppressWarnings("unchecked")
	public List<DetalleInscripcion> PendientesDelegacion() {
		// TODO Auto-generated method stub
		List<DetalleInscripcion> lista = new ArrayList<>();
		// List<VistaDetalleInscripcion> lista1 = new ArrayList<>();
		// private Session se = HibernateUtils.getSessionFactory();

		Session s = HibernateUtils.getSessionFactory().openSession();
		// final Session s = HibernateUtils.getSessionFactory();
		try {

			Query query = s.createQuery(
					"select d from DetalleInscripcion d join d.persona a join d.inscripcion b join VistaDetalleInscripcion c on c.id.idinscripcion = b.idinscripcion where b.estado = 0 and c.id.cuenta != 1 ");

			lista = query.getResultList();

			System.out.println("dao impl lista delegacion> " + lista);

		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("Error lista pendientes delegacion, dao impl " + e);
		} finally {

		}

		return lista;
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> getEmails(int id) {
		// TODO Auto-generated method stub

		List<DetalleInscripcion> lista = new ArrayList<>();
		List<Map<String, Object>> emails = new ArrayList<>();
		Session s = HibernateUtils.getSessionFactory().openSession();
		// final Session s = HibernateUtils.getSessionFactory();
		try {
			Map<String, Object> map = null;

			Query query = s.createQuery(
					"select d from DetalleInscripcion d join d.persona a join d.inscripcion b where b.idinscripcion = :idinscripcion ");
			query.setParameter("idinscripcion", id);

			lista = query.getResultList();

			// System.out.println(query.getResultList());
			System.out.println("dao impl lista emails> " + lista);

			for (DetalleInscripcion c : lista) {
				System.out.println("entro a reccorer");
				map = new HashMap<>();
				map.put("email", c.getPersona().getCorreo());
				map.put("idinscripcion", c.getInscripcion().getIdinscripcion());
				map.put("nombre", c.getPersona().getNombre());
				map.put("apellidos", c.getPersona().getApellidos());
				// map.put("idinscripcion", lista.get(j).getInscripcion().getIdinscripcion());
				// map.put("voucher", lista.get(j).getInscripcion().getNroVoucher());
				// map.put("iddetalle", lista.get(j).getIddetalleInscripcion());
				System.out.println(map);
				emails.add(map);

			}
			System.out.println("convertido >>> " + emails);

		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("Error getting emails, dao impl " + e);
		} finally {

		}

		return emails;
	}

	public int updateState(int id, int estado) {
		// TODO Auto-generated method stub
		int x = 0;

		Session s = HibernateUtils.getSessionFactory().openSession();
		try {

			tt = s.beginTransaction();

			StoredProcedureQuery querys3 = s.createStoredProcedureQuery("updateEstadoInscripcion")
					.registerStoredProcedureParameter("id", Integer.class, ParameterMode.IN)
					.registerStoredProcedureParameter("nestado", Integer.class, ParameterMode.IN).setParameter("id", id)
					.setParameter("nestado", estado);

			querys3.execute();
			tt.commit();
			System.out.println("procedimiento update realizado");
			x = estado;
		} catch (Exception e) {
			// TODO: handle exception
			tt.rollback();
			System.out.println("Error update estado inscripcion" + e);
		} finally {
			s.close();
		}
		return x;

	}
	
	

	private Date cambiarFecha(String fechac) throws ParseException {
		String pattern = "yyyy-MM-dd";
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat(pattern);

		Date date = simpleDateFormat.parse(fechac);
		return date;
	}

	@SuppressWarnings("unchecked")
	public List<DetalleInscripcion> Personal(String fecha) {
		// TODO Auto-generated method stub
		System.out.println("dao imp personal");
		Date fechain = null;
		try {
			fechain = cambiarFecha(fecha);
		} catch (ParseException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		System.out.println("fecha" + fechain);
		List<DetalleInscripcion> lista5 = new ArrayList<>();

		Session s = HibernateUtils.getSessionFactory().openSession();

		try {

			Query query = s.createQuery(
					"select d from DetalleInscripcion d join d.persona a join d.inscripcion b join VistaDetalleInscripcion c on c.id.idinscripcion = b.idinscripcion where c.id.cuenta = 1 and b.estado = 1 and a.tipo=1 and b.fecha = :fecha");
			query.setParameter("fecha", fechain);
			
			
//			query.setParameter("universidad", uni);
			lista5 = query.getResultList();

			System.out.println("dao impl lista personal> " + lista5);

		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("Error PersonalUpeu, dao impl " + e);
		} finally {

		}

		return lista5;
	}

//	@SuppressWarnings("unchecked")
//	public List<DetalleInscripcion> PersonalExternos(String fecha, String uni) {
//		// TODO Auto-generated method stub
//		List<DetalleInscripcion> lista6 = new ArrayList<>();
//
//		Session s = HibernateUtils.getSessionFactory().openSession();
//
//		try {
//
//			Query query = s.createQuery(
//					"select d from DetalleInscripcion d join d.persona a join d.inscripcion b join VistaDetalleInscripcion c on c.id.idinscripcion = b.idinscripcion where c.id.cuenta = 1 and b.estado = 1 and a.tipo=1 and b.fecha = :fecha and a.universidad != :universidad");
//			query.setParameter("fecha", fecha);
//			query.setParameter("universidad", uni);
//			lista6 = query.getResultList();
//
//			System.out.println("dao impl lista delegacion> " + lista6);
//
//		} catch (Exception e) {
//			// TODO: handle exception
//			System.out.println("Error PersonalExternos, dao impl " + e);
//		} finally {
//
//		}
//
//		return lista6;
//	}
//	
//	
//	
//	@SuppressWarnings("unchecked")
//	public List<DetalleInscripcion> PersonalProfesionales(String fecha) {
//		// TODO Auto-generated method stub
//		List<DetalleInscripcion> lista7 = new ArrayList<>();
//
//		Session s = HibernateUtils.getSessionFactory().openSession();
//
//		try {
//
//			Query query = s.createQuery(
//					"select d from DetalleInscripcion d join d.persona a join d.inscripcion b join VistaDetalleInscripcion c on c.id.idinscripcion = b.idinscripcion where c.id.cuenta = 1 and b.estado = 1 and a.tipo=2 and b.fecha = :fecha");
//			query.setParameter("fecha", fecha);
//
//			lista7 = query.getResultList();
//
//			System.out.println("dao impl lista delegacion> " + lista7);
//
//		} catch (Exception e) {
//			// TODO: handle exception
//			System.out.println("Error PersonalProfesionales, dao impl " + e);
//		} finally {
//
//		}
//
//		return lista7;
//	}
//	
//	
	@SuppressWarnings("unchecked")
	public List<DetalleInscripcion> Delegacion(String fecha) {
		// TODO Auto-generated method stub
		System.out.println("dao imp delegacion");
		Date fechainside = null;
		try {
			fechainside = cambiarFecha(fecha);
		} catch (ParseException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		List<DetalleInscripcion> lista8 = new ArrayList<>();

		Session s = HibernateUtils.getSessionFactory().openSession();

		try {

			Query query = s.createQuery(
					"select d from DetalleInscripcion d join d.persona a join d.inscripcion b join VistaDetalleInscripcion c on c.id.idinscripcion = b.idinscripcion where c.id.cuenta != 1 and b.estado = 1 and a.tipo=1 and b.fecha = :fecha");
			query.setParameter("fecha", fechainside);


			lista8 = query.getResultList();

			System.out.println("dao impl lista delegacion> " + lista8);

		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("Error PersonalProfesionales, dao impl " + e);
		} finally {

		}

		return lista8;
	}
//	
//	@SuppressWarnings("unchecked")
//	public List<DetalleInscripcion> DelegacionExternos(String fecha, String uni) {
//		// TODO Auto-generated method stub
//		List<DetalleInscripcion> lista9 = new ArrayList<>();
//
//		Session s = HibernateUtils.getSessionFactory().openSession();
//
//		try {
//
//			Query query = s.createQuery(
//					"select d from DetalleInscripcion d join d.persona a join d.inscripcion b join VistaDetalleInscripcion c on c.id.idinscripcion = b.idinscripcion where c.id.cuenta = 1 and b.estado = 1 and a.tipo=2 and b.fecha = :fecha and a.universidad = :universidad");
//			query.setParameter("fecha", fecha);
//			query.setParameter("universidad", uni);
//
//			lista9 = query.getResultList();
//
//			System.out.println("dao impl lista delegacion> " + lista9);
//
//		} catch (Exception e) {
//			// TODO: handle exception
//			System.out.println("Error PersonalProfesionales, dao impl " + e);
//		} finally {
//
//		}
//
//		return lista9;
//	}
	

}
