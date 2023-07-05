package Dao;

import java.util.HashSet;
import java.util.Set;

import org.hibernate.Session;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import Entidad.Usuario;

@Service("usuarioDetailsService")
public class UsuarioDetailsService implements UserDetailsService {

	private ApplicationContext appContext = new ClassPathXmlApplicationContext("resources/Beans.xml");

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		ConfigHibernate ch = (ConfigHibernate) appContext.getBean("beanConfigHibernate");
		Session session = ch.abrirConexion();
		Usuario usuario = (Usuario) session.createQuery("SELECT u FROM Usuario u WHERE u.usuario = :usuario")
				.setParameter("usuario", username).uniqueResult();
		ch.cerrarSession();
		Set<GrantedAuthority> authorities = new HashSet<GrantedAuthority>();
		authorities.add(new SimpleGrantedAuthority(usuario.getRol()));
		return new User(username, usuario.getContrasenia(), authorities);
	}

}