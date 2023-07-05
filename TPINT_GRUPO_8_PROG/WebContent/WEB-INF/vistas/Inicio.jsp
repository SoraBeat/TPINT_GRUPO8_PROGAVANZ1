<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Pagina inicio</title>
<link href="../Estilos/login.css" rel="StyleSheet" type="text/css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css"
	integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M"
	crossorigin="anonymous">

</head>
<body style="height: 100vh;">

	<!-- Barra navegacion -->
	<nav
		class="navbar navbar-expand-lg navbar-light  bg-dark text-white-50">
	<div>
	<form action="home.html" method="get">
		<input type="submit" value="Banco"
			class="navbar-brand btn btn-outline-dark text-light font-weight-bold"
			name="btnIndex">
	</form>	
	</div>
	<%
		if (request.getAttribute("Usuario")!= null) {
	%>
	<div class="dropdown show">
		<a class="btn btn-secondary dropdown-toggle" href="#" role="button"
			id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true"
			aria-expanded="false"> Menu </a>
		
		<div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
			<%
			String rol = (String) request.getAttribute("Rol");
			if (rol.equals("ROLE_CLIENTE")) {
			%>
			<form action="prestamo.html" method="get">
				<input type="submit" value="Prestamos" class="dropdown-item"
					name="btnPrestamos">
			</form>
				<%
					}
					if (rol.equals("ROLE_PRESTAMO")) {
				%>
			<form action="cliente.html" method="get">
				<input type="submit" value="Clientes" class="dropdown-item"
					name="btnClientes">
			</form>
			<%} %>
		</div>
	</div>
	<div class="ml-auto ">
    <form action="logout.html" method="post">
        <input type="submit" value="Cerrar Sesion" name="btnSalir" class="btn btn-link text-white">
    </form>
    </div>
	<%
		}
	%> </nav>
	
	<h1>BIENVENIDO ${Usuario.toUpperCase()}</h1>

<footer id="align-bottom"
	class="py-4 bg-dark text-white-50 fixed-bottom">
<div class="container text-center">
	<span class="logo-text text-white">© 2023 - By Grupo Nro 8 ProgAvanzada1
		- todos los derechos reservados </span>
</div>
</footer>


<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
	integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"
	integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4"
	crossorigin="anonymous"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"
	integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1"
	crossorigin="anonymous"></script>
</body>
</html>