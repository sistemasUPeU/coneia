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
import pe.edu.upeu.CONEIA.util.HibernateUtils;


@Controller
public class TallerController {
	TallerDAO td = new TallerDAO();
	Gson gson = new Gson();
	private static Session s;
	InscripcionTaller it = new InscripcionTaller();
	
	@Autowired
	private SessionFactory sessionFactory;
	
	@RequestMapping("/talleres")
	protected void doGet(HttpServletRequest request, HttpServletResponse response, HttpSession session)
			throws ServletException, IOException, ParseException {
		PrintWriter out = response.getWriter();
		int op = Integer.parseInt(request.getParameter("op"));
		switch (op) {
		case 1:
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
			String date = request.getParameter("fecha");
			Date fecha= formatter.parse(date);
			SimpleDateFormat formatter2 = new SimpleDateFormat("HH:mm");
			String hour = request.getParameter("hora");
			Date hora = formatter2.parse(hour);
			int id = Integer.parseInt(session.getAttribute("inscripcion").toString());
			out.println(gson.toJson(td.buscarTaller(hora, fecha, id)));
			break;
		case 2:
			s = sessionFactory.getCurrentSession();
//			s = HibernateUtils.getSessionFactory().openSession();
			int idd = Integer.parseInt(session.getAttribute("inscripcion").toString());
			int idt = Integer.parseInt(request.getParameter("idtaller"));
			SimpleDateFormat formatter3 = new SimpleDateFormat("HH:mm");
			String hour2 = request.getParameter("hora");
			SimpleDateFormat formatter4 = new SimpleDateFormat("yyyy-MM-dd");
			String date2 = request.getParameter("fecha");
			Date fecha2= formatter4.parse(date2);
			Date hora2 = formatter3.parse(hour2);
			DetalleInscripcion di = s.get(DetalleInscripcion.class,idd);
			Taller t = s.get(Taller.class, idt);
			it.setDetalleInscripcion(di);
			it.setTaller(t);
			it.setHora(hora2);
			it.setFecha(fecha2);
			out.println(td.create(it));
			break;
		}

	}
}
