package pe.edu.upeu.CONEIA.entity;
// Generated 30-ene-2018 10:51:27 by Hibernate Tools 5.1.0.Alpha1

import java.util.HashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * Persona generated by hbm2java
 */
@Entity
@Table(name = "persona", catalog = "appconeia_db")
@NamedQueries({@NamedQuery( name="ListarUser" , query="from Persona p where p.dni=:dni"),
	@NamedQuery( name="ListarUser1" , query="select d from DetalleInscripcion d join d.persona a join d.inscripcion c where a.dni = :dni and c.estado = 1")
})
public class Persona implements java.io.Serializable {

	private Integer idpersona;
	private Rol rol;
	private String nombre;
	private String apellidos;
	private String dni;
	private String universidad;
	private String carrera;
	private String correo;
	private String celular;
	private Double importe;
	private Integer tipo;
	private Set<DetalleInscripcion> detalleInscripcions = new HashSet<DetalleInscripcion>(0);

	public Persona() {
	}

	public Persona(Rol rol) {
		this.rol = rol;
	}

	public Persona(Rol rol, String nombre, String apellidos, String dni, String universidad, String carrera,
			String correo, String celular, Double importe, Integer tipo, Set<DetalleInscripcion> detalleInscripcions) {
		this.rol = rol;
		this.nombre = nombre;
		this.apellidos = apellidos;
		this.dni = dni;
		this.universidad = universidad;
		this.carrera = carrera;
		this.correo = correo;
		this.celular = celular;
		this.importe = importe;
		this.tipo = tipo;
		this.detalleInscripcions = detalleInscripcions;
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)

	@Column(name = "idpersona", unique = true, nullable = false)
	public Integer getIdpersona() {
		return this.idpersona;
	}

	public void setIdpersona(Integer idpersona) {
		this.idpersona = idpersona;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "idrol", nullable = false)
	public Rol getRol() {
		return this.rol;
	}

	public void setRol(Rol rol) {
		this.rol = rol;
	}

	@Column(name = "nombre", length = 45)
	public String getNombre() {
		return this.nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	@Column(name = "apellidos", length = 100)
	public String getApellidos() {
		return this.apellidos;
	}

	public void setApellidos(String apellidos) {
		this.apellidos = apellidos;
	}

	@Column(name = "dni", length = 8)
	public String getDni() {
		return this.dni;
	}

	public void setDni(String dni) {
		this.dni = dni;
	}

	@Column(name = "universidad", length = 45)
	public String getUniversidad() {
		return this.universidad;
	}

	public void setUniversidad(String universidad) {
		this.universidad = universidad;
	}

	@Column(name = "carrera", length = 45)
	public String getCarrera() {
		return this.carrera;
	}

	public void setCarrera(String carrera) {
		this.carrera = carrera;
	}

	@Column(name = "correo", length = 45)
	public String getCorreo() {
		return this.correo;
	}

	public void setCorreo(String correo) {
		this.correo = correo;
	}

	@Column(name = "celular", length = 13)
	public String getCelular() {
		return this.celular;
	}

	public void setCelular(String celular) {
		this.celular = celular;
	}

	@Column(name = "importe", precision = 22, scale = 0)
	public Double getImporte() {
		return this.importe;
	}

	public void setImporte(Double importe) {
		this.importe = importe;
	}

	@Column(name = "tipo")
	public Integer getTipo() {
		return this.tipo;
	}

	public void setTipo(Integer tipo) {
		this.tipo = tipo;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "persona")
	public Set<DetalleInscripcion> getDetalleInscripcions() {
		return this.detalleInscripcions;
	}

	public void setDetalleInscripcions(Set<DetalleInscripcion> detalleInscripcions) {
		this.detalleInscripcions = detalleInscripcions;
	}

}
