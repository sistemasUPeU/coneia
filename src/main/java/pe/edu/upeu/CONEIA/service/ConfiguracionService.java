package pe.edu.upeu.CONEIA.service;

import java.util.List;
import java.util.Map;

public interface ConfiguracionService {
	public List<Map<String, Object>> getPrecios();
	public int updateSeason(int idactivo, int idtoactive);
	public int updateCost(int idc, int dele, int alu, int pro);
	public int updateGeneral(int opcion);
}
