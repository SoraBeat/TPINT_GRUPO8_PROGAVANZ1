package controller;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class PrestamoController {

	ApplicationContext appContext = new ClassPathXmlApplicationContext("resources/Beans.xml");

	@RequestMapping(value="/prestamo.html", method = RequestMethod.GET)
	public ModelAndView eventoRedireccionaPrestamo() {
		ModelAndView MV = (ModelAndView) appContext.getBean("beanModelView");
		MV.setViewName("Prestamos");
		return MV;
	}


}
