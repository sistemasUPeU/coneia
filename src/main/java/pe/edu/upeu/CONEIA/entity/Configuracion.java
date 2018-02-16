package pe.edu.upeu.CONEIA.entity;

import static javax.persistence.GenerationType.IDENTITY;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name = "configuracion", catalog = "appconeia_db")
public class Configuracion implements java.io.Serializable{
	

		private Integer idconfiguracion;
		private Integer delegacion;
		private Integer profesional;
		private Integer alumno;
		private Integer estado;
	

		public Configuracion() {
		}

		public Configuracion(Integer idconfiguracion, Integer delegacion, Integer profesional, Integer alumno, Integer  estado) {
			this.idconfiguracion = idconfiguracion;
			this.delegacion = delegacion;
			this.profesional = profesional;
			this.alumno = alumno;
			this.estado = estado;
		}

		@Id
		@GeneratedValue(strategy = IDENTITY)

		@Column(name = "idconfiguracion", unique = true, nullable = false)
		public Integer getIdconfiguracion() {
			return this.idconfiguracion;
		}

		public void setIdconfiguracion(Integer idconfiguracion) {
			this.idconfiguracion = idconfiguracion;
		}

		@Column(name = "delegacion")
		public Integer getDelegacion() {
			return this.delegacion;
		}

		public void setDelegacion(Integer delegacion) {
			this.delegacion = delegacion;
		}
		
		@Column(name = "profesional")
		public Integer getProfesional() {
			return this.profesional;
		}

		public void setProfesional(Integer profesional) {
			this.profesional = profesional;
		}
		
		@Column(name = "alumno")
		public Integer getAlumno() {
			return this.alumno;
		}

		public void setAlumno(Integer alumno) {
			this.alumno = alumno;
		}
		

		@Column(name = "estado")
		public Integer getEstado() {
			return this.estado;
		}

		public void setEstado(Integer estado) {
			this.estado = estado;
		}

		

	
}
