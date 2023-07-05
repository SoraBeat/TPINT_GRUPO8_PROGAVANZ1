package controller;

import java.util.ArrayList;
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

import com.google.protobuf.DescriptorProtos.FieldDescriptorProto.Type;

import antlr.collections.List;

@Controller
public class LoginController {

	ApplicationContext appContext = new ClassPathXmlApplicationContext("resources/Beans.xml");

	@RequestMapping(value="/login.html", method = RequestMethod.GET)
	public ModelAndView eventoRedireccionarLogin() {
		ModelAndView MV = (ModelAndView) appContext.getBean("beanModelView");
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (auth.getPrincipal() != "anonymousUser" ) {

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
        	MV.setViewName("Inicio"); // Nombre de la vista que deseas redireccionar
        } else {
        	MV.setViewName("Login"); // Nombre de la vista de login
        }
        return MV;
	}
	
	@RequestMapping(value="/home.html", method = RequestMethod.GET)
	public ModelAndView eventoRedireccionarInicio() {
		 String primerElemento = null;
		
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
		
		MV.setViewName("Inicio");
		return MV;
	}

}
