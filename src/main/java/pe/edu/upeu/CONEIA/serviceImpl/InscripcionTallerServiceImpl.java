package pe.edu.upeu.CONEIA.serviceImpl;

import java.text.ParseException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import pe.edu.upeu.CONEIA.dao.InscripcionTallerDAO;
import pe.edu.upeu.CONEIA.entity.InscripcionTaller;
import pe.edu.upeu.CONEIA.service.InscripcionTallerService;

@Service("inscripcionTallerService")
@Transactional(readOnly = true)
public class InscripcionTallerServiceImpl implements InscripcionTallerService{
	
	@Autowired
	private InscripcionTallerDAO itd;

	
	@Transactional
	public int create(InscripcionTaller t, int idd, int idt) {
		// TODO Auto-generated method stub
		return itd.create(t, idd, idt);
	}

	@Transactional
	public int actualizarAsistencia(int idit) {
		// TODO Auto-generated method stub
		return itd.actualizarAsistencia(idit);
	}

	@Override
	public List<Map<String, Object>> showVistaPersonaTaller(String time) {
		// TODO Auto-generated method stub
		return itd.showVistaPersonaTaller(time);
	}

	@Override
	public List<Map<String, Object>> showVistaAsistencia(int idd, String time) throws ParseException {
		// TODO Auto-generated method stub
		return itd.showVistaAsistencia(idd, time);
	}

	@Override
	public long cuantos(int idd) {
		// TODO Auto-generated method stub
		return itd.cuantos(idd);
	}

	@Override
	public long cuantos2(int idd) {
		// TODO Auto-generated method stub
		return itd.cuantos2(idd);
	}

	@Override
	public Map<String, Object> mapon(int idd, String fecha) throws ParseException {
		// TODO Auto-generated method stub
		return itd.mapon(idd, fecha);
	}

	@Override
	public List<Map<String, Object>> reporteAsistencia() {
		// TODO Auto-generated method stub
		return itd.reporteAsistencia();
	}

	@Override
	public List<Map<String, Object>> impresiones(int idt) {
		// TODO Auto-generated method stub
		return itd.impresiones(idt);
	}

}
