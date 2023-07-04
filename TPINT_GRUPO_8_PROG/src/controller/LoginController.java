package controller;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class LoginController {

	ApplicationContext appContext = new ClassPathXmlApplicationContext("resources/Beans.xml");

	@RequestMapping(value="/login.html", method = RequestMethod.GET)
	public ModelAndView eventoRedireccionarLogin() {
		ModelAndView MV = (ModelAndView) appContext.getBean("beanModelView");
		MV.setViewName("Login");
		return MV;
	}
	
	@RequestMapping(value="/home.html", method = RequestMethod.GET)
	public ModelAndView eventoRedireccionarInicio() {
		ModelAndView MV = (ModelAndView) appContext.getBean("beanModelView");
		MV.setViewName("Inicio");
		return MV;
	}

}
