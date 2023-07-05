package controller;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
	public ModelAndView eventoRedireccionarLogin(HttpServletRequest request,HttpServletResponse response) {
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
        	MV.setViewName("Inicio"); 
        } else {
        	
        	Cookie[] cookies = request.getCookies();
            
            if (cookies != null) {
                for (Cookie cookie : cookies) {
                    if (cookie.getName().equals("JSESSIONID")) {
                        cookie.setValue("");
                        cookie.setMaxAge(0);
                        response.addCookie(cookie);
                    }
                }
            }
            
        	MV.setViewName("Login"); 
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
	
	@RequestMapping(value="/error.html", method = RequestMethod.GET)
	public ModelAndView eventoRedireccionarError() {
		ModelAndView MV = (ModelAndView) appContext.getBean("beanModelView");
		MV.setViewName("PaginaError");
		return MV;
	}

}
