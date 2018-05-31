package pe.edu.upeu.CONEIA.serviceImpl;

import java.text.ParseException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import pe.edu.upeu.CONEIA.dao.TallerDAO;
import pe.edu.upeu.CONEIA.entity.Taller;
import pe.edu.upeu.CONEIA.service.TallerService;

@Service("tallerService")
@Transactional(readOnly = true)
public class TallerServiceImpl implements TallerService{
	@Autowired
	private TallerDAO td;

	@Transactional
	public int nuevoTaller(Taller t) {
		// TODO Auto-generated method stub
		return td.nuevoTaller(t);
	}

	@Transactional
	public int eliminar(int id) {
		// TODO Auto-generated method stub
		return td.eliminar(id);
	}

	@Transactional
	public int update(int idtaller, int idtipo, String tema, String ponente, String lugar, int stock) {
		// TODO Auto-generated method stub
		return td.update(idtaller, idtipo, tema, ponente, lugar, stock);
	}

	@Override
	public int buscarTaller(int id) {
		// TODO Auto-generated method stub
		return td.buscarTaller(id);
	}

	@Override
	public List<Map<String, Object>> buscarTaller2(int id) {
		// TODO Auto-generated method stub
		return td.buscarTaller2(id);
	}

	@Override
	public List<Map<String, Object>> readAll() {
		// TODO Auto-generated method stub
		return td.readAll();
	}

	@Override
	public List<Map<String, Object>> findTalleres(int idtipo, String fecha) throws ParseException {
		// TODO Auto-generated method stub
		return td.findTalleres(idtipo, fecha);
	}

	@Override
	public List<Map<String, Object>> findTalleres2(int idtipo, String fecha, String hora) throws ParseException {
		// TODO Auto-generated method stub
		return td.findTalleres2(idtipo, fecha, hora);
	}

	@Override
	public List<Map<String, Object>> findTalleres3(int idtipo, String fecha) throws ParseException {
		// TODO Auto-generated method stub
		return td.findTalleres3(idtipo, fecha);
	}

	@Override
	public List<Map<String, Object>> findTalleres4(int idtipo, String fecha, String hora) throws ParseException {
		// TODO Auto-generated method stub
		return td.findTalleres4(idtipo, fecha, hora);
	}
	
}
