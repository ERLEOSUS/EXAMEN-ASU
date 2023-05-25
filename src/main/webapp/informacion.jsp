<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Oratorio Padre José Carolo</title>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Open+Sans">
<link rel="stylesheet" href="estilos.css">

</head>
<body>

	<header>
		<div>
			<a class=".a_header"> <img src="img/logo_asu.svg"></a> <a
				href="https://www.ups.edu.ec/"><img src="img/logo_ups.png"
				width="100" height="100"></a>
		</div>

		<nav>
			<ul>
				<li><a href="index.jsp" class="letra-grande">INICIO</a></li>
				<li><a href="informacion.jsp" class="letra-grande">INFORMACION</a></li>
				<li><a href="eventos.jsp" class="letra-grande">EVENTOS</a></li>
				<li><a href="inicio_sesion.jsp" class="letra-grande">LOGIN</a></li>
			</ul>
		</nav>
	</header>
	<main>
		<section>
			<div class="grid-container">
				<div class="grid-item">
					<div id="animacion">Historia y Trayectoria</div>
					<p class="parrafo-pequeno">El Grupo de Oratoria "Nombre del
						Grupo" fue fundado en [año de fundación] por un grupo de
						entusiastas de la oratoria que buscaban un espacio para practicar
						y perfeccionar sus habilidades de hablar en público. Desde
						entonces, hemos crecido y nos hemos convertido en una comunidad
						diversa de miembros comprometidos con el arte de la comunicación
						efectiva.</p>
					<div class="centrar-imagen">
						<img class="imagen-redonda" src="img/historia.png">
					</div>

				</div>
				<div class="grid-item">
					<div id="animacion">Actividades</div>
					<ul>
						<li>Discursos preparados</li>
						<li>Evaluaciones y retroalimentación</li>
						<li>Debates</li>
						<li>Talleres y capacitaciones</li>
					</ul>
					<div class="centrar-imagen">
						<img class="imagen-redonda" src="img/actividades.png">
					</div>
				</div>
			</div>
			<hr class="linea-color">
			<div class="grid-item">
				<div id="animacion">Lugar y Horario de Reuniones</div>
				<p>Nos reunimos regularmente en [lugar de reunión] los [días de
					la semana] a las [horario de reunión]. El lugar de reunión
					proporciona un ambiente acogedor y cómodo para practicar la
					oratoria y fomentar la participación activa de todos los miembros.</p>
				<div class="centrar-imagen">
					<img class="imagen-redonda cent" src="img/universidad.png">
				</div>
				<p>¡Te invitamos a unirte a nuestro grupo y mejorar tus
					habilidades de oratoria! Si estás interesado/a, no dudes en
					contactarnos a través de [información de contacto] para obtener más
					detalles sobre nuestras próximas reuniones.</p>
			</div>
		</section>
</body>
	<footer> 
	 <div class="footer-icons">
    <img class="icon" style="width: 80px; height: 80px; margin: 0 10px;" src="img/facebook.png" alt="Icono 1">
    <img class="icon" style="width: 80px; height: 80px; margin: 0 10px;" src="img/instagram.png" alt="Icono 2">
    <img class="icon" style="width: 80px; height: 80px; margin: 0 10px;" src="img/whatsapp.png" alt="Icono 3">
  	</div>
</footer>
</html>