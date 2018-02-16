package pe.edu.upeu.CONEIA.dao;

import java.util.List;
import java.util.Map;

import pe.edu.upeu.CONEIA.entity.DetalleInscripcion;
import pe.edu.upeu.CONEIA.entity.Inscripcion;


public interface InscripcionDAO {
	public int create(Object obj, String str);
	public int update(Inscripcion d);
	public List<DetalleInscripcion> PendientesPersonales();
	public List<Map<String, Object>> getEmails(int id,int opcion);
	public int updateState(int id, int estado);
	public List<DetalleInscripcion> PendientesDelegacion();
	public List<DetalleInscripcion> Personal(String fecha);
	public List<DetalleInscripcion> Delegacion(String fecha);
	public List<DetalleInscripcion> AceptadosDelegacion();
	public List<DetalleInscripcion> AprobadosPersonal();
	

}
