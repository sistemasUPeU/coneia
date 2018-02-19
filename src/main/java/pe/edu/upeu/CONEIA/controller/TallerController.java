package pe.edu.upeu.CONEIA.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.gson.Gson;

import pe.edu.upeu.CONEIA.dao.TallerDAO;
import pe.edu.upeu.CONEIA.entity.DetalleInscripcion;
import pe.edu.upeu.CONEIA.entity.InscripcionTaller;
import pe.edu.upeu.CONEIA.entity.Taller;
import pe.edu.upeu.CONEIA.service.TallerService;
import pe.edu.upeu.CONEIA.util.HibernateUtils;


@Controller
public class TallerController {

	private Gson gson = new Gson();
	
	@Autowired
	private TallerService td;
	
	InscripcionTaller it = new InscripcionTaller();
	
	@Autowired
	private SessionFactory sessionFactory;
	

	@RequestMapping("customTaller")
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, ParseException {
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		RequestDispatcher dispatcher;
		int op = Integer.parseInt(request.getParameter("op"));
		HttpSession session = request.getSession();
		String url;
		switch (op) {
		case 1://visitas MARTES
			out.println(gson.toJson(td.findTalleres(4, "2018-06-05")));
			break;
		case 2://talleres MARTES
			out.println(gson.toJson(td.findTalleres(2, "2018-06-05")));
			break;
		case 3://visitas JUEVES
			out.println(gson.toJson(td.findTalleres(4, "2018-06-07")));
			break;
		case 4://talleres JUEVES
			out.println(gson.toJson(td.findTalleres(2, "2018-06-07")));
			break;
		case 5://ponencia LUNES 1
			out.println(gson.toJson(td.findTalleres2(1, "2018-06-04","10:30")));
			break;
		case 6://ponencia LUNES 2
			out.println(gson.toJson(td.findTalleres2(1, "2018-06-04","11:30")));
			break;
		case 7://ponencia MIERCOLES 1
			out.println(gson.toJson(td.findTalleres2(1, "2018-06-06","08:00")));
			break;
		case 8://ponencia MIERCOLES 2
			out.println(gson.toJson(td.findTalleres2(1, "2018-06-06","09:00")));
			break;
		case 9://ponencia MIERCOLES 3 
			out.println(gson.toJson(td.findTalleres2(1, "2018-06-06","10:30")));
			break;
		case 10://ponencia MIERCOLES 4
			out.println(gson.toJson(td.findTalleres2(1, "2018-06-06","11:30")));
			break;
		case 11://ponencia VIERNES 1
			out.println(gson.toJson(td.findTalleres2(1, "2018-06-08","08:00")));
			break;
		case 12://ponencia VIERNES 2
			out.println(gson.toJson(td.findTalleres2(1, "2018-06-08","09:00")));
			break;

		}
		

	}
	
	
}
