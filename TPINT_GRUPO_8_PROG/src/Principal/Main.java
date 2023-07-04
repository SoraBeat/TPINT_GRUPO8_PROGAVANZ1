package Principal;

import org.hibernate.Session;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import Dao.ConfigHibernate;
import Entidad.Usuario;

public class Main {

	public static void main(String[] args) {
		ApplicationContext context = new ClassPathXmlApplicationContext("resources/Beans.xml");
        BCryptPasswordEncoder passwordEncoder = context.getBean("passwordEncoder", BCryptPasswordEncoder.class);
        ConfigHibernate ch = (ConfigHibernate) context.getBean("beanConfigHibernate");
        Session session = ch.abrirConexion();
        session.beginTransaction();
        Usuario usuario = (Usuario) context.getBean("beanUsuario");
        String claveEncriptada = passwordEncoder.encode(usuario.getContrasenia());
        usuario.setContrasenia(claveEncriptada);
        session.save(usuario);
        session.getTransaction().commit();
        ch.cerrarSession();
        System.out.println(claveEncriptada);
	}

}
