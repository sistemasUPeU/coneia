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

		return properties;
	}
	
	
	@Bean
	public HibernateTransactionManager transactionManager(SessionFactory sessionFactory) {
		HibernateTransactionManager txManager = new HibernateTransactionManager();
		txManager.setSessionFactory(sessionFactory);
		return txManager;
	}
	
	
	
	
	
	
	
	
	
	
	
	
}
