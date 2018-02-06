package pe.edu.upeu.CONEIA.dao;

import java.util.List;
import java.util.Map;

import pe.edu.upeu.CONEIA.entity.DetalleInscripcion;

public interface DetalleInscripcionDAO {
	public void create(DetalleInscripcion d);

	public int update(DetalleInscripcion d);

	public int delete(int id);

	public DetalleInscripcion read(int id);

	public int maxIdDetalle();

	public List<Map<String, Object>> readAll();
}
