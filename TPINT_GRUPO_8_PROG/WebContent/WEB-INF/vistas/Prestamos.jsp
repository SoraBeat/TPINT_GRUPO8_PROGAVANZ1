<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Prestamo</title>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Roboto">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css"
	integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M"
	crossorigin="anonymous">
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
<style>
body {
	color: #566787;
	background: #f5f5f5;
	font-family: 'Roboto', sans-serif;
}

.table-responsive {
	margin: 30px 0;
}

.table-wrapper {
	min-width: 1000px;
	background: #fff;
	padding: 20px;
	box-shadow: 0 1px 1px rgba(0, 0, 0, .05);
}

.table-title {
	padding-bottom: 10px;
	margin: 0 0 10px;
	min-width: 100%;
}

.table-title h2 {
	margin: 8px 0 0;
	font-size: 22px;
}

.search-box {
	position: relative;
	float: right;
}

.search-box input {
	height: 34px;
	border-radius: 20px;
	padding-left: 35px;
	border-color: #ddd;
	box-shadow: none;
}

.search-box input:focus {
	border-color: #3FBAE4;
}

.search-box i {
	color: #a0a5b1;
	position: absolute;
	font-size: 19px;
	top: 8px;
	left: 10px;
}

table.table tr th, table.table tr td {
	border-color: #e9e9e9;
}

table.table-striped tbody tr:nth-of-type(odd) {
	background-color: #fcfcfc;
}

table.table-striped.table-hover tbody tr:hover {
	background: #f5f5f5;
}

table.table th i {
	font-size: 13px;
	margin: 0 5px;
	cursor: pointer;
}

table.table td:last-child {
	width: 130px;
}

table.table td a {
	color: #a0a5b1;
	display: inline-block;
	margin: 0 5px;
}

table.table td a.view {
	color: #03A9F4;
}

table.table td a.edit {
	color: #FFC107;
}

table.table td a.delete {
	color: #E34724;
}

table.table td i {
	font-size: 19px;
}

.pagination {
	float: right;
	margin: 0 0 5px;
}

.pagination li a {
	border: none;
	font-size: 95%;
	width: 30px;
	height: 30px;
	color: #999;
	margin: 0 2px;
	line-height: 30px;
	border-radius: 30px !important;
	text-align: center;
	padding: 0;
}

.pagination li a:hover {
	color: #666;
}

.pagination li.active a {
	background: #03A9F4;
}

.pagination li.active a:hover {
	background: #0397d6;
}

.pagination li.disabled i {
	color: #ccc;
}

.pagination li i {
	font-size: 16px;
	padding-top: 6px
}

.hint-text {
	float: left;
	margin-top: 6px;
	font-size: 95%;
}
</style>
<script>
	$(document).ready(function() {
		$('[data-toggle="tooltip"]').tooltip();
	});
