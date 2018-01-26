package pe.edu.upeu.CONEIA.service;

import java.util.List;
import java.util.Map;

import pe.edu.upeu.CONEIA.entity.DetalleInscripcion;
import pe.edu.upeu.CONEIA.entity.Inscripcion;


public interface InscripcionService {
	public int create(Object obj, String str);
	public int update(Inscripcion d);
	public int delete(int id);
	public Inscripcion read(int id);
	public List<Map<String,Object>> readAll();
	public List<DetalleInscripcion> PendientesPersonales();
	public List<Map<String, Object>> getEmails(int id);
	public int updateState(int id, int estado);
	public List<DetalleInscripcion> PendientesDelegacion();
	public List<DetalleInscripcion> Personal(String fecha);
	public List<DetalleInscripcion> Delegacion(String fecha);
}
