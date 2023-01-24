<%-- 
    Document   : act_recepcion
    Created on : 29/01/2013, 05:21:08 PM
    Author     : root
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="eleccion.ClassResultadosBasico"%>
<%@page import="eleccion.usuario"%>
<%@page import="eleccion.usuarioDB"%>
<%@page import="eleccion.actaDB"%>
<%@page import="eleccion.provincia"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.ArrayList"%>
<%@page import="eleccion.provinciaDB"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Digitacion de Actas</title>

        <!-- <link href="styles/generales.css" rel="stylesheet" type="text/css" media="screen" /> -->
        <!-- <link href="styles/basic.css" rel="stylesheet" type="text/css" media="screen" /> -->

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>


        <!-- <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script> -->
         <script type="text/javascript" src="includes/jquery-1.8.2.min.js"></script> 
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js"></script>


        <script src="https://code.highcharts.com/highcharts.js"></script>
        <script src="https://code.highcharts.com/modules/exporting.js"></script>
        <script src="https://code.highcharts.com/modules/export-data.js"></script>
        <script src="https://code.highcharts.com/modules/accessibility.js"></script>

        <script type="text/javascript" src="includes/combinados_2.js"></script>

        <script>
            
        </script>

    </head>
    <body>
        <form name="form1" action="resultados">
            <%
                usuarioDB usu = new usuarioDB();
                SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy HH:mm");
                int idusu = 0;
                try {
                    idusu = Integer.parseInt(session.getAttribute("idusuario").toString());
                } catch (Exception e) {
                    response.sendRedirect("error.jsp?men=Su sesión ha caducado.");
                    return;
                }
                if (request.getParameter("actas") != null) {
                    actaDB actaDB = new actaDB();
                    int iddignidad = 0, idprovincia = 0, idcanton = 0, idparroquia = 0, idzona = 0, idjunta = 0, idrecinto = 0;
                    String dignidad = "", provincia = "", canton = "", parroquia = "", zona = "", junta = "", recinto = "";
                    boolean error = false;
                    String errorString = "";
                    if (request.getParameter("iddignidad") != null) {
                        iddignidad = Integer.parseInt(request.getParameter("iddignidad").toString());
                        if (iddignidad == -1) {
                            error = true;
                            errorString = "Por favor seleecione una Dignidad";
                        }
                        ArrayList lista = null;
                        if (session.getAttribute("dignidades") != null) {
                            lista = (ArrayList) session.getAttribute("dignidades");
                        }
                        if (lista.size() != 0) {
                            for (int x = 0; x < lista.size(); x = x + 2) {
                                if (lista.get(x).toString().equals(request.getParameter("iddignidad").toString())) {
                                    dignidad = lista.get(x + 1).toString();
                                }
                            }
                        }
                    }
                    if (request.getParameter("idprovincia") != null) {
                        idprovincia = Integer.parseInt(request.getParameter("idprovincia").toString());
                        if (idprovincia == -1) {
                            error = true;
                            errorString = "Por favor seleecione una Provincia";
                        }
                        ArrayList lista = null;
                        if (session.getAttribute("provincias") != null) {
                            lista = (ArrayList) session.getAttribute("provincias");
                        }
                        if (lista.size() != 0) {
                            for (int x = 0; x < lista.size(); x = x + 2) {
                                if (lista.get(x).toString().equals(request.getParameter("idprovincia").toString())) {
                                    provincia = lista.get(x + 1).toString();
                                }
                            }
                        }
                    }
                    if (request.getParameter("idcanton") != null) {
                        idcanton = Integer.parseInt(request.getParameter("idcanton").toString());
                        if (idcanton == -1) {
                            error = true;
                            errorString = "Por favor seleccione un Canton";
                        }
                        ArrayList lista = null;
                        if (session.getAttribute("cantones") != null) {
                            lista = (ArrayList) session.getAttribute("cantones");
                        }
                        if (lista.size() != 0) {
                            for (int x = 0; x < lista.size(); x = x + 3) {
                                if (lista.get(x).toString().equals(request.getParameter("idcanton").toString())) {
                                    canton = lista.get(x + 1).toString();
                                }
                            }
                        }
                    }
                    if (request.getParameter("idparroquia") != null) {
                        idparroquia = Integer.parseInt(request.getParameter("idparroquia").toString());
                        if (idparroquia == -1) {
                            error = true;
                            errorString = "Por favor seleecione una Parroquia";
                        }
                        ArrayList lista = null;
                        if (session.getAttribute("parroquias") != null) {
                            lista = (ArrayList) session.getAttribute("parroquias");
                        }
                        if (lista.size() != 0) {
                            for (int x = 0; x < lista.size(); x = x + 3) {
                                if (lista.get(x).toString().equals(request.getParameter("idparroquia").toString())) {
                                    parroquia = lista.get(x + 1).toString();
                                }
                            }
                        }
                    }
                    if (request.getParameter("idrecinto") != null) {
                        idrecinto = Integer.parseInt(request.getParameter("idrecinto").toString());
                        if (idrecinto == -1) {
                            error = true;
                            errorString = "Por favor seleecione un Recinto";
                        }
                        ArrayList lista = null;
                        if (session.getAttribute("recintos") != null) {
                            lista = (ArrayList) session.getAttribute("recintos");
                        }
                        if (lista.size() != 0) {
                            for (int x = 0; x < lista.size(); x = x + 3) {
                                if (lista.get(x).toString().equals(request.getParameter("idrecinto").toString())) {
                                    recinto = lista.get(x + 1).toString();
                                }
                            }
                        }
                    }
                    if (!error) {
                        //Veo si ya se ha ingresado el acta de esa dignidad
                        if (actaDB.ExisteJuntaDignidad(idjunta, iddignidad)) {
                            response.sendRedirect("dig_actas_dignidad_junta_ver.jsp?iddignidad=" + iddignidad + "&idjunta=" + idjunta);
                            return;
                        } else {
                            response.sendRedirect("dig_actas_dignidad_junta_digitar.jsp?iddignidad=" + iddignidad + "&idprovincia=" + idprovincia + "&idcanton=" + idcanton
                                    + "&idparroquia=" + idparroquia + "&idzona=" + idzona + "&idjunta=" + idjunta + "&ver=dig&dignidad=" + dignidad + "&provincia=" + provincia
                                    + "&canton=" + canton + "&parroquia=" + parroquia + "&zona=" + zona + "&junta=" + junta);
                            return;
                        }
                    } else {
            %>
            Error: <%= errorString%>
            <%
                    }
                }
            %>

            <!-- Inicio de Zona de Busqueda -->
            <div class="container row"> 
                <div class="col-lg-7 col-sm-12">
                    <div class="card mt-5 mb-3 ms-3">
                        <div class="card-header">
                            <h6>Resultados</h6>
                            <p class="card-text">Fecha y hora de reporte: <%= sdf.format(Calendar.getInstance().getTime())%></p>
                        </div>
                        <div class="card-body">
                            <div class="row">


                                <div class="row align-items-center">
                                    <div class="col-lg-12 col-sm-12">
                                        <div class="form-floating mt-3">
                                            <select class="form-select" name="iddignidad" id="iddignidad">                                                  
                                            </select>
                                            <label for="iddignidad">Dignidad</label>
                                        </div>
                                    </div>
                                </div>

                                <div class="row align-items-center">
                                    <div class="col-lg-8 col-sm-10">
                                        <div class="form-floating mt-3">
                                            <select class="form-select" name="idprovincia" id="idprovincia">
                                            </select>
                                            <label for="idprovincia">Provincia</label>
                                        </div>
                                    </div>

                                    <div class="col-lg-2 col-sm-2">                                        
                                        <button type="submit" title="Actualizar reporte a nivel provincial" name="nivel_territorio_prov_jsp" class="btn btn-dark">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-bar-chart" viewBox="0 0 16 16">
                                            <path d="M4 11H2v3h2v-3zm5-4H7v7h2V7zm5-5v12h-2V2h2zm-2-1a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h2a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1h-2zM6 7a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v7a1 1 0 0 1-1 1H7a1 1 0 0 1-1-1V7zm-5 4a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v3a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1v-3z"/>
                                            </svg>
                                        </button>

                                    </div>
                                    <div class="col-lg-2 col-sm-2">                                        
                                        <button type="submit" title="Descargar datos en Excel a nivel provincial" name="nivel_territorio_prov_xls" class="btn btn-success">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-file-earmark-spreadsheet" viewBox="0 0 16 16">
                                            <path d="M14 14V4.5L9.5 0H4a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h8a2 2 0 0 0 2-2zM9.5 3A1.5 1.5 0 0 0 11 4.5h2V9H3V2a1 1 0 0 1 1-1h5.5v2zM3 12v-2h2v2H3zm0 1h2v2H4a1 1 0 0 1-1-1v-1zm3 2v-2h3v2H6zm4 0v-2h3v1a1 1 0 0 1-1 1h-2zm3-3h-3v-2h3v2zm-7 0v-2h3v2H6z"/>
                                            </svg>
                                        </button>

                                    </div>

                                </div>

                                <div class="row align-items-center">
                                    <div class="col-lg-8 col-sm-10">
                                        <div class="form-floating mt-3">
                                            <select class="form-select"  name="idcanton" id="idcanton">
                                            </select>
                                            <label for="idcanton">Cantón</label>
                                        </div>
                                    </div>


                                    <div class="col-lg-2 col-sm-2">                                        
                                        <button type="submit" title="Actualizar reporte a nivel cantonal" name="nivel_territorio_cant_jsp" class="btn btn-dark">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-bar-chart" viewBox="0 0 16 16">
                                            <path d="M4 11H2v3h2v-3zm5-4H7v7h2V7zm5-5v12h-2V2h2zm-2-1a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h2a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1h-2zM6 7a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v7a1 1 0 0 1-1 1H7a1 1 0 0 1-1-1V7zm-5 4a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v3a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1v-3z"/>
                                            </svg>
                                        </button>
                                    </div>
                                    <div class="col-lg-2 col-sm-2">                                        
                                        <button type="submit" title="Descargar datos en Excel a nivel cantonal" name="nivel_territorio_cant_xls" class="btn btn-success">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-file-earmark-spreadsheet" viewBox="0 0 16 16">
                                            <path d="M14 14V4.5L9.5 0H4a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h8a2 2 0 0 0 2-2zM9.5 3A1.5 1.5 0 0 0 11 4.5h2V9H3V2a1 1 0 0 1 1-1h5.5v2zM3 12v-2h2v2H3zm0 1h2v2H4a1 1 0 0 1-1-1v-1zm3 2v-2h3v2H6zm4 0v-2h3v1a1 1 0 0 1-1 1h-2zm3-3h-3v-2h3v2zm-7 0v-2h3v2H6z"/>
                                            </svg>
                                        </button>
                                    </div>

                                </div>

                                <div class="row align-items-center">
                                    <div class="col-lg-8 col-sm-6">
                                        <div class="form-floating mt-3">
                                            <select class="form-select" name="idparroquia" id="idparroquia">
                                            </select>
                                            <label for="idparroquia">Parroquia</label>
                                        </div>
                                    </div>


                                    <div class="col-lg-2 col-sm-3">                                        
                                        <button type="submit" title="Actualizar reporte a nivel parroquial" name="nivel_territorio_parr_jsp" class="btn btn-dark">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-bar-chart" viewBox="0 0 16 16">
                                            <path d="M4 11H2v3h2v-3zm5-4H7v7h2V7zm5-5v12h-2V2h2zm-2-1a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h2a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1h-2zM6 7a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v7a1 1 0 0 1-1 1H7a1 1 0 0 1-1-1V7zm-5 4a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v3a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1v-3z"/>
                                            </svg>
                                        </button>
                                    </div>
                                    <div class="col-lg-2 col-sm-3">                                        
                                        <button type="submit" title="Descargar datos en Excel a nivel parroquial" name="nivel_territorio_parr_xls" class="btn btn-success">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-file-earmark-spreadsheet" viewBox="0 0 16 16">
                                            <path d="M14 14V4.5L9.5 0H4a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h8a2 2 0 0 0 2-2zM9.5 3A1.5 1.5 0 0 0 11 4.5h2V9H3V2a1 1 0 0 1 1-1h5.5v2zM3 12v-2h2v2H3zm0 1h2v2H4a1 1 0 0 1-1-1v-1zm3 2v-2h3v2H6zm4 0v-2h3v1a1 1 0 0 1-1 1h-2zm3-3h-3v-2h3v2zm-7 0v-2h3v2H6z"/>
                                            </svg>
                                        </button>
                                    </div>

                                </div>

                                <div class="row align-items-center">
                                    <div class="col-lg-8 col-sm-10">
                                        <div class="form-floating mt-3">
                                            <select class="form-select" name="idrecinto" id="idrecinto">
                                            </select>
                                            <label for="idrecinto">Recinto</label>
                                        </div>
                                    </div>


                                    <div class="col-lg-2 col-sm-2">                                        
                                        <button type="submit" title="Actualizar reporte a nivel recinto" name="nivel_territorio_recinto_jsp" class="btn btn-dark">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-bar-chart" viewBox="0 0 16 16">
                                            <path d="M4 11H2v3h2v-3zm5-4H7v7h2V7zm5-5v12h-2V2h2zm-2-1a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h2a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1h-2zM6 7a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v7a1 1 0 0 1-1 1H7a1 1 0 0 1-1-1V7zm-5 4a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v3a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1v-3z"/>
                                            </svg>
                                        </button>
                                    </div>
                                    <div class="col-lg-2 col-sm-2">                                        
                                        <button type="submit" title="Descargar datos en Excel a nivel recinto" name="nivel_territorio_recinto_xls" class="btn btn-success">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-file-earmark-spreadsheet" viewBox="0 0 16 16">
                                            <path d="M14 14V4.5L9.5 0H4a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h8a2 2 0 0 0 2-2zM9.5 3A1.5 1.5 0 0 0 11 4.5h2V9H3V2a1 1 0 0 1 1-1h5.5v2zM3 12v-2h2v2H3zm0 1h2v2H4a1 1 0 0 1-1-1v-1zm3 2v-2h3v2H6zm4 0v-2h3v1a1 1 0 0 1-1 1h-2zm3-3h-3v-2h3v2zm-7 0v-2h3v2H6z"/>
                                            </svg>
                                        </button>
                                    </div>

                                </div>
                            </div>
                        </div>
                        <div class="card-footer text-muted">
                            Por favor seleccione el ícono de gráfico para actualizar los resultados y el de Excel para descargar los datos.
                        </div>
                    </div>
                </div>
                <div class="col-lg-5 col-sm-12">
                    <div class="rep_pie">
                        <div id="pie-porcentaje-ingreso" style="min-width: 310px; height: 350px; max-width: 600px; margin: 0 auto"></div>
                    </div>
                </div>
            </div>
            <!-- Fin de Zona de Busqueda -->                 


            <div class="container">
                <div class="row d-flex flex-column mb-3">
                    <div class="col-lg-12 col-sm-12">
                        <div class="card">
                            <div class="card-header">
                                <div id="tabs">
                                    <ul class="nav nav-tabs card-header-tabs">
                                        <% if (request.getParameter("tipo_eleccion").equals("pluripersonal")) { %>
                                        <li class="nav-item"><a class="nav-link active" href="#tabs-2">Listas</a></li>
                                            <% }%>
                                        <li class="nav-item"><a class="nav-link active" href="#tabs-1">Candidatos Bar</a></li>

                                    </ul>
                                </div>
                            </div>

                            <% if (request.getParameter("tipo_eleccion").equals("pluripersonal")) {%>
                            <div id="tabs-2">
                                <div id="container" style="min-width: 310px; height: 400px; margin: 0 auto">
                                    <script>
                                        // Create the chart
                                        Highcharts.chart('container', {
                                        chart: {
                                        type: 'column'
                                        },
                                                title: {
                                                text: 'RESULTADOS <%= request.getParameter("dignidad_string")%> 2020'
                                                },
                                                subtitle: {
                                                text: 'De clic en la lista para ver el detalle de las votaciones por candidatos'
                                                },
                                                xAxis: {
                                                type: 'category',
                                                },
                                                yAxis: {
                                                title: {
                                                text: 'Total de votos'
                                                }
                                                },
                                                legend: {
                                                enabled: false
                                                },
                                                plotOptions: {
                                                column: {
                                                pointPadding: 0.2,
                                                        borderWidth: 0,
                                                        dataLabels: {
                                                        enabled: true,
                                                                useHTML: true,
                                                                formatter: function () {
                                                                return '<center><img style="width: 20px; height: 20px;" src="' + this.point.myImage + '"/><br>' + this.point.y + ' %' + ' - ' + this.point.val + ' votos ' + '</center>';
                                                                }
                                                        }
                                                }
                                                },
                                                tooltip: {
                                                enabled: true,
                                                        positioner: function () {
                                                        return { header:true};
                                                        },
                                                        headerFormat: '<span style="font-size:11px">{series.name}</span><br>',
                                                        pointFormat: '<span style="color:{point.color}">{point.name}</span>: <b>{point.y:.2f}%</b> of total<br/>'
                                                },
                                                "series": [
                                                {
                                                "name": "Total de Votos",
                                                        "colorByPoint": true,
                                                        "data": [
                                        <% ArrayList<ClassResultadosBasico> lista_chart_lista = (ArrayList<ClassResultadosBasico>) session.getAttribute("lista_chart_lista");
                                            float total_votos = Float.parseFloat(request.getParameter("total_votos"));
                                            float por = 0;
                                            for (ClassResultadosBasico c : lista_chart_lista) {
                                                por = (c.getTotal_votos() / total_votos) * 100;%>
                                                        {
                                                        "name": "<%= c.getSiglas() + " " + c.getListas()%>",
                                                                "y": <%= Math.floor(por * 100) / 100d%>,
                                                                "val": <%= c.getTotal_votos()%>,
                                                                "myImage": "images/logos/<%= c.getIdorganizacion()%>.jpg",
                                                                "drilldown": "<%= c.getSiglas() + " " + c.getListas()%>",
                                                                "color": "<%= c.getColor()%>"
                                                        },<% } %>
                                                        ]
                                                }
                                                ],
                                                "drilldown": {
                                                "series": [
                                        <%ArrayList<ClassResultadosBasico> chart_lista_res_cand = (ArrayList<ClassResultadosBasico>) session.getAttribute("lista_chart_basic");
                                            for (ClassResultadosBasico c : lista_chart_lista) {%>
                                                {
                                                "name": "<%= c.getSiglas() + " " + c.getListas()%>",
                                                        "id": "<%= c.getSiglas() + " " + c.getListas()%>",
                                                        "data": [
                                        <%
                                            for (ClassResultadosBasico can : chart_lista_res_cand) {
                                                if (can.getListas().equals(c.getListas())) {
                                                    double por2 = 0;
                                                    if (c.getTotal_votos() > 0) {
                                                        por2 = can.getTotal_votos() * 100.00 / c.getTotal_votos();
                                                    }
                                        %>
                                                        {
                                                        name: "<%= can.getNombre()%>",
                                                                y: <%= Math.floor(por2 * 100) / 100d%>,
                                                                val: <%= can.getTotal_votos()%>,
                                                                myImage: "images/candidatos/1.png"
                                                        },
                                        <% }
                                            }%>
                                                        ]
                                                },
                                        <% } %>
                                                ]
                                                }
                                        });
                                    </script>
                                </div>
                            </div>
                            <% }%>

                            <div id="tabs-1">
                                <div >
                                    <div id="bar-chart-unipersonal">
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>

            <!-- Inicio de PIE  -->

            <div class="container">
                <div class="row d-flex flex-column mb-3">
                    <div class="col-lg-12 col-sm-12">
                        <div class="card">
                            <div class="card-header">
                                <div id="tabs">
                                    <ul class="nav nav-tabs card-header-tabs">


                                        <li class="nav-item"><a class="nav-link active" href="#tabs-x">Candidatos Pie</a></li>

                                    </ul>
                                </div>
                            </div>

                            <div id="tabs-x">
                                <div>
                                    <div id="bar-chart-unipersonal2">
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>

            <!--  Final de PIE  -->

            <%
                if (request.getParameter("men") != null) {
            %>
            <%= request.getParameter("men").toString()%>
            <%
                }
            %>

            <script>
                Highcharts.chart('pie-porcentaje-ingreso', {
                chart: {
                plotBackgroundColor: null,
                        plotBorderWidth: null,
                        plotShadow: false,
                        type: 'pie'
                },
                        title: {
                        text: 'Avance de Actas<br> <b>2023</b>'
                        },
                        tooltip: {
                        pointFormat: '{series.name}: <b>{point.percentage:.1f}%-{point.val}</b>'
                        },
                        accessibility: {
                        point: {
                        valueSuffix: '%'
                        }
                        },
                        plotOptions: {
                        pie: {
                        allowPointSelect: true,
                                cursor: 'pointer',
                                dataLabels: {
                                enabled: true,
                                        format: '<b>{point.name}</b>: {point.percentage:.1f} %',
                                        connectorColor: 'silver'
                                }
                        }
                        },
                        series: [{
                        name: 'Actas',
                                data: [
                                {
                                name: 'Ingresadas-<%= request.getParameter("total_actas_ingresadas")%>',
                                        y: <%= request.getParameter("total_actas_ingresadas")%> * 100 /<%= request.getParameter("total_actas")%>,
                                        val: <%= request.getParameter("total_actas_ingresadas")%>
                                },
                                {
                                name: 'Restantes-<%= request.getParameter("total_actas_faltantes")%>',
                                        y: <%= request.getParameter("total_actas_faltantes")%> * 100 /<%= request.getParameter("total_actas")%>,
                                        val: <%= request.getParameter("total_actas_faltantes")%>
                                }
                                ]
                        }]
                });
            </script>
            <script>
                Highcharts.chart('bar-chart-unipersonal', {
                chart: {
                type: 'column'
                },
                        title: {
                        align: 'left',
                                text: 'RESULTADOS <%= request.getParameter("dignidad_string")%> 2023',
                        },
                        subtitle: {
                        align: 'left',
                                text: 'Total de votos Unipersonales'
                        },
                        tooltip: {
                        pointFormat: '<span style="color:{point.color}">{series.name}</span>: <b>{point.y:.2f}% - {point.val}</b> votos<br/>'
                        },
                        xAxis: {
                        categories: [
                                'Candidatos'
                        ],
                                //crosshair: true
                        },
                        yAxis: {
                        min: 0,
                                title: {
                                text: 'Total de votos(%)'
                                }
                        },
                        plotOptions: {
                        column: {
                        pointPadding: 0.2,
                                borderWidth: 0
                        },
                                series: {
                                borderWidth: 0,
                                        dataLabels: {
                                        enabled: true,
                                                format: '{point.siglas}:' + '{point.y:.1f}%' + ' - ' + ' {point.val}'
                                        }
                                }
                        },
                        series: [
                <% ArrayList<ClassResultadosBasico> chart_lista_res_basic = (ArrayList<ClassResultadosBasico>) session.getAttribute("lista_chart_basic");
                    for (ClassResultadosBasico c : chart_lista_res_basic) {%>
                        {
                        name: '<%= c.getNombre()%> - <%= c.getSiglas()%>',
                                            color: '<%= c.getColor()%>',
                                            data: [{y:<%= c.getTotal_votos()%> * 100 / <%= request.getParameter("total_votos")%>,
                                            val:<%= c.getTotal_votos()%>, siglas:'<%= c.getSiglas()%>'}]
                                    }, <% }%>
                                    ]
                            });
            </script>

            <script>
                Highcharts.setOptions({
                colors: Highcharts.map(Highcharts.getOptions().colors, function (color) {
                return {
                radialGradient: {
                cx: 0.5,
                        cy: 0.3,
                        r: 0.7
                },
                        stops: [
                        [0, color],
                        [1, Highcharts.color(color).brighten( - 0.3).get('rgb')] // darken
                        ]
                };
                })
                });
                // Build the chart
                Highcharts.chart('bar-chart-unipersonal2', {
                chart: {
                plotBackgroundColor: null,
                        plotBorderWidth: null,
                        plotShadow: false,
                        type: 'pie'
                },
                        title: {
                        text: 'RESULTADOS <%= request.getParameter("dignidad_string")%> 2023',
                        },
                        tooltip: {
                        pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
                        },
                        accessibility: {
                        point: {
                        valueSuffix: '%'
                        }
                        },
                        plotOptions: {
                        pie: {
                        allowPointSelect: true,
                                cursor: 'pointer',
                                dataLabels: {
                                enabled: true,
                                        format: '<b>{point.name}</b>: {point.percentage:.1f} %',
                                        connectorColor: 'silver'
                                }
                        }
                        },
                        series: [{
                        name: 'Votos (%): ',
                                data: [
                <% ArrayList<ClassResultadosBasico> chart_lista_res_basic2 = (ArrayList<ClassResultadosBasico>) session.getAttribute("lista_chart_basic");
                    for (ClassResultadosBasico c : chart_lista_res_basic2) {%>
                                {
                                name: '<%= c.getNombre()%> - <%= c.getSiglas()%>',
                                                            y:  <%= c.getTotal_votos()%> * 100 / <%= request.getParameter("total_votos")%>,
                                                            val: <%= c.getTotal_votos()%>,
                                                            color: '<%= c.getColor()%>'
                                                    },
                <% } %>
                                                    ]
                                            }]
                                    });

            </script>
            <div class="container">
                <div class="row">
                    <div class="col-lg-12 col-sm-12">
                        <table class="table table-bordered mt-3">
                            <thead class="table-success">
                                <tr>
                                    <th>Lista</th>
                                    <th>Candidato</th>
                                    <th>Total</th>
                                    <th>%</th>
                                </tr>
                            </thead>

                            <%
                                float total_votos = Float.parseFloat(request.getParameter("total_votos"));
                                float por = 0;
                                for (ClassResultadosBasico c : chart_lista_res_basic) {
                                    por = (c.getTotal_votos() / total_votos) * 100;
                            %>
                            <tr>
                                <td><%= c.getListas()%></td>      
                                <td><%= c.getNombre()%></td>      
                                <td><%= c.getTotal_votos()%></td>    
                                <td><%= Math.floor(por * 100) / 100d%> %</td> 
                            </tr>
                            <%}%>
                        </table>
                    </div>
                </div>
            </div>
        </form>
    </body>
</html>


