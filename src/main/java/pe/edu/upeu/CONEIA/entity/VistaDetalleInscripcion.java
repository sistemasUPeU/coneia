package pe.edu.upeu.CONEIA.entity;
// Generated 30-ene-2018 10:51:27 by Hibernate Tools 5.1.0.Alpha1

import javax.persistence.AttributeOverride;
import javax.persistence.AttributeOverrides;
import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * VistaDetalleInscripcion generated by hbm2java
 */
@Entity
@Table(name = "vista_detalle_inscripcion", catalog = "appconeia_db")
public class VistaDetalleInscripcion implements java.io.Serializable {

	@Id
	private int idinscripcion;
	private long cuenta;
	
	public int getIdinscripcion() {
		return idinscripcion;
	}
	public void setIdinscripcion(int idinscripcion) {
		this.idinscripcion = idinscripcion;
	}
	public long getCuenta() {
		return cuenta;
	}
	public void setCuenta(long cuenta) {
		this.cuenta = cuenta;
	}

}
