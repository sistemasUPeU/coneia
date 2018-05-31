package pe.edu.upeu.CONEIA.service;

import java.text.ParseException;
import java.util.List;
import java.util.Map;

import pe.edu.upeu.CONEIA.entity.Taller;

public interface TallerService {
	public int nuevoTaller(Taller t);
	public int eliminar(int id);
	public int update(int idtaller,int idtipo,String tema,String ponente,String lugar,int stock);
	public int buscarTaller(int id);
	public List<Map<String,Object>> buscarTaller2(int id);
	public List<Map<String,Object>> readAll();
	public List<Map<String,Object>> findTalleres(int idtipo, String fecha) throws ParseException;
	public List<Map<String,Object>> findTalleres2(int idtipo, String fecha,String hora) throws ParseException;
	public List<Map<String,Object>> findTalleres3(int idtipo, String fecha) throws ParseException;
	public List<Map<String,Object>> findTalleres4(int idtipo, String fecha,String hora) throws ParseException;
}
