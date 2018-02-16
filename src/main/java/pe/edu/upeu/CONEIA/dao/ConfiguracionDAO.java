package pe.edu.upeu.CONEIA.dao;

import java.util.List;
import java.util.Map;

public interface ConfiguracionDAO {
	public List<Map<String, Object>> getPrecios();
	public int updateSeason(int idactivo, int idtoactive);
	public int updateCost(int idc, int dele, int alu, int pro);
}
