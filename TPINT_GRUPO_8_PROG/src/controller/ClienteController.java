package controller;

import java.util.Collection;
import java.util.Iterator;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ClienteController {

	ApplicationContext appContext = new ClassPathXmlApplicationContext("resources/Beans.xml");

	@RequestMapping(value="/cliente.html", method = RequestMethod.GET)
	public ModelAndView eventoRedireccionaCliente() {
		ModelAndView MV = (ModelAndView) appContext.getBean("beanModelView");
	Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		
		String authorityValue = auth.getAuthorities().toString();
		
		Collection<GrantedAuthority> list = (Collection<GrantedAuthority> ) auth.getAuthorities(); 
		
		Iterator<GrantedAuthority> iterator = list.iterator();
		    String firstAuthorityString=null ;
		
		if (iterator.hasNext()) {
		    GrantedAuthority firstAuthority = iterator.next();
		    firstAuthorityString = firstAuthority.getAuthority();
		}
		
		MV.addObject("Rol",firstAuthorityString);
		
		MV.addObject("Usuario",auth.getName());
		MV.setViewName("Cliente");
		return MV;
	}


}
