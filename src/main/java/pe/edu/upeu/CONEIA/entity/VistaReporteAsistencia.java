package pe.edu.upeu.CONEIA.entity;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
@Entity
@Table(name = "vista_reporte_asistencia", catalog = "appconeia_db")
public class VistaReporteAsistencia {
	@Id
	private int idd;
	
	private String nombre;
	private String apellidos;
	private String dni;
	private String correo;
	private String celular;
	public int getIdd() {
		return idd;
	}
	public void setIdd(int idd) {
		this.idd = idd;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public String getApellidos() {
		return apellidos;
	}
	public void setApellidos(String apellidos) {
		this.apellidos = apellidos;
	}
	public String getDni() {
		return dni;
	}
	public void setDni(String dni) {
		this.dni = dni;
	}
	public String getCorreo() {
		return correo;
	}
	public void setCorreo(String correo) {
		this.correo = correo;
	}
	public String getCelular() {
		return celular;
	}
	public void setCelular(String celular) {
		this.celular = celular;
	}
	
	
}