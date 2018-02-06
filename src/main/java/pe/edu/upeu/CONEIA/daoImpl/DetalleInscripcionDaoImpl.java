package pe.edu.upeu.CONEIA.daoImpl;


import org.hibernate.SessionFactory;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import pe.edu.upeu.CONEIA.dao.DetalleInscripcionDAO;
import pe.edu.upeu.CONEIA.entity.DetalleInscripcion;


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

	

}
