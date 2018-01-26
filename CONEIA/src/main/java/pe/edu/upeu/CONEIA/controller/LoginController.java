package pe.edu.upeu.CONEIA.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.persistence.Query;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.gson.Gson;

import pe.edu.upeu.CONEIA.dao.PersonaDAO;
import pe.edu.upeu.CONEIA.entity.DetallePrivilegio;
import pe.edu.upeu.CONEIA.entity.Persona;
import pe.edu.upeu.CONEIA.entity.Rol;
import pe.edu.upeu.CONEIA.util.HibernateUtils;

@Controller
public class LoginController {
	private static final PersonaDAO pd = new PersonaDAO();
	private static final Persona p = new Persona();
	private static Gson gson = new Gson();
	Map<String, Object> personaMap = new HashMap<>();
	Map<String, Object> maleta = null;
//	final Session s = HibernateUtils.getSessionFactory();
	@RequestMapping(value = "/logon")
	public void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		String dni = request.getParameter("dni");
		HttpSession session = request.getSession(true);
		
		Session s = HibernateUtils.getSessionFactory().openSession();
		System.out.println("login controller");

		int x = 0;
		int op = Integer.parseInt(request.getParameter("op"));
		System.out.println(op);
		RequestDispatcher dispatcher;
		try {

			if (op == 1) {
				if (pd.login(dni) != null) {
					personaMap = pd.login(dni);
					session.setAttribute("idp", personaMap.get("idpersona"));
					session.setAttribute("dni", personaMap.get("dni"));
					session.setAttribute("nombre", personaMap.get("nombre"));
					session.setAttribute("apellidos", personaMap.get("apellidos"));
					session.setAttribute("rol", personaMap.get("rol"));
					session.setAttribute("idrol", personaMap.get("idrol"));

					Map<String, Object> datos = new HashMap<>();

					int idrol = Integer.parseInt(personaMap.get("idrol").toString());
					Query privilegios = s.createNamedQuery("MostrarPrivilegios");
					Rol r = s.get(Rol.class, idrol);
					privilegios.setParameter("rol", r);

					@SuppressWarnings("unchecked")
					List<DetallePrivilegio> liston = privilegios.getResultList();
					List<Map<String, Object>> privilegioListon = new ArrayList<>();
					for (int j = 0; j < liston.size(); j++) {
						maleta = new HashMap<>();
						maleta.put("nombre", liston.get(j).getPrivilegio().getNombre());
						System.out.println(liston.get(j).getPrivilegio().getNombre());
						maleta.put("url", liston.get(j).getPrivilegio().getUrl());
						maleta.put("icons", liston.get(j).getPrivilegio().getIcons());
						privilegioListon.add(maleta);
					}
					session.setAttribute("listaPrivilegios", privilegioListon);

					x = 1;
					datos.put("op", x);
					datos.put("idp", personaMap.get("idp"));
					datos.put("dni", personaMap.get("dni"));
					datos.put("rol", personaMap.get("rol"));
					datos.put("idrol", personaMap.get("idrol"));
					datos.put("listaPrivilegios", privilegioListon);
					System.out.println(datos);
					System.out.println(gson.toJson(datos));
					out.println(gson.toJson(datos));
				} else {
					out.println(0);
				}
			} else {
				session.setAttribute("idp", null);
				session.setAttribute("dni", null);
				session.setAttribute("user", null);
				session.setAttribute("rol", null);
				session.setAttribute("idrol", null);
				session.invalidate();

			}
		} catch (Exception e) {
			System.out.println("login controller" + e);
		}
	}

}
