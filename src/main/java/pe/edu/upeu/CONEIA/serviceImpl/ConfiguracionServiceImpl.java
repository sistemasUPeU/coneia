package pe.edu.upeu.CONEIA.serviceImpl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import pe.edu.upeu.CONEIA.dao.ConfiguracionDAO;
import pe.edu.upeu.CONEIA.service.ConfiguracionService;
@Service("configuracionService")
@Transactional(readOnly = true)
public class ConfiguracionServiceImpl implements ConfiguracionService {

	@Autowired
	private ConfiguracionDAO cdao;
	
	
	@Override
	public List<Map<String, Object>> getPrecios() {
		// TODO Auto-generated method stub
		return cdao.getPrecios();
	}


	@Override
	@Transactional
	public int updateSeason(int idactivo, int idtoactive) {
		// TODO Auto-generated method stub
		return cdao.updateSeason(idactivo, idtoactive);
	}


	@Override
	@Transactional
	public int updateCost(int idc, int dele, int alu, int pro) {
		// TODO Auto-generated method stub
		return cdao.updateCost(idc, dele, alu, pro);
	}


	@Override
	@Transactional
	public int updateGeneral(int opcion) {
		// TODO Auto-generated method stub
		return cdao.updateGeneral(opcion);
	}
	
	

}