</script>
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

	<div style="width: 90%; margin: 0 auto;">
		<div class="table-responsive">
			<div class="table-wrapper">
				<div class="table-title">
					<div class="row">
						<div class="col-sm-8">
							<h2>Prestamos</h2>
						</div>
						<div class="col-sm-4">
							<div class="search-box">
								<i class="material-icons">&#xE8B6;</i> <input type="text"
									class="form-control" placeholder="Search&hellip;">
							</div>
						</div>
					</div>
				</div>
				<table class="table table-striped table-hover table-bordered">
					<thead>
						<tr>
							<th>#</th>
							<th>Fecha<i class="fa fa-sort"></i></th>
							<th>Dni Cliente</th>
							<th>Nombre y Apellido del cliente<i class="fa fa-sort"></i></th>
							<th>Monto</th>
							<th>Total de cuotas<i class="fa fa-sort"></i></th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>1</td>
							<td>10-05-2023</td>
							<td>42128392</td>
							<td>Marcelo Perez</td>
							<td>$7.000</td>
							<td>12</td>
							<td><a href="#" class="view" title="View"
								data-toggle="tooltip"><i class="material-icons">&#xE417;</i></a>
								<a href="#" class="edit" title="Edit" data-toggle="tooltip"><i
									class="material-icons">&#xE254;</i></a> <a href="#" class="delete"
								title="Delete" data-toggle="tooltip"><i
									class="material-icons">&#xE872;</i></a></td>
						</tr>
						<tr>
							<td>2</td>
							<td>15-07-2023</td>
							<td>31549287</td>
							<td>Ana Rodríguez</td>
							<td>$5.500</td>
							<td>8</td>


							<td><a href="#" class="view" title="View"
								data-toggle="tooltip"><i class="material-icons">&#xE417;</i></a>
								<a href="#" class="edit" title="Edit" data-toggle="tooltip"><i
									class="material-icons">&#xE254;</i></a> <a href="#" class="delete"
								title="Delete" data-toggle="tooltip"><i
									class="material-icons">&#xE872;</i></a></td>
						</tr>
						<tr>
							<td>3</td>
							<td>20-09-2023</td>
							<td>28476391</td>
							<td>Luis Gómez</td>
							<td>$9.200</td>
							<td>10</td>


							<td><a href="#" class="view" title="View"
								data-toggle="tooltip"><i class="material-icons">&#xE417;</i></a>
								<a href="#" class="edit" title="Edit" data-toggle="tooltip"><i
									class="material-icons">&#xE254;</i></a> <a href="#" class="delete"
								title="Delete" data-toggle="tooltip"><i
									class="material-icons">&#xE872;</i></a></td>
						</tr>
						<tr>
							<td>4</td>
							<td>05-12-2023</td>
							<td>51897236</td>
							<td>Sofía López</td>
							<td>$3.800</td>
							<td>6</td>

							<td><a href="#" class="view" title="View"
								data-toggle="tooltip"><i class="material-icons">&#xE417;</i></a>
								<a href="#" class="edit" title="Edit" data-toggle="tooltip"><i
									class="material-icons">&#xE254;</i></a> <a href="#" class="delete"
								title="Delete" data-toggle="tooltip"><i
									class="material-icons">&#xE872;</i></a></td>
						</tr>
						<tr>
							<td>5</td>
							<td>30-11-2023</td>
							<td>63982147</td>
							<td>Carlos Martínez</td>
							<td>$6.500</td>
							<td>9</td>
							<td><a href="#" class="view" title="View"
								data-toggle="tooltip"><i class="material-icons">&#xE417;</i></a>
								<a href="#" class="edit" title="Edit" data-toggle="tooltip"><i
									class="material-icons">&#xE254;</i></a> <a href="#" class="delete"
								title="Delete" data-toggle="tooltip"><i
									class="material-icons">&#xE872;</i></a></td>
						</tr>
					</tbody>
				</table>
				<div class="clearfix">
					<div class="hint-text">
						Showing <b>5</b> out of <b>25</b> entries
					</div>
					<ul class="pagination">
						<li class="page-item disabled"><a href="#"><i
								class="fa fa-angle-double-left"></i></a></li>
						<li class="page-item"><a href="#" class="page-link">1</a></li>
						<li class="page-item"><a href="#" class="page-link">2</a></li>
						<li class="page-item active"><a href="#" class="page-link">3</a></li>
						<li class="page-item"><a href="#" class="page-link">4</a></li>
						<li class="page-item"><a href="#" class="page-link">5</a></li>
						<li class="page-item"><a href="#" class="page-link"><i
								class="fa fa-angle-double-right"></i></a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>

	<footer id="align-bottom"
		class="py-4 bg-dark text-white-50 fixed-bottom">
	<div class="container text-center">
		<span class="logo-text text-white">© 2023 - By Grupo Nro 8
			ProgAvanzada1 - todos los derechos reservados </span>
	</div>
	</footer>