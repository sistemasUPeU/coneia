package pe.edu.upeu.CONEIA.daoImpl;

import java.util.List;
import java.util.Map;

import javax.persistence.Query;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import pe.edu.upeu.CONEIA.dao.DetalleInscripcionDAO;
import pe.edu.upeu.CONEIA.entity.DetalleInscripcion;
import pe.edu.upeu.CONEIA.util.HibernateUtils;

@Repository
public class DetalleInscripcionDaoImpl implements DetalleInscripcionDAO {

	@Autowired
	private SessionFactory sessionFactory;

	public DetalleInscripcionDaoImpl() {
	}

	public DetalleInscripcionDaoImpl(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public void create(DetalleInscripcion d) {
		sessionFactory.getCurrentSession().save(d);
	}

	@Override
	public int update(DetalleInscripcion d) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete(int id) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public DetalleInscripcion read(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int maxIdDetalle() {
		// TODO Auto-generated method stub
		// Configuration cfg = new Configuration();
		// cfg.configure("hibernate.cfg.xml");
		//
		// SessionFactory factory = cfg.buildSessionFactory();
		// Session session = factory.openSession();
		//
		// // s= HibernateUtils.getSessionFactory().openSession();
		// Query query = s.createNativeQuery("select
		// ifnull(max(iddetalle_inscripcion)+1, 1) from detalle_inscripcion");
		// // Query query = session.createQuery("select ifnull(max(a.idinscripcion), 0)
		// // from Inscripcion a");
		// int max = Integer.parseInt(query.getSingleResult().toString());
		// System.out.println("dao detmax " + max);
		// s.close();
		return 1;
	}

	@Override
	public List<Map<String, Object>> readAll() {
		// TODO Auto-generated method stub
		return null;
	}

}
