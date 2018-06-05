package pe.edu.upeu.CONEIA.dao;

import java.text.ParseException;
import java.util.List;
import java.util.Map;

import pe.edu.upeu.CONEIA.entity.InscripcionTaller;

public interface InscripcionTallerDAO {
	public int create(InscripcionTaller t,int idd,int idt);
	public int actualizarAsistencia(int idit);
	public List<Map<String,Object>> showVistaPersonaTaller(String time);
	public List<Map<String,Object>> showVistaAsistencia(int idd,String time) throws ParseException;
	public long cuantos(int idd);
	public long cuantos2(int idd);
	public Map<String,Object> mapon (int idd,String fecha) throws ParseException;
	public List<Map<String,Object>> reporteAsistencia();
	public List<Map<String,Object>> impresiones(int idt);
}
