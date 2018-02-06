package pe.edu.upeu.CONEIA.serviceImpl;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.FileSystemResource;
import org.springframework.mail.MailException;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.google.gson.Gson;

import pe.edu.upeu.CONEIA.entity.Persona;
import pe.edu.upeu.CONEIA.service.MailService;




@Service("mailService")

public class MailServiceImpl implements MailService {

	@Autowired
	JavaMailSender mailSender;

	Gson gs= new Gson();

	public void sendEmail( String[] email,String[] nombre,String[] apellidos,  String header,  String body, String footer) {

//		Persona order = (Persona) object;

		
		int currentSize = email.length;
//		int newSize = currentSize + 1;
//		String[] tempArray = new String[ newSize ];
//		String[] tempArrayName = new String[ newSize ];
//		String[] tempArrayApe = new String[ newSize ];
//		for (int i=0; i < currentSize; i++)
//		{
//		    tempArray[i] = email [i];
//		    tempArrayName[i] = nombre [i];
//		    tempArrayApe[i] = apellidos [i];
//		    
//		}
////		tempArray[newSize- 1] = "reyna_b@upeu.edu.pe ";
//		tempArray[newSize- 1] = "harolcotac@gmail.com";
////		tempArrayName[newSize- 1] = "David Benjamin";
//		tempArrayName[newSize- 1] = "Enrique";
////		tempArrayApe[newSize- 1] = "Reyna Barreto";
//		tempArrayApe[newSize- 1] = "Cotacallapa Mamani";
//		email = tempArray;  
//		nombre = tempArrayName;  
//		apellidos = tempArrayApe;  
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
//			array[j] = email [pos_start];
//			arrayname[j] = nombre [pos_start];
//			arrayape[j] = apellidos [pos_start];
//			 pos_start++;
			 
			 MimeMessagePreparator preparator = getMessagePreparator(email[j], nombre[j], apellidos[j], header, body, footer);
				
				try {
					mailSender.send(preparator);
					
					System.out.println("Message Send...Hurrey");
				} catch (MailException ex) {
					System.err.println(ex.getMessage());
				}
			 
		}
		
		
		
		
//		--------------------
		
		
//		
//		
//		
//		
//		int count = 0;
//		int nroemails = email.length;
//		int cociente = nroemails/50;
//		int residuo = nroemails%50;
//		
//		int totalarrays = cociente + 1;	
//		
//		
//		 int pos_start=0;
//		for (int i=0; i < totalarrays; i++)
//			
//		{
////			
//			 System.out.println("numero de array> "+ i);
//			if ( i == totalarrays-1) {
//				String[] lastarrayemail = new String[ residuo ];
//				String[] lastarrayname = new String[ residuo ];
//				String[] lastarrayape = new String[ residuo ];
//				for (int k=0; k < residuo; k++)
//				{
//					System.out.println("residuo> " + residuo);
//					System.out.println(nroemails);
//					System.out.println("var posicion last> " + pos_start);
//					System.out.println("valor en el lastarray> " +email [pos_start] + ", " + nombre [pos_start] + ", " +apellidos [pos_start]);
//					lastarrayemail[k] = email [pos_start];
//					lastarrayname[k] = nombre [pos_start];
//					lastarrayape[k] = apellidos [pos_start];
//					 pos_start++;
//					 
//						MimeMessagePreparator preparator = getMessagePreparator(lastarrayemail[k], lastarrayname[k], lastarrayape[k], message );
//						
//						try {
//							mailSender.send(preparator);
//							
//							System.out.println("Message Send...Hurrey");
//						} catch (MailException ex) {
//							System.err.println(ex.getMessage());
//						}
//					 
//				}
//				
////				
//		
//				
//				
//				
//			}else {
//				String[] array = new String[ 50 ];
//				String[] arrayname = new String[ 50 ];
//				String[] arrayape = new String[ 50 ];
//				for (int j=0; j < 50; j++)
//				{
//					
//					System.out.println(nroemails);
//					System.out.println("var posicion> " + pos_start);
//					System.out.println("valor en el array> " +email [pos_start]);
//					array[j] = email [pos_start];
//					arrayname[j] = nombre [pos_start];
//					arrayape[j] = apellidos [pos_start];
//					 pos_start++;
//					 
//					 MimeMessagePreparator preparator = getMessagePreparator(array[j], arrayname[j], arrayape[j], message);
//						
//						try {
//							mailSender.send(preparator);
//							
//							System.out.println("Message Send...Hurrey");
//						} catch (MailException ex) {
//							System.err.println(ex.getMessage());
//						}
//					 
//				}
//				
//				
//				
//				
//			}
			
//			pos_start += 1;
			
//		}
		

		
	}

	
	
	private MimeMessagePreparator getMessagePreparator( String to, String name, String ape, String header, String body, String footer) {

//		MimeMessagePreparator preparator = new MimeMessagePreparator() {
//
//			public void prepare(MimeMessage mimeMessage) throws Exception {
//				mimeMessage.setFrom("harolcotac@gmail.com");
//				mimeMessage.setRecipient(Message.RecipientType.TO,
//						new InternetAddress(order.getCustomerInfo().getEmail()));
//				mimeMessage.setText("Dear " + order.getCustomerInfo().getName()
//						+ ", thank ...............????????///////??????....................you for placing order. Your order id is " + order.getOrderId() + ".");
//				mimeMessage.setSubject("Your order on Demoapp Testing");
//			}
//		};

		MimeMessagePreparator preparator1 = new MimeMessagePreparator() {
			 @Override
			   public void prepare(MimeMessage mimeMessage) throws MessagingException {
				 
				 
			     MimeMessageHelper message = new MimeMessageHelper(mimeMessage, true, "UTF-8");

			     message.setFrom("developeralpha@testing.com");
			     message.setTo(to);
			     message.setSubject("INSCRIPCIONES CONEIA 2018 - UPeU, Lima");
			     
			     message.setText(header +"\t\r" + 
			    		 ape+", " + name+ ". " + body +"\t\r" + footer, true);
			     

			   }
			 };
		
		
		return preparator1;
	}





}
