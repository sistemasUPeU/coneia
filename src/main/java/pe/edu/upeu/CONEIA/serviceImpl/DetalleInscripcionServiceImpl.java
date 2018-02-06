package pe.edu.upeu.CONEIA.serviceImpl;


import org.springframework.beans.factory.annotation.Autowired;
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



}
