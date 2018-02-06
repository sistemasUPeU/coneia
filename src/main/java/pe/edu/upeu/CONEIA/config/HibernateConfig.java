package pe.edu.upeu.CONEIA.config;

import java.util.Properties;

import javax.sql.DataSource;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.AvailableSettings;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.orm.hibernate5.HibernateTransactionManager;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.transaction.annotation.EnableTransactionManagement;



@Configuration
@PropertySource("classpath:application.properties")
@EnableTransactionManagement
@ComponentScan(basePackages = "pe.edu.upeu.CONEIA")
public class HibernateConfig {
	
	@Autowired
	private Environment env;

//	@Bean
//	public LocalSessionFactoryBean getSessionFactory() {
//		LocalSessionFactoryBean factoryBean = new LocalSessionFactoryBean();
//
//		Properties props = new Properties();
//		// Setting JDBC properties
//		props.put(DRIVER, env.getProperty("mysql.driver"));
//		props.put(URL, env.getProperty("mysql.url"));
//		props.put(USER, env.getProperty("mysql.user"));
//		props.put(PASS, env.getProperty("mysql.password"));
//		
//		// Setting Hibernate properties
//		props.put(SHOW_SQL, env.getProperty("hibernate.show_sql"));
//		props.put(DIALECT, env.getProperty("hibernate.dialect"));
////		props.put(HBM2DDL_AUTO, env.getProperty("hibernate.hbm2ddl.auto"));
//
//		// Setting C3P0 properties
////		props.put(C3P0_MIN_SIZE, env.getProperty("hibernate.c3p0.min_size"));
////		props.put(C3P0_MAX_SIZE, env.getProperty("hibernate.c3p0.max_size"));
////		props.put(C3P0_ACQUIRE_INCREMENT, env.getProperty("hibernate.c3p0.acquire_increment"));
////		props.put(C3P0_TIMEOUT, env.getProperty("hibernate.c3p0.timeout"));
////		props.put(C3P0_MAX_STATEMENTS, env.getProperty("hibernate.c3p0.max_statements"));
//
//		factoryBean.setHibernateProperties(props);
////		factoryBean.setAnnotatedClasses(Inscripcion.class);
////		factoryBean.setAnnotatedClasses(DetalleInscripcion.class);
////		factoryBean.setAnnotatedClasses(DetallePrivilegio.class);
////		factoryBean.setAnnotatedClasses(InscripcionTaller.class);
////		factoryBean.setAnnotatedClasses(Persona.class);
////		factoryBean.setAnnotatedClasses(Privilegio.class);
////		factoryBean.setAnnotatedClasses(Rol.class);
////		factoryBean.setAnnotatedClasses(Taller.class);
////		factoryBean.setAnnotatedClasses(Tipo.class);
////		factoryBean.setAnnotatedClasses(VistaDetalleInscripcion.class);
////		factoryBean.setAnnotatedClasses(VistaDetalleInscripcionId.class);
////		
//		return factoryBean;
//	}
//
//	@Bean
//	public HibernateTransactionManager getTransactionManager() {
//		HibernateTransactionManager transactionManager = new HibernateTransactionManager();
//		transactionManager.setSessionFactory(getSessionFactory().getObject());
//		return transactionManager;
//	}
//	
	@Bean
	public DataSource getDataSource() {
		DriverManagerDataSource dataSource = new DriverManagerDataSource();
		dataSource.setDriverClassName(env.getRequiredProperty("mysql.driver"));
		dataSource.setUrl(env.getRequiredProperty("mysql.url"));
		dataSource.setUsername(env.getRequiredProperty("mysql.user"));
		dataSource.setPassword(env.getRequiredProperty("mysql.password"));
		return dataSource;
	}

	
	@Bean
	public LocalSessionFactoryBean getSessionFactory() {
		LocalSessionFactoryBean sessionFactory = new LocalSessionFactoryBean();
		sessionFactory.setDataSource(getDataSource());
		sessionFactory.setPackagesToScan(new String[] { "pe.edu.upeu.CONEIA.entity" });
		sessionFactory.setHibernateProperties(getHibernateProperties());
		return sessionFactory;
	}

	private Properties getHibernateProperties() {
		Properties properties = new Properties();
		properties.put(AvailableSettings.DIALECT, env.getRequiredProperty("hibernate.dialect"));
		properties.put(AvailableSettings.SHOW_SQL, env.getRequiredProperty("hibernate.show_sql"));
		properties.put(AvailableSettings.CURRENT_SESSION_CONTEXT_CLASS, env.getRequiredProperty("hibernate.current.session.context.class"));
		properties.put(AvailableSettings.FORMAT_SQL, env.getRequiredProperty("hibernate.format_sql"));

		
//		properties.put(AvailableSettings.STATEMENT_BATCH_SIZE, env.getRequiredProperty("hibernate.batch.size"));
//		properties.put(AvailableSettings.HBM2DDL_AUTO, env.getRequiredProperty("hibernate.hbm2ddl.auto"));
//		properties.put(AvailableSettings.CURRENT_SESSION_CONTEXT_CLASS, env.getRequiredProperty("hibernate.current.session.context.class"));
		return properties;
	}
	
	
	@Bean
	public HibernateTransactionManager transactionManager(SessionFactory sessionFactory) {
		HibernateTransactionManager txManager = new HibernateTransactionManager();
		txManager.setSessionFactory(sessionFactory);
		return txManager;
	}
	
	
	
	
	
	
	
	
	
	
	
	
}
