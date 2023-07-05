<import resource="security-config.xml" />
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>
<!-- CDN BOOSTRAP -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM"
	crossorigin="anonymous">

</head>
<body>

	<!-- BARRA NAVEGACION -->
	<nav class="navbar bg-dark border-bottom border-bottom-dark">
	<div class="container-fluid">
		<a class="navbar-brand text-light">Banco</a>
	</div>
	</nav>

	<!-- TITULO -->
	<h1 class="text-center my-4">Login</h1>

	<!-- LOGIN -->
	<div class="container w-25">
		<div
			class="card card-container d-flex flex-column justify-content-center align-items-center p-3">
			<img style="width: 100px; height: 100px; border-radius: 100%;"
				src="https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_640.png"
				alt="" />
			<p id="profile-name" class="profile-name-card"></p>
			<form class="form-signin w-75"
				action="${pageContext.request.contextPath}/verificar-usuario"
				method="POST">
				<input type="hidden" name="${_csrf.parameterName}"
					value="${_csrf.token}" /> <input type="text" id="username"
					name="username" class="form-control mb-3" placeholder="Usuario"
					required autofocus> <input type="password" id="password"
					name="password" class="form-control mb-3" placeholder="Contraseña"
					required>
				<button class="btn btn-lg btn-primary btn-block btn-signin"
					type="submit">Entrar</button>
			</form>
			<%
				if (request.getParameter("error") != null) {
			%>
			<div class="alert alert-danger" role="alert">Credenciales
				invalidas!</div>
			<%
				}
			%>
		</div>
	</div>



	<footer id="sticky-footer"
		class="py-4 bg-dark text-white-50 fixed-bottom">
	<div class="container text-center">
		<span class="logo-text">© 2023 - By Grupo Nro 8 PROG. AVAN. 1 -
			todos los derechos reservados </span>
	</div>
	</footer>

	<!-- CDN BOOSTRAP -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
		crossorigin="anonymous"></script>
</body>
</html>