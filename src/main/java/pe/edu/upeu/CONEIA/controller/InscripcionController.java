package pe.edu.upeu.CONEIA.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.persistence.ParameterMode;
import javax.persistence.Query;
import javax.persistence.StoredProcedureQuery;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import pe.edu.upeu.CONEIA.entity.Inscripcion;
import pe.edu.upeu.CONEIA.entity.Persona;
import pe.edu.upeu.CONEIA.entity.Rol;
import pe.edu.upeu.CONEIA.service.DetalleInscripcionService;
import pe.edu.upeu.CONEIA.service.InscripcionService;

@Controller
@RequestMapping("/subscribe")
public class InscripcionController {
	Gson gs =  new Gson();
	public List<String> archi = new ArrayList<>();
	private static String UPLOADED_FOLDER = "C:\\Users\\Harold\\git\\coneia5\\CONEIA\\src\\main\\webapp\\resources\\files";
	
	@Autowired
	private InscripcionService insService;

	@Autowired
	private DetalleInscripcionService detalleService;


	@RequestMapping("/validate")
	public @ResponseBody String validate(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("entro a validate");
		Gson g = new Gson();

		String data =  request.getParameter("opcion");
		System.out.println("controller string" + data);
		
		int respuesta = 0;
		JsonParser parser = new JsonParser();

		// Obtain Array
		JsonArray gsonArr = parser.parse(data).getAsJsonArray();
		System.out.println(gsonArr);
		System.out.println("size " + gsonArr.size());
		int cont = 0;

		for (JsonElement obje : gsonArr) {

			// Object of array
			JsonObject gsonObj = obje.getAsJsonObject();
			System.out.println("gsonObj> " + gsonObj);
			// Primitives elements of object

			String nombre = gsonObj.get("nombre").getAsString();
			String dni = gsonObj.get("dni").getAsString();
			System.out.println(nombre+", "+dni);
			// Object Constructor
			respuesta = insService.validardni(dni);
			//
			if(respuesta!=0) {
				System.out.println("respuesta controller validar dni: " + dni +" , "+respuesta);
				break;
			}
		}
		return g.toJson(respuesta);
	}
	

	@RequestMapping("/createEnrollment")
	public @ResponseBody String CreateEnrollment(HttpServletRequest request, HttpServletResponse response) {
		Gson g = new Gson();

		int answer = 0;
		try {
		
			Inscripcion h = new Inscripcion();

			Object datos = request.getParameter("op");
			String data =  request.getParameter("op");
			System.out.println("controller obj" + datos);
			System.out.println("controller string" + data);
			
			
			
			
			answer = insService.create("", data);
			System.out.println("answer controller" + answer);

		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("Error controller:" + e);
		}

		return g.toJson(answer);

	}


	
	@Autowired
	ServletContext context;

	@RequestMapping(path = "/uploadfile", method = RequestMethod.POST)
    @ResponseBody
	public int handleFormUpload(@RequestParam("file") List<MultipartFile> file,@RequestParam("voucher") String voucher, @RequestParam("idinscripcion") String id, HttpServletResponse response, HttpServletRequest request) throws IOException {
		ServletContext cntx = request.getServletContext();
		System.out.println(file);
		System.out.println(voucher);
		System.out.println("inscripcion> " + id);
		int res = 0;
		
	
		if (!file.isEmpty()) {

			try {
				for (MultipartFile fi : file) {
					System.out.println(file);
					
					String path = UPLOADED_FOLDER  + File.separator + fi.getOriginalFilename();
					
					
					
					String nome= fi.getOriginalFilename();
				
					nome="voucher"+id;
					FilenameUtils fich = new FilenameUtils();
					
//					path = UPLOADED_FOLDER  + File.separator + nome+"."+FilenameUtils.getExtension(path);
					path = cntx.getRealPath("/resources/files/" + nome+"."+FilenameUtils.getExtension(path));
					System.out.println("ruta del archivo " + path);
					File destFile = new File(path);
					
					fi.transferTo(destFile);
					archi.add(destFile.getName());
					archi.add(destFile.getPath());
//					FilenameUtils fich = new FilenameUtils();
					archi.add(FilenameUtils.getExtension(path));
					
					
					archi.add(String.valueOf(destFile.length()));
					
					String nombre = destFile.getName();
					String url = destFile.getPath();
					System.out.println(nombre);

					Inscripcion in = new Inscripcion();
					in.setIdinscripcion(Integer.parseInt(id));
					in.setNroVoucher(voucher);
					in.setUrlVoucher(nombre);
					res = insService.update(in);
//					res = vd.subirDocumento("", "", url, idvac);
				}

			} catch (IOException | IllegalStateException ec) {
				ec.getMessage();
				ec.printStackTrace();
			}
			System.out.println("gson> " + gs.toJson(archi));

			System.out.println("respuesta>> " + res);

		}
		
		 return res;

	}
	
	
}
