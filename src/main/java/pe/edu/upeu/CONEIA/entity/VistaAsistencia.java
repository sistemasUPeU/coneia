package pe.edu.upeu.CONEIA.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table(name = "vista_asistencia", catalog = "appconeia_db")
public class VistaAsistencia {
	
	@Id
	private int idit;
	
	private int idd;
	
	private int idtipo;
	
	private String tema;
	
	private Date hora;
	
	private Date fin;
	
	private Date fecha;
	
	private int asistencia;

	@Column(name = "idit")
	public int getIdit() {
		return idit;
	}

	public void setIdit(int idit) {
		this.idit = idit;
	}

	@Column(name = "idd")
	public int getIdd() {
		return idd;
	}

	public void setIdd(int idd) {
		this.idd = idd;
	}
	
	
	@Column(name = "idtipo")
	public int getIdtipo() {
		return idtipo;
	}

	public void setIdtipo(int idtipo) {
		this.idtipo = idtipo;
	}

	@Column(name = "tema")
	public String getTema() {
		return tema;
	}

	public void setTema(String tema) {
		this.tema = tema;
	}
	@Temporal(TemporalType.TIME)
	@Column(name = "hora")
	public Date getHoraI() {
		return hora;
	}
	
	public void setHora(Date hora) {
		this.hora = hora;
	}
	
	@Temporal(TemporalType.TIME)
	@Column(name = "fin")
	public Date getFin() {
		return fin;
	}

	public void setFin(Date fin) {
		this.fin = fin;
	}

	
	@Column(name = "fecha")
	public Date getFecha() {
		return fecha;
	}

	public void setFecha(Date fecha) {
		this.fecha = fecha;
	}

	@Column(name = "asistencia")
	public int getAsistencia() {
		return asistencia;
	}

	public void setAsistencia(int asistencia) {
		this.asistencia = asistencia;
	}
	
	

}

