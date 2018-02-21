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

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import pe.edu.upeu.CONEIA.dao.TallerDAO;
import pe.edu.upeu.CONEIA.service.TallerService;

@Controller
@RequestMapping("/")
public class HomeController {
	@Autowired
	private TallerService td;

	@RequestMapping("/")
	public String main(HttpServletRequest request, HttpServletResponse response,
			@RequestParam(value = "error", required = false) String error,
			@RequestParam(value = "logout", required = false) String logout) {

		return "main";
	}
	@RequestMapping("error")
	public String error(HttpServletRequest request, HttpServletResponse response) {
	
		return "error";
	}

	@RequestMapping("inscripcion")
	public ModelAndView SignIn(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView model = new ModelAndView();

		model.setViewName("inscripcion");

		return model;
	}

	@RequestMapping("programa")
	public ModelAndView Program(HttpServletRequest request, HttpServletResponse response) throws ParseException {

		ModelAndView model = new ModelAndView();	
		model.setViewName("programa");
		model.addObject("conferenciaLunes", td.findTalleres(3, "2018-06-04"));
		model.addObject("actividadesLunes", td.findTalleres(5, "2018-06-04"));
		model.addObject("concursoMartes", td.findTalleres(5, "2018-06-05"));
		model.addObject("actividadesMiercoles", td.findTalleres(5, "2018-06-06"));
		model.addObject("conferenciaMiercoles", td.findTalleres(3, "2018-06-06"));
		model.addObject("conferenciaJueves", td.findTalleres(3, "2018-06-07"));
		model.addObject("conferenciaViernes", td.findTalleres(3, "2018-06-08"));
		model.addObject("actividadesViernes", td.findTalleres(5, "2018-06-08"));
		return model;
	}
	
	
	@RequestMapping("asistencia")
	public ModelAndView Asistencia(HttpServletRequest request, HttpServletResponse response) throws ParseException {

		ModelAndView model = new ModelAndView();
		HttpSession session = request.getSession();
		if(session.getAttribute("dni")!=null) {
			model.setViewName("asistencia");
			model.addObject("assistance",td.buscarTaller2(Integer.parseInt(session.getAttribute("inscripcion").toString())));
			model.addObject("conferenciaLunes", td.findTalleres(3, "2018-06-04"));
			model.addObject("actividadesLunes", td.findTalleres(5, "2018-06-04"));
			model.addObject("concursoMartes", td.findTalleres(5, "2018-06-05"));
			model.addObject("actividadesMiercoles", td.findTalleres(5, "2018-06-06"));
			model.addObject("conferenciaMiercoles", td.findTalleres(3, "2018-06-06"));
			model.addObject("conferenciaJueves", td.findTalleres(3, "2018-06-07"));
			model.addObject("conferenciaViernes", td.findTalleres(3, "2018-06-08"));
			model.addObject("actividadesViernes", td.findTalleres(5, "2018-06-08"));
		}else {
			model.setViewName("main");
		}
		

		return model;
	}
	
	@RequestMapping("printin")
	public ModelAndView AsistenciaAdmin(HttpServletRequest request, HttpServletResponse response,HttpSession session) throws ParseException {

		ModelAndView model = new ModelAndView();
		
		model.setViewName("printin");
		model.addObject("assistance",td.buscarTaller2(Integer.parseInt(session.getAttribute("inscripcion").toString())));
		model.addObject("conferenciaLunes", td.findTalleres(3, "2018-06-04"));
		model.addObject("actividadesLunes", td.findTalleres(5, "2018-06-04"));
		model.addObject("concursoMartes", td.findTalleres(5, "2018-06-05"));
		model.addObject("actividadesMiercoles", td.findTalleres(5, "2018-06-06"));
		model.addObject("conferenciaMiercoles", td.findTalleres(3, "2018-06-06"));
		model.addObject("conferenciaJueves", td.findTalleres(3, "2018-06-07"));
		model.addObject("conferenciaViernes", td.findTalleres(3, "2018-06-08"));
		model.addObject("actividadesViernes", td.findTalleres(5, "2018-06-08"));

		return model;
	}
	
	@RequestMapping("inscrito")
	public @ResponseBody int Insc(HttpSession session) {
		int id = Integer.parseInt(session.getAttribute("inscripcion").toString());
		int cant = td.buscarTaller(id);

		return cant;
	}
	
	@RequestMapping("principal")
	public ModelAndView Principal(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView model = new ModelAndView();

		model.setViewName("principal");

		return model;
	}



}
