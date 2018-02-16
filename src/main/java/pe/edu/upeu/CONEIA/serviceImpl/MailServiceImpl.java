package pe.edu.upeu.CONEIA.serviceImpl;


import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailException;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Service;


import com.google.gson.Gson;

import pe.edu.upeu.CONEIA.service.MailService;




@Service("mailService")

public class MailServiceImpl implements MailService {

	@Autowired
	JavaMailSender mailSender;

	Gson gs= new Gson();

	public void sendEmail( String[] email,String[] nombre,String[] apellidos,  String header,  String body, String footer) {

		
		int currentSize = email.length;
 
		 System.out.println("mail service emails" );
		for (String element:email ) {
		
		    System.out.println( element );
		}
		 System.out.println("mail service nombres" );
		for (String element:nombre ) {
			
		    System.out.println( element );
		}
		 System.out.println("mail service apellidos" );
		for (String element:apellidos ) {
			
		    System.out.println( gs.toJson(element) );
		}
		
		
		
		
		
//		-----------------------
		
		for (int j=0; j < email.length; j++)
		{
			
			
			System.out.println("var posicion> " + j);
			System.out.println("valor en el array> " +email [j] +", "+ nombre[j]+", "+  apellidos[j]);

			 MimeMessagePreparator preparator = getMessagePreparator(email[j], nombre[j], apellidos[j], header, body, footer);
				
				try {
					mailSender.send(preparator);
					
					System.out.println("Message Send...Hurrey");
				} catch (MailException ex) {
					System.err.println(ex.getMessage());
				}
			 
		}
		
	}

	
	
	private MimeMessagePreparator getMessagePreparator( String to, String name, String ape, String header, String body, String footer) {


		MimeMessagePreparator preparator1 = new MimeMessagePreparator() {
			 @Override
			   public void prepare(MimeMessage mimeMessage) throws MessagingException {
				 
				 
			     MimeMessageHelper message = new MimeMessageHelper(mimeMessage, true, "UTF-8");

			     message.setFrom("inscripciones.coneia@upeu.edu.pe");
			     message.setTo(to);
			     message.setSubject("INSCRIPCIONES CONEIA 2018 - UPeU, Lima");
			     
			     message.setText(header +"\t\r" + 
			    		 ape+", " + name+ ". " + body +"\t\r" + footer, false);
			     

			   }
			 };
		
		
		return preparator1;
	}



	@Override
	public int sendEmail(String email, String nombre, String apellidos, String header, String body, String footer) {
		
		 MimeMessagePreparator preparator = getMessagePreparatorSingular(email, nombre, apellidos, header, body, footer);
			int x =0;
			try {
				mailSender.send(preparator);
				
				System.out.println("Message Send...Hurrey");
				x = 1;
			} catch (MailException ex) {
				System.err.println(ex.getMessage());
			}
			return x;
	}


	
	private MimeMessagePreparator getMessagePreparatorSingular( String to, String name, String ape, String header, String body, String footer) {


		MimeMessagePreparator preparator1 = new MimeMessagePreparator() {
			 @Override
			   public void prepare(MimeMessage mimeMessage) throws MessagingException {
				 
				 
			     MimeMessageHelper message = new MimeMessageHelper(mimeMessage, true, "UTF-8");

			     message.setFrom("inscripciones.coneia@upeu.edu.pe");
			     message.setTo(to);
			     message.setSubject("RECUPERACIÓN DE CONTRASEÑA CONEIA 2018");
			     
			     message.setText(header +"\t\r" + 
			    		 ape+", " + name+ ". " + body +"\t\r" + footer, false);
			     

			   }
			 };
		
		
		return preparator1;
	}



}
