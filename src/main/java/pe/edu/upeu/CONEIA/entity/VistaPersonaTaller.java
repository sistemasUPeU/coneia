package pe.edu.upeu.CONEIA.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table(name = "vista_persona_taller", catalog = "appconeia_db")
public class VistaPersonaTaller implements java.io.Serializable{
	
	private static final long serialVersionUID = 1L;
	
	@Id
	private int idd;
	
	private String nombre;
	private String apellidos;
	private String dni;
	private Date fecha;
	
	@Column(name = "idd")
	public int getIdd() {
		return idd;
	}
	public void setIdd(int idd) {
		this.idd = idd;
	}
	
	@Column(name = "nombre")
	public String getNombre() {
		return nombre;
	}
	public void setNombres(String nombre) {
		this.nombre = nombre;
	}
	
	@Column(name = "apellidos")
	public String getApellidos() {
		return apellidos;
	}
	public void setApellidos(String apellidos) {
		this.apellidos = apellidos;
	}
	
	@Column(name = "dni")
	public String getDni() {
		return dni;
	}
	public void setDni(String dni) {
		this.dni = dni;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "fecha")
	public Date getFecha() {
		return fecha;
	}
	public void setFecha(Date fecha) {
		this.fecha = fecha;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	
	
	
	

}
