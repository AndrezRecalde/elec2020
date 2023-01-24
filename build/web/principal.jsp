<!DOCTYPE html>
<html lang="en">
    <head>
        <LINK REL="SHORTCUT ICON" HREF="images/logo_up.png">
        <meta http-equiv='Content-Type' content='text/html; charset=UTF-8' />

        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Sistema de Control Electoral</title>

        <link href="styles/basic.css" rel="stylesheet" type="text/css" media="screen" /> 

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">

        <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js"></script>

        <!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script> -->


        <style type="text/css">
            .bs-example{
                margin: 20px;
            }
            .main_cont{
                width: 100%;
                height: 100%;
                position: absolute;
                top: 55px;
            }
            .position {
                z-index: 1;
            }
            .img-avatar {
                border-radius: 50%;
                width: 40px;
                height: 40px;
            }
        </style>


        <%
            if (session.getAttribute("tipo_usuario") == null) {
                response.sendRedirect("salir.jsp?men=Su sesion ha caducado.");
                return;
            }
        %>
    </head> 
    <body>
        <!-- Fixed navbar -->
        <div class="container-fluid position">

            <nav class="navbar navbar-expand-lg bg-light navbar-fixed-top">
                <!-- <a class="navbar-brand" href="#">Elecciones</a> -->
                <img class="img-avatar me-5" src="images/logo.png"/>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbar">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="principal.jsp">Inicio</a>
                        </li>
                        <% if (session.getAttribute("tipo_usuario").toString().equals("1")
                                    || session.getAttribute("tipo_usuario").toString().equals("2")
                                    || session.getAttribute("tipo_usuario").toString().equals("3")) { %>
                        <li class="nav-item">
                            <a class="nav-link" href="dig_actas_dignidad.jsp" target="dynamic">Digitación</a>
                        </li>          
                        <% } %>

                        <% if (session.getAttribute("tipo_usuario").toString().equals("5")) { %>
                        <li class="nav-item">
                            <a class="nav-link" href="dig_actas_dignidad.jsp" target="dynamic">Digitación</a>
                        </li> 
                        <% } %>

                        <!-- Inicio de Logistica de Delegados -->

                        <%-- if (session.getAttribute("tipo_usuario").toString().equals("1")
                                    || session.getAttribute("tipo_usuario").toString().equals("2")) { --%> 
                        <!--  <li class="nav-item dropdown">
                             <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                 Logística
                             </a>
                             <ul class="dropdown-menu">
                                 <li class="dropdown-header">Juntas</li>
                                 <li><a class="dropdown-item" href="jun_responsable.jsp" target="dynamic">Delegados JRV</a></li>
                                 <li><a class="dropdown-item" href="resultados_juntas?op=avance_responsables" target="dynamic">Delegados JRV</a></li>
                                 <li><a class="dropdown-item" href="admin/admin_controlador.srvlt_junta_listar_todos" target="dynamic">Listar JRV</a></li>
                                 <li><hr class="dropdown-divider"></li>
                                 <li class="dropdown-header">Recintos</li>
                                 <li><a class="dropdown-item" href="admin/admin_controlador.srvlt_recintos_listar_todos" target="dynamic">Coordinadores de Recinto</a></li>
                                 <li class="dropdown-header">PDF</li>
                                 <li><a class="dropdown-item" href="responsables_pdf.jsp?tipo=pdf">Delegados CNE</a></li>
 
                             </ul>
                         </li> -->
                        <%-- } --%> 

                        <!-- Fin de Logistica de Delegados -->

                        <% if (session.getAttribute("tipo_usuario").toString().equals("1")
                                    || session.getAttribute("tipo_usuario").toString().equals("2")
                                    || session.getAttribute("tipo_usuario").toString().equals("4")) { %>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                Reportes
                            </a>
                            <ul class="dropdown-menu">
                                <li class="dropdown-header">Avances & Resultados</li>
                                <li><a class="dropdown-item" href="resultados_juntas?op=avance_escrutinio" target="dynamic">Escrutinio</a></li>
                                <li><a class="dropdown-item" href="resultados?iddignidad=1&idcanton=1&idparroquia=1&idrecinto=1&nivel_territorio_prov_jsp=" target="dynamic">Resultados</a></li>
                                <!-- <li><a class="dropdown-item" href="webster?iddignidad=3" target="dynamic">Webster</a></li> -->

                                <li><hr class="dropdown-divider"></li>
                                <li class="dropdown-header">Actas</li>
                                <li><a class="dropdown-item" href="admin/admin_controlador.srvlt_acta_listar_todos?op=inc" target="dynamic">Inconsistentes</a></li>
                                <li><a class="dropdown-item" href="admin/admin_controlador.srvlt_acta_listar_todos?op=tod" target="dynamic">Ingresadas</a></li>

                            </ul>
                        </li>

                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                Websters
                            </a>
                            <ul class="dropdown-menu">
                                <li class="dropdown-header">Reportes Webster</li>                              
                                <li><a class="dropdown-item" href="webster?iddignidad=3" target="dynamic">Concejales Urbanos C1</a></li>
                                <li><a class="dropdown-item" href="websterc2?iddignidad=3" target="dynamic">Concejales Urbanos C2</a></li>
                            </ul>
                        </li>


                        <% }%>                     
                        <% if (session.getAttribute("tipo_usuario").toString().equals("1")) { %>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                Administrar
                            </a>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="admin/admin_controlador.srvlt_usuario_listar_todos" target="dynamic">Usuarios</a></li>
                                <li><a class="dropdown-item" href="admin/admin_controlador.srvlt_accesos_listar_todos?op=todos" target="dynamic">Accesos</a></li>
                                <li><a class="dropdown-item" href="admin/admin_controlador.srvlt_acta_images_listar_todos?op=todos" target="dynamic">Imágenes de Actas</a></li>
                            </ul>
                        </li>
                        <% }%>
                    </ul>

                    <ul class="nav navbar-nav navbar-right">
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                <%= session.getAttribute("usuario")%>
                            </a>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="cambiar_contrasena.jsp" target="dynamic">Cambiar Contraseña</a></li>

                                <li><hr class="dropdown-divider"></li>

                                <li><a class="dropdown-item" href="./salir.jsp">Salir</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </nav>
        </div>

        <div class="main_cont">
            <iframe src="welcome.jsp" style="width: 100%;height: 100%;" name="dynamic">

            </iframe>
        </div> <!-- /container -->

    </body>
</html>                            