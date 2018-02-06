package pe.edu.upeu.CONEIA.serviceImpl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import pe.edu.upeu.CONEIA.dao.PersonaDAO;
import pe.edu.upeu.CONEIA.service.PersonaService;

@Service("personaService")
@Transactional(readOnly = true)
public class PersonaServiceImpl implements PersonaService{
	
	@Autowired
	private PersonaDAO pd;

	@Override
	public Map<String, Object> login(String dni) {
		// TODO Auto-generated method stub
		
		return pd.login(dni);
	}
	
	@Override
	public List<Map<String, Object>> listarPrivilegios(int idrol){
		return pd.listarPrivilegios(idrol);
	}

	@Override
	public Map<String, Object> validarEstado(int idpersona) {
		// TODO Auto-generated method stub
		return pd.validarEstado(idpersona);
	}

}
