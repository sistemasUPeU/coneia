package pe.edu.upeu.CONEIA.serviceImpl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import pe.edu.upeu.CONEIA.dao.DetalleInscripcionDAO;
import pe.edu.upeu.CONEIA.entity.DetalleInscripcion;
import pe.edu.upeu.CONEIA.service.DetalleInscripcionService;

@Service("detalleInscripcionService")
@Transactional(readOnly = true)
public class DetalleInscripcionServiceImpl implements DetalleInscripcionService {

	@Autowired
	private DetalleInscripcionDAO ddao;

	
	@Override
	@Transactional
	public int create(DetalleInscripcion d) {
		// TODO Auto-generated method stub
		int x = 0;
		ddao.create(d);
		return x;
	}

	@Override
	@Transactional
	public int update(DetalleInscripcion d) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete(int id) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public DetalleInscripcion read(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	
	@Override
	public int maxIdDetalle() {
		// TODO Auto-generated method stub
		return ddao.maxIdDetalle();
	}

	@Override
	public List<Map<String, Object>> readAll() {
		// TODO Auto-generated method stub
		return null;
	}

}
