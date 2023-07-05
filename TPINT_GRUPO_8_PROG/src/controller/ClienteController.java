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
public class ClienteController {

	ApplicationContext appContext = new ClassPathXmlApplicationContext("resources/Beans.xml");

	@RequestMapping(value="/cliente.html", method = RequestMethod.POST)
	public ModelAndView eventoRedireccionaCliente() {
		ModelAndView MV = (ModelAndView) appContext.getBean("beanModelView");
		MV.setViewName("Cliente");
		return MV;
	}


}
