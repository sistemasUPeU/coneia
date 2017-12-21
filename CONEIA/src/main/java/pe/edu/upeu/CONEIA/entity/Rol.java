package pe.edu.upeu.CONEIA.entity;
// Generated 20-dic-2017 19:51:48 by Hibernate Tools 5.2.6.Final

import java.util.HashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * Rol generated by hbm2java
 */
@Entity
@Table(name = "rol", catalog = "dbconeia")
public class Rol implements java.io.Serializable {

	private Integer idrol;
	private String nombre;
	private Integer estado;
	private Set<Persona> personas = new HashSet<Persona>(0);
	private Set<DetallePrivilegio> detallePrivilegios = new HashSet<DetallePrivilegio>(0);

	public Rol() {
	}

	public Rol(String nombre, Integer estado, Set<Persona> personas, Set<DetallePrivilegio> detallePrivilegios) {
		this.nombre = nombre;
		this.estado = estado;
		this.personas = personas;
		this.detallePrivilegios = detallePrivilegios;
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)

	@Column(name = "idrol", unique = true, nullable = false)
	public Integer getIdrol() {
		return this.idrol;
	}

	public void setIdrol(Integer idrol) {
		this.idrol = idrol;
	}

	@Column(name = "nombre", length = 45)
	public String getNombre() {
		return this.nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	@Column(name = "estado")
	public Integer getEstado() {
		return this.estado;
	}

	public void setEstado(Integer estado) {
		this.estado = estado;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "rol")
	public Set<Persona> getPersonas() {
		return this.personas;
	}

	public void setPersonas(Set<Persona> personas) {
		this.personas = personas;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "rol")
	public Set<DetallePrivilegio> getDetallePrivilegios() {
		return this.detallePrivilegios;
	}

	public void setDetallePrivilegios(Set<DetallePrivilegio> detallePrivilegios) {
		this.detallePrivilegios = detallePrivilegios;
	}

}
