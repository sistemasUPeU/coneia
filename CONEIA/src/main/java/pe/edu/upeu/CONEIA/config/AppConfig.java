package pe.edu.upeu.CONEIA.config;

import java.io.IOException;
import java.util.Properties;

import javax.sql.DataSource;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.orm.hibernate4.HibernateTransactionManager;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.web.multipart.MultipartResolver;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.config.annotation.DefaultServletHandlerConfigurer;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.JstlView;

import pe.edu.upeu.CONEIA.dao.DetalleInscripcionDAO;
import pe.edu.upeu.CONEIA.dao.InscripcionDAO;
import pe.edu.upeu.CONEIA.daoImpl.DetalleInscripcionDaoImpl;
import pe.edu.upeu.CONEIA.daoImpl.InscripcionDaoImpl;

@Configuration
@EnableWebMvc
@EnableTransactionManagement
@ComponentScan(basePackages = "pe.edu.upeu.CONEIA")

// @PropertySource(value = { "classpath:application.properties" })

public class AppConfig extends WebMvcConfigurerAdapter {

	@Autowired
	private Environment environment;

	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		// TODO Auto-generated method stub
		registry.addResourceHandler("/resources/**").addResourceLocations("/resources/");
		super.addResourceHandlers(registry);
	}

	@Bean
	public InternalResourceViewResolver viewResolver() {
		InternalResourceViewResolver viewResolver = new InternalResourceViewResolver();
		viewResolver.setViewClass(JstlView.class);
		viewResolver.setPrefix("/WEB-INF/views/");
		viewResolver.setSuffix(".jsp");

		return viewResolver;
	}

	@Override
	public void configureDefaultServletHandling(DefaultServletHandlerConfigurer configurer) {
		configurer.enable();
	}

	// @Bean
	// public DataSource getDataSource() {
	// DriverManagerDataSource dataSource = new DriverManagerDataSource();
	// dataSource.setDriverClassName("com.mysql.jdbc.Driver");
	// dataSource.setUrl("jdbc:mysql://localhost:3307/dbconeia");
	// dataSource.setUsername("root");
	// dataSource.setPassword("");
	// return dataSource;
	// }

	// private Properties hibernateProperties() {
	// Properties properties = new Properties();
	// properties.put("hibernate.dialect",
	// environment.getRequiredProperty("hibernate.dialect"));
	// properties.put("hibernate.show_sql",
	// environment.getRequiredProperty("hibernate.show_sql"));
	// properties.put("hibernate.format_sql",
	// environment.getRequiredProperty("hibernate.format_sql"));
	// return properties;
	// }
	//
	// @Bean
	// @Autowired
	// public HibernateTransactionManager transactionManager(SessionFactory s) {
	// HibernateTransactionManager txManager = new HibernateTransactionManager();
	// txManager.setSessionFactory(s);
	// return txManager;
	// }
	@Bean
	public MultipartResolver multipartResolver() throws IOException {
		CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver();
		multipartResolver.setMaxUploadSize((1024 * 1024) * 10);
		return multipartResolver;
	}

	@Bean
	public InscripcionDAO getInscripcionDAO() {
		return new InscripcionDaoImpl();
	}

	@Bean
	public DetalleInscripcionDAO getDetalleInscripcionDAO() {
		return new DetalleInscripcionDaoImpl();
	}

	@Bean
	public JavaMailSender getMailSender() {
		JavaMailSenderImpl mailSender = new JavaMailSenderImpl();

		// Using gmail
		mailSender.setHost("smtp.gmail.com");
		mailSender.setPort(587);
//		mailSender.setUsername("harolcotac@gmail.com");
		mailSender.setUsername("inscripciones.coneia@upeu.edu.pe");
//		mailSender.setPassword("gppcztdqrcanvpbg");
		mailSender.setPassword("iconeia2018");

		Properties javaMailProperties = new Properties();
		javaMailProperties.put("mail.smtp.starttls.enable", "true");
		javaMailProperties.put("mail.smtp.auth", "true");
		javaMailProperties.put("mail.transport.protocol", "smtp");
		javaMailProperties.put("mail.debug", "true");// Prints out everything on screen

		mailSender.setJavaMailProperties(javaMailProperties);
		return mailSender;
	}

}
