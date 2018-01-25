package pe.edu.upeu.CONEIA.entity;
// Generated 03-ene-2018 11:40:37 by Hibernate Tools 5.1.0.Alpha1

import java.util.HashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * DetalleInscripcion generated by hbm2java
 */
@Entity
@Table(name = "detalle_inscripcion", catalog = "dbconeia")
@NamedQueries({
@NamedQuery(name="Inscritos", query="FROM DetalleInscripcion d where d.iddetalleInscripcion  = :iddetalleInscripcion"),
@NamedQuery(name="InscripcionPersona", query="FROM DetalleInscripcion d where d.persona = :persona")})
public class DetalleInscripcion implements java.io.Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int iddetalleInscripcion;
	private Inscripcion inscripcion;
	private Persona persona;
	private String estado;
	private Set<InscripcionTaller> inscripcionTallers = new HashSet<InscripcionTaller>(0);

	public DetalleInscripcion() {
	}

	public DetalleInscripcion(int iddetalleInscripcion, Inscripcion inscripcion, Persona persona) {
		this.iddetalleInscripcion = iddetalleInscripcion;
		this.inscripcion = inscripcion;
		this.persona = persona;
	}

	public DetalleInscripcion(int iddetalleInscripcion, Inscripcion inscripcion, Persona persona, String estado,
			Set<InscripcionTaller> inscripcionTallers) {
		this.iddetalleInscripcion = iddetalleInscripcion;
		this.inscripcion = inscripcion;
		this.persona = persona;
		this.estado = estado;
		this.inscripcionTallers = inscripcionTallers;
	}

	@Id

	@Column(name = "iddetalle_inscripcion", unique = true, nullable = false)
	public int getIddetalleInscripcion() {
		return this.iddetalleInscripcion;
	}

	public void setIddetalleInscripcion(int iddetalleInscripcion) {
		this.iddetalleInscripcion = iddetalleInscripcion;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "idinscripcion", nullable = false)
	public Inscripcion getInscripcion() {
		return this.inscripcion;
	}

	public void setInscripcion(Inscripcion inscripcion) {
		this.inscripcion = inscripcion;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "idpersona", nullable = false)
	public Persona getPersona() {
		return this.persona;
	}

	public void setPersona(Persona persona) {
		this.persona = persona;
	}

	@Column(name = "estado", length = 45)
	public String getEstado() {
		return this.estado;
	}

	public void setEstado(String estado) {
		this.estado = estado;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "detalleInscripcion")
	public Set<InscripcionTaller> getInscripcionTallers() {
		return this.inscripcionTallers;
	}

	public void setInscripcionTallers(Set<InscripcionTaller> inscripcionTallers) {
		this.inscripcionTallers = inscripcionTallers;
	}

}
