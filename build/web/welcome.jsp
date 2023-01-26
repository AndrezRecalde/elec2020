<%-- 
    Document   : welcome
    Created on : 22/01/2013, 02:31:30 PM
    Author     : userver1
--%>

<%@page import="eleccion.usuario"%>
<%@page import="eleccion.actaDB"%>
<%@page import="eleccion.candidatoDB"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Control Electoral</title>
        <link href="styles/generales.css" rel="stylesheet" type="text/css" media="screen" />
        <!-- <link href="styles/basic.css" rel="stylesheet" type="text/css" media="screen" /> -->

        <jsp:useBean id="usuario" class="eleccion.usuarioDB" scope="page">
            <jsp:setProperty name="usuario" property="*"></jsp:setProperty>
        </jsp:useBean>

        <!-- Google Fonts -->
        <link href="https://fonts.googleapis.com/css?family=Roboto:400,700&subset=latin,cyrillic-ext" rel="stylesheet" type="text/css"/>
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" type="text/css"/>

        <!-- Bootstrap Core Css -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">

        <!-- Iconos -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@tabler/icons@latest/iconfont/tabler-icons.min.css">

        <!-- Waves Effect Css -->
        <link href="plugins/node-waves/waves.css" rel="stylesheet" />

        <!-- Animation Css -->
        <link href="plugins/animate-css/animate.css" rel="stylesheet" />

        <!-- Morris Chart Css-->
        <link href="plugins/morrisjs/morris.css" rel="stylesheet" />

        <!-- Custom Css -->
        <!-- <link href="css/style.css" rel="stylesheet"/> -->

        <!-- AdminBSB Themes. You can choose a theme from css/themes instead of get all themes -->
        <link href="css/themes/all-themes.css" rel="stylesheet" />
    </head>
    <body>
        <%
            int idusu = 0;
            try {
                idusu = Integer.parseInt(session.getAttribute("idusuario").toString());
            } catch (Exception e) {
                response.sendRedirect("error.jsp?men=Su sesión ha caducado.");
            }
            usuario usu = usuario.CargarxId(idusu);
            actaDB acDB = new actaDB();
            candidatoDB _candidato = new candidatoDB();

            //int totac = acDB.ContarActasUsuario(idusu);
            int totacUsuPrefectos, totacUsuAlcaldes, totacUsuConcejalesUrbanos, totacUsuConcejalesRurales, totacUsuJuntas, totacUsuCP, totacUsuPCH, totacUsuPCM, totacUsuPCME;
            int totalCandidatosPrefectos, totalCandidatosAlcaldes, totalCandidatosConcejalesUrbanos, totalCandidatosConcejalesRurales, totalCandidatosJuntas;

            totalCandidatosPrefectos = _candidato.ContarCandidatosxDignidad(1);
            totalCandidatosAlcaldes = _candidato.ContarCandidatosxDignidad(2);
            totalCandidatosConcejalesUrbanos = _candidato.ContarCandidatosxDignidad(3);
            totalCandidatosConcejalesRurales = _candidato.ContarCandidatosxDignidad(4);
            totalCandidatosJuntas = _candidato.ContarCandidatosxDignidad(5);

            int idTipoUsuario = Integer.parseInt(session.getAttribute("idtipousuario").toString());
            if (idTipoUsuario == 3 || idTipoUsuario == 5) {//Digitador o conteo rapido
                totacUsuPrefectos = acDB.ContarActasUsuarioDignidad(idusu, 1);
                totacUsuAlcaldes = acDB.ContarActasUsuarioDignidad(idusu, 2);
                totacUsuConcejalesUrbanos = acDB.ContarActasUsuarioDignidad(idusu, 3);
                totacUsuConcejalesRurales = acDB.ContarActasUsuarioDignidad(idusu, 4);
                totacUsuJuntas = acDB.ContarActasUsuarioDignidad(idusu, 5);
                
            } else {
                totacUsuPrefectos = acDB.ContarActasXDignidad(1);
                totacUsuAlcaldes = acDB.ContarActasXDignidad(2);
                totacUsuConcejalesUrbanos = acDB.ContarActasXDignidad(3);
                totacUsuConcejalesRurales = acDB.ContarActasXDignidad(4);
                totacUsuJuntas = acDB.ContarActasXDignidad(5);
            }
        %>
        <div class="mt-3"></div>
        <div class="container-fluid mb-3">
            <div class="row clearfix">
                <div class="col-lg-12 col-xs-12">
                    <div class="text-center">
                        <h3>Sistema de Elecciones</h3>
                    </div>
                </div>
            </div>
        </div>
        
        <div class="row d-flex justify-content-center mt-3">
                <div class="col-lg-5">
                    <div class="alert alert-info" id="alerts-x" role="alert">
                        Info: <strong>El total de candidatos es a nivel Provincial</strong> 
                    </div>
                </div>
            </div> 

            <div class="row d-flex justify-content-center">
                <div class="col-lg-4">
                    <div class="card rounded ml-5">
                        <div style="text-align: center;">
                            <i class="ti ti-building-skyscraper" style="font-size: 100px;"></i>
                            <h6 style="margin-top: 0.25em;">Prefectos & Viceprefectos</h6>
                        </div>
                        <div class="card-body">

                            <h6 class="card-title">Información</h6>
                            <div class="input-group mb-3">
                                <span class="input-group-text" id="basic-addon3">Número de Candidatos</span>
                                <input value="<%= totalCandidatosPrefectos%>" type="text" class="form-control fw-bold" id="basic-url" aria-describedby="basic-addon3" disabled readonly >

                            </div>
                            <div class="input-group mb-3">
                                <span class="input-group-text" id="basic-addon3">Actas Ingresadas</span>
                                <input value="<%= totacUsuPrefectos%>" type="text" class="form-control fw-bold" id="basic-url" aria-describedby="basic-addon3" disabled readonly >
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="card rounded">
                        <div style="text-align: center;">
                            <i class="ti ti-building-bank" style="font-size: 100px;"></i>
                            <h6 style="margin-top: 0.25em;">Alcaldes</h6>
                        </div>
                        <div class="card-body">
                            <h6 class="card-title">Información</h6>
                            <div class="input-group mb-3">
                                <span class="input-group-text" id="basic-addon3">Número de Candidatos</span>
                                <input value="<%= totalCandidatosAlcaldes%>" type="text" class="form-control fw-bold" id="basic-url" aria-describedby="basic-addon3" disabled readonly >
                            </div>
                            <div class="input-group mb-3">
                                <span class="input-group-text" id="basic-addon3">Actas Ingresadas</span>
                                <input value="<%= totacUsuAlcaldes%>" type="text" class="form-control fw-bold" id="basic-url" aria-describedby="basic-addon3" disabled readonly >
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row d-flex justify-content-center mt-2">
                <div class="col-lg-4">
                    <div class="card rounded">
                        <div style="text-align: center;">
                            <i class="ti ti-list-details" style="font-size: 100px;"></i>
                            <h6 style="margin-top: 0.25em;">Concejales Urbanos</h6>
                        </div>
                        <div class="card-body">
                            <h6 class="card-title">Información</h6>
                            <div class="input-group mb-3">
                                <span class="input-group-text" id="basic-addon3">Número de Listas de Candidatos</span>
                                <input value="<%= totalCandidatosConcejalesUrbanos%>" type="text" class="form-control fw-bold" id="basic-url" aria-describedby="basic-addon3" disabled readonly >
                            </div>
                            <div class="input-group mb-3">
                                <span class="input-group-text" id="basic-addon3">Actas Ingresadas</span>
                                <input value="<%= totacUsuConcejalesUrbanos%>" type="text" class="form-control fw-bold" id="basic-url" aria-describedby="basic-addon3" disabled readonly >
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="card rounded">
                        <div style="text-align: center;">
                            <i class="ti ti-list-details" style="font-size: 100px;"></i>
                            <h6 style="margin-top: 0.25em;">Concejales Rurales</h6>
                        </div>
                        <div class="card-body">
                            <h6 class="card-title">Información</h6>
                            <div class="input-group mb-3">
                                <span class="input-group-text" id="basic-addon3">Número de Listas de Candidatos</span>
                                <input value="<%= totalCandidatosConcejalesRurales%>" type="text" class="form-control fw-bold" id="basic-url" aria-describedby="basic-addon3" disabled readonly >
                            </div>
                            <div class="input-group mb-3">
                                <span class="input-group-text" id="basic-addon3">Actas Ingresadas</span>
                                <input value="<%= totacUsuConcejalesRurales%>" type="text" class="form-control fw-bold" id="basic-url" aria-describedby="basic-addon3" disabled readonly >
                            </div>                    
                        </div>
                    </div>
                </div>
            </div>

            <div class="row d-flex justify-content-center mt-2 mb-2">
                <div class="col-lg-8">
                    <div class="card rounded">
                        <div style="text-align: center;">
                            <i class="ti ti-list-numbers" style="font-size: 100px;"></i>
                            <h6 style="margin-top: 0.25em;">Juntas Parroquiales</h6>
                        </div>
                        <div class="card-body">
                            <h6 class="card-title">Información</h6>
                            <div class="input-group mb-3">
                                <span class="input-group-text" id="basic-addon3">Número de Listas de Candidatos</span>
                                <input value="<%= totalCandidatosJuntas%>" type="text" class="form-control fw-bold" id="basic-url" aria-describedby="basic-addon3" disabled readonly >
                            </div>
                            <div class="input-group mb-3">
                                <span class="input-group-text" id="basic-addon3">Actas Ingresadas</span>
                                <input value="<%= totacUsuJuntas%>" type="text" class="form-control fw-bold" id="basic-url" aria-describedby="basic-addon3" disabled readonly >
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        <!-- Jquery Core Js -->
        <!-- <script src="plugins/jquery/jquery.min.js"></script> -->

        <!-- Bootstrap Core Js -->
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js"></script>
        <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>


        <!-- Select Plugin Js -->
        <script src="plugins/bootstrap-select/js/bootstrap-select.js"></script>

        <!-- Slimscroll Plugin Js -->
        <script src="plugins/jquery-slimscroll/jquery.slimscroll.js"></script>

        <!-- Waves Effect Plugin Js -->
        <script src="plugins/node-waves/waves.js"></script>

        <!-- Jquery CountTo Plugin Js -->
        <script src="plugins/jquery-countto/jquery.countTo.js"></script>

        <!-- Morris Plugin Js -->
        <script src="plugins/raphael/raphael.min.js"></script>
        <script src="plugins/morrisjs/morris.js"></script>

        <!-- ChartJs -->
        <script src="plugins/chartjs/Chart.bundle.js"></script>

        <!-- Flot Charts Plugin Js -->
        <script src="plugins/flot-charts/jquery.flot.js"></script>
        <script src="plugins/flot-charts/jquery.flot.resize.js"></script>
        <script src="plugins/flot-charts/jquery.flot.pie.js"></script>
        <script src="plugins/flot-charts/jquery.flot.categories.js"></script>
        <script src="plugins/flot-charts/jquery.flot.time.js"></script>

        <!-- Sparkline Chart Plugin Js -->
        <!-- <script src="plugins/jquery-sparkline/jquery.sparkline.js"></script> -->

        <!-- Custom Js -->
        <script src="js/admin.js"></script>
        <script src="js/pages/index.js"></script>
        
        <script type="text/javascript">
            $("#alerts-x").fadeIn(300).delay(1500).fadeOut(400);
        </script>
        <script>
            localStorage.setItem("login", "logueado");
        </script>
    </body>

</html>

