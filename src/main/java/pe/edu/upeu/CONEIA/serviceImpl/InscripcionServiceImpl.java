package pe.edu.upeu.CONEIA.serviceImpl;

import java.text.ParseException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import pe.edu.upeu.CONEIA.dao.InscripcionDAO;
import pe.edu.upeu.CONEIA.entity.DetalleInscripcion;
import pe.edu.upeu.CONEIA.entity.Inscripcion;
import pe.edu.upeu.CONEIA.entity.Persona;
import pe.edu.upeu.CONEIA.service.InscripcionService;

@Service("inscripcionService")
@Transactional(readOnly = true)
public class InscripcionServiceImpl implements InscripcionService {

	@Autowired
	private InscripcionDAO idao;


	@Transactional
	public int create(Object obj, String str) {

		int x = 0;
		try {
			int y = idao.create(obj, str);
			System.out.println("create service" + y);
			x = y;


		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("Error service subscribe insertar> " + e);
		}

		return x;
	}

	@Transactional
	public int update(Inscripcion d) {
		// TODO Auto-generated method stub


		int x = 0;
		try {
			int y = idao.update(d);
			System.out.println("update service" + y);

			if (y == 1) {
				x = 1;
			} else {
				x = 0;
			}

		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("Error service subscribe update> " + e);
		}

		return x;
	}
	
	public List<DetalleInscripcion> PendientesPersonales() {
		return idao.PendientesPersonales();
	}
	
	public List<Map<String, Object>> getEmails(int id,int opcion) {
		return idao.getEmails(id, opcion);
	}
	@Transactional
	public int updateState(int id, int estado) {
		return idao.updateState(id, estado);
	}
	
	public List<DetalleInscripcion> PendientesDelegacion() {
		return idao.PendientesDelegacion();
	}
	 
	public List<DetalleInscripcion> Personal(String fecha) {
		return idao.Personal(fecha);
	}
	
	public List<DetalleInscripcion> Delegacion(String fecha) {
		return idao.Delegacion(fecha);
	}

	@Override
	public List<DetalleInscripcion> AceptadosDelegacion() {
		// TODO Auto-generated method stub
		return idao.AceptadosDelegacion();
	}

	@Override
	public List<DetalleInscripcion> AprobadosPersonal() {
		// TODO Auto-generated method stub
		return idao.AprobadosPersonal();

	}

	@Override
	@Transactional
	public int delete(int id) throws ParseException {
		// TODO Auto-generated method stub
		return idao.delete(id);
	}
	
	


}
