package pe.edu.upeu.CONEIA.service;

public interface MailService {

	public void sendEmail( final String[] email, final String[] nombre, final String[] apellidos, final String header, final String body,final String footer);

	public int sendEmail( final String email, final String nombre, final String apellidos, final String header, final String body,final String footer);

}
