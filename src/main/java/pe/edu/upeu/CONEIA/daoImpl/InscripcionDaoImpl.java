package pe.edu.upeu.CONEIA.daoImpl;

import java.text.DateFormat;
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
import org.springframework.stereotype.Repository;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import pe.edu.upeu.CONEIA.dao.InscripcionDAO;
import pe.edu.upeu.CONEIA.entity.Configuracion;
import pe.edu.upeu.CONEIA.entity.DetalleInscripcion;
import pe.edu.upeu.CONEIA.entity.Inscripcion;
import pe.edu.upeu.CONEIA.entity.Persona;
import pe.edu.upeu.CONEIA.entity.Rol;
import pe.edu.upeu.CONEIA.entity.Taller;
import pe.edu.upeu.CONEIA.entity.VistaDetalleInscripcion;
import pe.edu.upeu.CONEIA.util.HibernateUtils;

@Repository
public class InscripcionDaoImpl implements InscripcionDAO {

	@Autowired
	private SessionFactory sessionFactory;

	public InscripcionDaoImpl() {
	}

	public InscripcionDaoImpl(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	public int create(Object obj, String str) {

		// TODO Auto-generated method stub

		System.out.println("dao impl string> " + str);

		Session s = sessionFactory.getCurrentSession();

		int x = 0;
		int idsubscribe = 0;
		try {

			StoredProcedureQuery querys = s.createStoredProcedureQuery("insertarInscripcion")
					.registerStoredProcedureParameter("nestado", Integer.class, ParameterMode.IN)
					.registerStoredProcedureParameter("salida", Integer.class, ParameterMode.OUT)
					.setParameter("nestado", 0);

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
				System.out.println("importe " + importe);

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
				persona.setPassword(dni);
				persona.setUpdate_pass(0);

				Rol r = s.get(Rol.class, 6);
				persona.setRol(r);
				System.out.println("clase > " + persona);

				s.save(persona);

				Query query = s.createNativeQuery("select last_insert_id()");

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

			x = 1;

		} catch (HibernateException e) {

			idsubscribe = 0;
			e.printStackTrace();

			System.out.println("Error dao impl insertar inscripcion>" + e);

		} finally {
			// s.close();
		}

		System.out.println("respiesta del suscribir dao impl" + idsubscribe);
		return idsubscribe;
	}

	public int update(Inscripcion d) {
		// TODO Auto-generated method stub

		int x = 0;
		Session s = sessionFactory.getCurrentSession();

		StoredProcedureQuery querys2 = s.createStoredProcedureQuery("updateInscripcion")
				.registerStoredProcedureParameter("id", Integer.class, ParameterMode.IN)
				.registerStoredProcedureParameter("url", String.class, ParameterMode.IN)
				.registerStoredProcedureParameter("voucher", String.class, ParameterMode.IN)
				.setParameter("id", d.getIdinscripcion()).setParameter("url", d.getUrlVoucher())
				.setParameter("voucher", d.getNroVoucher());

		querys2.execute();

		x = 1;
		System.out.println("casi final");
		return x;
	}

	public int delete(int id) throws ParseException {
		// TODO Auto-generated method stub
		System.out.println("id de inscripcion" + id);
		int x = 0;
		Date date = new Date();
		
		//Caso 2: obtener la fecha y salida por pantalla con formato:
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		System.out.println("Fecha: "+dateFormat.format(date));
		String fecha = dateFormat.format(date);
		 Date today = dateFormat.parse(fecha);
		try {
			Session s = sessionFactory.getCurrentSession();
	    	Inscripcion t = s.get(Inscripcion.class, id);
	    	t.setEstado(3);
	    	t.setFechaUpdate(today);
	    	
	    	s.update(t);	
	    	x=1;
		} catch (HibernateException e) {
			System.out.println("Error al eliminar inscripcion: "+e);
		}
		return x;
	}

	@SuppressWarnings("unchecked")
	public List<DetalleInscripcion> PendientesPersonales() {
		// TODO Auto-generated method stub

		List<DetalleInscripcion> lista = new ArrayList<>();

		Session s = sessionFactory.getCurrentSession();
		try {

			Query query = s.createQuery(
					"select d from DetalleInscripcion d join fetch d.persona a join fetch d.inscripcion b join fetch VistaDetalleInscripcion c on c.idinscripcion = b.idinscripcion where b.estado = 0 and c.cuenta = 1 ");

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

		Session s = sessionFactory.getCurrentSession();

		try {

			Query query = s.createQuery(
					"select d from DetalleInscripcion d join fetch d.persona a join fetch d.inscripcion b join fetch VistaDetalleInscripcion c on c.idinscripcion = b.idinscripcion where b.estado = 0 and c.cuenta != 1 ");

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
	public List<Map<String, Object>> getEmails(int id, int opcion) {
		// TODO Auto-generated method stub

		List<DetalleInscripcion> lista = new ArrayList<>();
		List<Map<String, Object>> emails = new ArrayList<>();

		Session s = sessionFactory.getCurrentSession();

		try {
			Map<String, Object> map = null;
			Query query = null;
			if (opcion == 1) {
				// obtener correo personal
				query = s.createQuery(
						"select d from DetalleInscripcion d join fetch d.persona a join fetch d.inscripcion b where b.idinscripcion = :idinscripcion");
				query.setParameter("idinscripcion", id);
			} else {
				// obtener correo del delegado
				query = s.createQuery(
						"select d from DetalleInscripcion d join fetch d.persona a join fetch d.inscripcion b where b.idinscripcion = :idinscripcion and a.tipo = 3");
				query.setParameter("idinscripcion", id);
			}

			lista = query.getResultList();

			System.out.println("dao impl lista emails> " + lista);

			for (DetalleInscripcion c : lista) {
				System.out.println("entro a reccorer");
				map = new HashMap<>();
				map.put("email", c.getPersona().getCorreo());
				map.put("idinscripcion", c.getInscripcion().getIdinscripcion());
				map.put("nombre", c.getPersona().getNombre());
				map.put("apellidos", c.getPersona().getApellidos());

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
		Session s = sessionFactory.getCurrentSession();
		try {

			StoredProcedureQuery querys3 = s.createStoredProcedureQuery("updateEstadoInscripcion")
					.registerStoredProcedureParameter("id", Integer.class, ParameterMode.IN)
					.registerStoredProcedureParameter("nestado", Integer.class, ParameterMode.IN).setParameter("id", id)
					.setParameter("nestado", estado);

			querys3.execute();
			System.out.println("procedimiento update realizado");
			x = estado;
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("Error update estado inscripcion" + e);
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
		Session s = sessionFactory.getCurrentSession();

		try {

			Query query = s.createQuery(
					"select d from DetalleInscripcion d join fetch d.persona a join fetch d.inscripcion b join fetch VistaDetalleInscripcion c on c.idinscripcion = b.idinscripcion where c.cuenta = 1 and b.estado = 1 and b.fecha = :fecha");
			query.setParameter("fecha", fechain);

			lista5 = query.getResultList();

			System.out.println("dao impl lista personal> " + lista5);

		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("Error PersonalUpeu, dao impl " + e);
		} finally {

		}

		return lista5;
	}

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
		Session s = sessionFactory.getCurrentSession();

		try {

			Query query = s.createQuery(
					"select d from DetalleInscripcion d join fetch d.persona a join fetch  d.inscripcion b join fetch VistaDetalleInscripcion c on c.idinscripcion = b.idinscripcion where c.cuenta != 1 and b.estado = 1 and b.fecha = :fecha");
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

	@SuppressWarnings("unchecked")
	public List<DetalleInscripcion> AprobadosPersonal() {
		// TODO Auto-generated method stub

		List<DetalleInscripcion> lista9 = new ArrayList<>();

		Session f = sessionFactory.getCurrentSession();

		try {

			Query query = f.createQuery(
					"select d from DetalleInscripcion d join fetch d.persona a join fetch d.inscripcion b join fetch VistaDetalleInscripcion c on c.idinscripcion = b.idinscripcion where c.cuenta = 1 and b.estado = 1");

			// query.setParameter("universidad", uni);
			lista9 = query.getResultList();

			System.out.println("dao impl lista personal aprobados> " + lista9);

		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("Error Personal aprobados, dao impl " + e);
		} finally {
			// s.close();
		}

		return lista9;
	}

	@SuppressWarnings("unchecked")
	public List<DetalleInscripcion> AceptadosDelegacion() {
		// TODO Auto-generated method stub

		List<DetalleInscripcion> lista10 = new ArrayList<>();
		Session g = sessionFactory.getCurrentSession();
		try {

			Query query = g.createQuery(
					"select d from DetalleInscripcion d join fetch d.persona a join fetch d.inscripcion b join fetch VistaDetalleInscripcion c on c.idinscripcion = b.idinscripcion where c.cuenta != 1 and b.estado = 1");

			lista10 = query.getResultList();

			System.out.println("dao impl lista delegacion aprobados> " + lista10);

		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("Error Delegacion lista aprobados, dao impl " + e);
		} finally {
			// s.close();
		}

		return lista10;
	}

}
