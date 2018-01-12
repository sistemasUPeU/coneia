package pe.edu.upeu.CONEIA.entity;
// Generated 03-ene-2018 11:40:37 by Hibernate Tools 5.1.0.Alpha1

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
 * Tipo generated by hbm2java
 */
@Entity
@Table(name = "tipo", catalog = "dbconeia")
public class Tipo implements java.io.Serializable {

	private Integer idtipo;
	private String nombre;
	private String descripcion;
	private Integer estado;
	private Set<Taller> tallers = new HashSet<Taller>(0);

	public Tipo() {
	}

	public Tipo(String nombre, String descripcion, Integer estado, Set<Taller> tallers) {
		this.nombre = nombre;
		this.descripcion = descripcion;
		this.estado = estado;
		this.tallers = tallers;
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)

	@Column(name = "idtipo", unique = true, nullable = false)
	public Integer getIdtipo() {
		return this.idtipo;
	}

	public void setIdtipo(Integer idtipo) {
		this.idtipo = idtipo;
	}

	@Column(name = "nombre", length = 45)
	public String getNombre() {
		return this.nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	@Column(name = "descripcion", length = 100)
	public String getDescripcion() {
		return this.descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

	@Column(name = "estado")
	public Integer getEstado() {
		return this.estado;
	}

	public void setEstado(Integer estado) {
		this.estado = estado;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "tipo")
	public Set<Taller> getTallers() {
		return this.tallers;
	}

	public void setTallers(Set<Taller> tallers) {
		this.tallers = tallers;
	}

}
