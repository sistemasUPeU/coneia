package pe.edu.upeu.CONEIA.dao;

import java.util.List;
import java.util.Map;


public interface PersonaDAO {
	public Map<String, Object> login(String dni);
	public List<Map<String, Object>> listarPrivilegios(int idrol);
	public Map<String, Object> validarEstado(int idpersona);
}
