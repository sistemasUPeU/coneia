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

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import pe.edu.upeu.CONEIA.dao.TallerDAO;

@Controller
@RequestMapping("/")
public class HomeController {
	private TallerDAO td = new TallerDAO();

	@RequestMapping("/")
	public String main(HttpServletRequest request, HttpServletResponse response,
			@RequestParam(value = "error", required = false) String error,
			@RequestParam(value = "logout", required = false) String logout) {

		return "main";
	}

	@RequestMapping("inscripcion")
	public ModelAndView SignIn(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView model = new ModelAndView();

		model.setViewName("inscripcion");

		return model;
	}

	@RequestMapping("programa")
	public ModelAndView Program(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = new ModelAndView();	
		model.setViewName("programa");
		model.addObject("lista", td.readAll());
		return model;
	}
	
	@RequestMapping("programaAdmin")
	public ModelAndView ProgramAdmin(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = new ModelAndView();
		
		model.setViewName("programaAdmin");

		return model;
	}
	
	@RequestMapping("asistencia")
	public ModelAndView Asistencia(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = new ModelAndView();
		
		model.setViewName("asistencia");

		return model;
	}
	
	@RequestMapping("asistenciaAdmin")
	public ModelAndView AsistenciaAdmin(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = new ModelAndView();
		
		model.setViewName("asistenciaAdmin");

		return model;
	}

	

	@RequestMapping("login")
	public ModelAndView Login(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView model = new ModelAndView();

		model.setViewName("login");

		return model;
	}

	@RequestMapping("principal")
	public ModelAndView Principal(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView model = new ModelAndView();

		model.setViewName("principal");

		return model;
	}



}
