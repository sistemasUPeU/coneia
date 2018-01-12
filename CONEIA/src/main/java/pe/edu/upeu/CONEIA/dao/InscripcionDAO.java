package pe.edu.upeu.CONEIA.dao;

import java.util.List;
import java.util.Map;

import pe.edu.upeu.CONEIA.entity.Inscripcion;


public interface InscripcionDAO {
	public int create(Object obj, String str);
	public int update(Inscripcion d);
	public int delete(int id);
	public Inscripcion read(int id);
	public int maxId();
	public List<Map<String,Object>> readAll();
}
