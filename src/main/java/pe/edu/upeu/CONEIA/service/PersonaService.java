package pe.edu.upeu.CONEIA.service;

import java.util.List;
import java.util.Map;

public interface PersonaService {
	public Map<String, Object> login(String dni, String clave);

	public List<Map<String, Object>> listarPrivilegios(int idrol);
	
	public Map<String, Object> validarEstado(int idpersona);
	
	public int checkpass(int idpersona);
	
	public int updatePassword(int idpersona, String nuevapass, int estado);
	
	public Map<String, Object> validarCambio(String numero, String correo);
}
