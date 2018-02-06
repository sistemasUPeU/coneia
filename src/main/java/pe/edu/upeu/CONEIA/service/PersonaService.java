package pe.edu.upeu.CONEIA.service;

import java.util.List;
import java.util.Map;

public interface PersonaService {
	public Map<String, Object> login(String dni);

	public List<Map<String, Object>> listarPrivilegios(int idrol);
	
	public Map<String, Object> validarEstado(int idpersona);
}
