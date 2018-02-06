package pe.edu.upeu.CONEIA.serviceImpl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
public class InscripcionServiceImpl implements InscripcionService {

	@Autowired
	private InscripcionDAO idao;

	// create(Inscripcion d, Object obj, List<Map<String, Object>> lista)

	public int create(Object obj, String str) {
		// TODO Auto-generated method stub
		// System.out.println("service impl> " + obj);
		int x = 0;
		try {
			int y = idao.create(obj, str);
			System.out.println("create service"+y);
			x=y;
//			if (y==1) {
//				x=1;
//			}else {
//				x=0;
//			}
		

		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("Error service subscribe insertar> " + e);
		}

		return x;
	}

	public int update(Inscripcion d) {
		// TODO Auto-generated method stub
		
		System.out.println("service imp nro>" + d.getNroVoucher());
		System.out.println("service imp id>" +d.getIdinscripcion());
		System.out.println("service imp url>" +d.getUrlVoucher());
		
		int x = 0;
		try {
			int y = idao.update(d);
			System.out.println("update service"+y);
			
			if (y==1) {
				x=1;
			}else {
				x=0;
			}
		

		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("Error service subscribe update> " + e);
		}

		return x;
	}

	public int delete(int id) {
		// TODO Auto-generated method stub
		return 0;
	}

	public Inscripcion read(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	public List<Map<String, Object>> readAll() {
		// TODO Auto-generated method stub
		return null;
	}


	
	public List<DetalleInscripcion> PendientesPersonales(){
		return idao.PendientesPersonales();
	}
	
	
	public List<Map<String, Object>> getEmails(int id){
		return idao.getEmails(id);
	}
	
	public int updateState(int id, int estado) {
		return idao.updateState(id, estado);
	}
	
	public List<DetalleInscripcion> PendientesDelegacion(){
		return idao.PendientesDelegacion();
	}
	public List<DetalleInscripcion> Personal(String fecha){
		return idao.Personal(fecha);
	}
	public List<DetalleInscripcion> Delegacion(String fecha){
		return idao.Delegacion(fecha);
	}

}
