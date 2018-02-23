package pe.edu.upeu.CONEIA.serviceImpl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import pe.edu.upeu.CONEIA.dao.PersonaDAO;
import pe.edu.upeu.CONEIA.entity.Persona;
import pe.edu.upeu.CONEIA.service.PersonaService;

@Service("personaService")
@Transactional(readOnly = true)
public class PersonaServiceImpl implements PersonaService{
	
	@Autowired
	private PersonaDAO pd;

	@Override
	public Map<String, Object> login(String dni, String clave) {
		// TODO Auto-generated method stub
		
		return pd.login(dni, clave);
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

	@Override
	public int checkpass(int idpersona) {
		// TODO Auto-generated method stub
		return pd.checkpass(idpersona);
	}

	@Override
	@Transactional
	public int updatePassword(int idpersona, String nuevapass, int estado) {
		// TODO Auto-generated method stub
		return pd.updatePassword(idpersona, nuevapass, estado);
	}

	@Override
	public Map<String, Object> validarCambio(String numero, String correo) {
		// TODO Auto-generated method stub
		return pd.validarCambio(numero, correo);
	}

	@Override
	public List<Map<String, Object>> listarPersonal() {
		// TODO Auto-generated method stub
		return pd.listarPersonal();
	}

	@Override
	@Transactional
	public int actualizar(Persona p) {
		// TODO Auto-generated method stub
		return pd.actualizar(p);
	}

	@Override
	@Transactional
	public int eliminar(int id) {
		// TODO Auto-generated method stub
		return pd.eliminar(id);
	}

	@Override
	public Map<String, Object> search(int id) {
		// TODO Auto-generated method stub
		return pd.search(id);
	}

	@Override
	@Transactional
	public int nuevaPersona(Persona p) {
		// TODO Auto-generated method stub
		return pd.nuevaPersona(p);
	}

}
