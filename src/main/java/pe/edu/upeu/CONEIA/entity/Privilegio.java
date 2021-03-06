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
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * Privilegio generated by hbm2java
 */
@Entity
@Table(name = "privilegio", catalog = "appconeia_db")
public class Privilegio implements java.io.Serializable {

	private Integer idprivilegio;
	private String nombre;
	private String url;
	private String icons;
	private Integer estado;
	private Set<DetallePrivilegio> detallePrivilegios = new HashSet<DetallePrivilegio>(0);

	public Privilegio() {
	}

	public Privilegio(String nombre, String url, String icons, Integer estado,
			Set<DetallePrivilegio> detallePrivilegios) {
		this.nombre = nombre;
		this.url = url;
		this.icons = icons;
		this.estado = estado;
		this.detallePrivilegios = detallePrivilegios;
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)

	@Column(name = "idprivilegio", unique = true, nullable = false)
	public Integer getIdprivilegio() {
		return this.idprivilegio;
	}

	public void setIdprivilegio(Integer idprivilegio) {
		this.idprivilegio = idprivilegio;
	}

	@Column(name = "nombre", length = 45)
	public String getNombre() {
		return this.nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	@Column(name = "url")
	public String getUrl() {
		return this.url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	@Column(name = "icons", length = 45)
	public String getIcons() {
		return this.icons;
	}

	public void setIcons(String icons) {
		this.icons = icons;
	}

	@Column(name = "estado")
	public Integer getEstado() {
		return this.estado;
	}

	public void setEstado(Integer estado) {
		this.estado = estado;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "privilegio")
	public Set<DetallePrivilegio> getDetallePrivilegios() {
		return this.detallePrivilegios;
	}

	public void setDetallePrivilegios(Set<DetallePrivilegio> detallePrivilegios) {
		this.detallePrivilegios = detallePrivilegios;
	}

}
