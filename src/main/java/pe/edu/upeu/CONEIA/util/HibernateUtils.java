package pe.edu.upeu.CONEIA.util;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.boot.Metadata;
import org.hibernate.boot.MetadataSources;
import org.hibernate.boot.registry.BootstrapServiceRegistry;
import org.hibernate.boot.registry.BootstrapServiceRegistryBuilder;
import org.hibernate.boot.registry.StandardServiceRegistry;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;

public class HibernateUtils {

	// 1ER METODO
	// private static SessionFactory sf;
	// static {
	// sf= new
	// Configuration().configure("/hibernate.cfg.xml").buildSessionFactory();
	// }
	// public static SessionFactory getSessionFactory() {
	// return sf;
	// }

	// 2DO METODO

//	private static SessionFactory sessionFactory;
//
//	//
//	public static SessionFactory getSessionFactory() {
//		if (sessionFactory == null) {
//			// loads configuration and mappings
//			Configuration configuration = new Configuration().configure();
//			ServiceRegistry serviceRegistry = new StandardServiceRegistryBuilder()
//					.applySettings(configuration.getProperties()).build();
//
//			// builds a session factory from the service registry
//			sessionFactory = configuration.buildSessionFactory(serviceRegistry);
//		}
//
//		return sessionFactory;
//	}

	// 3ER METODO

//	private static SessionFactory sessionFactory;

	// static {
	// try {
	// StandardServiceRegistry standardRegistry =
	// new StandardServiceRegistryBuilder().configure("hibernate.cfg.xml").build();
	// Metadata metaData =
	// new MetadataSources(standardRegistry).getMetadataBuilder().build();
	// sessionFactory = metaData.getSessionFactoryBuilder().build();
	// } catch (Throwable th) {
	// System.err.println("Enitial SessionFactory creation failed" + th);
	// throw new ExceptionInInitializerError(th);
	// }
	// }
	//
	//
	// public static SessionFactory getSessionFactory() {
	// return sessionFactory;
	// }

	
// 4TO METODO
	

	
}
