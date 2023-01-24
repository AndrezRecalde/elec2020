<%-- 
    Document   : act_recepcion
    Created on : 29/01/2013, 05:21:08 PM
    Author     : root
--%>

<%@page import="admin.Cacta_images"%>
<%@page import="admin.Cacta_imagesDB"%>
<%@page import="eleccion.juntaDB"%>
<%@page import="eleccion.junta"%>
<%@page import="eleccion.acta_detalleDB"%>
<%@page import="eleccion.acta_detalle"%>
<%@page import="java.util.ArrayList"%>
<%@page import="eleccion.candidatoDB"%>
<%@page import="eleccion.candidato"%>
<%@page import="eleccion.actaDB"%>
<%@page import="eleccion.acta"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Recepcion de Actas</title>

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">

        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"
                integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3"
        crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js"
                integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V"
        crossorigin="anonymous"></script>

        <script type="text/javascript" src="script/numeros3.js"></script>
        <!-- <link rel="stylesheet" href="styles/basic.css"> -->

        <style type="text/css">
            .img-avatar {
                border-radius: 50%;
            }
        </style>


        <link rel="stylesheet" href="styles/listado.css">

        <link rel="stylesheet" href="styles/modal_acta.css">

        <script type="text/javascript" src="script/modal.js"></script>


        <script type="text/javascript">
            function activar_modificar() {
                document.getElementById("aceptar").disabled = false;
            }
        </script>
    </head>
    <body>
        <div id="myModal" class="modal">
            <div id="close" class="close">&times;</div>
            <img class="modal-content" id="img01">
            <div id="caption"></div>
        </div>


        <form name="form1" id="form1" action="calificador">
            <%
                acta AC = new acta();
                actaDB ACdb = new actaDB();
                eleccion.junta JU = new junta();
                eleccion.juntaDB JUDb = new juntaDB();
                acta_detalle ACDet = new acta_detalle();
                acta_detalleDB ACDetdb = new acta_detalleDB();
                int iddignidad = 0, idprovincia = 0, idcanton = 0, idparroquia = 0, idzona = 0, idjunta = 0;
                String dignidad = "", provincia = "", canton = "", parroquia = "", zona = "", junta = "";
                iddignidad = Integer.parseInt(request.getParameter("iddignidad").toString());
                idjunta = Integer.parseInt(request.getParameter("idjunta").toString());
                AC = ACdb.CargarJuntaDignidad(idjunta, iddignidad);
                junta = AC.getJunta_nombre();
                dignidad = AC.getDignidad_nombre();
                idprovincia = AC.getCod_provincia();
                provincia = AC.getProvincia_nombre();
                idcanton = AC.getCod_canton();
                canton = AC.getCanton_nombre();
                idparroquia = AC.getCod_parroquia();
                parroquia = AC.getParroquia_nombre();
                idzona = AC.getCod_zona();
                zona = AC.getZona_nombre();
                JU = JUDb.CargarJuntaxId(idjunta);

                //Cargo las actas
                Cacta_imagesDB acImDB = new Cacta_imagesDB();
                ArrayList<Cacta_images> lista_imagenes = (ArrayList<Cacta_images>) session.getAttribute("lista_acta_images");
                lista_imagenes = acImDB.Cargar_Activas(idjunta, iddignidad);

            %>

            <div class="container mt-3">
                <div class="clearfix text-center">
                    <input type="hidden" name="idusuario" value="<%= session.getAttribute("idusuario").toString()%>">
                    <h4>ACTA DE ESCRUTINIO</h4>    
                    <h4><%= dignidad%></h4>
                    <div class="alert alert-warning" role="alert">
                        Esta  <strong>acta</strong> ha sido <strong>previamente ingredada con éxito!</strong>
                    </div>
                </div>
            </div>

            <div class="row d-flex justify-content-center">
                <div class="col-lg-10 col-sm-12">
                    <div class="card bg-light p-4">
                        <div class="card-header bg-light p-0 pb-3">
                            <h5 class="mb-0"><%= JU.getRecinto_nombre()%> -  <%= junta%></h5>
                        </div>
                        <div class="card-body">

                            <div class="row">
                                <div class="col-4">
                                    <div class="form-floating mb-3">
                                        <input id="acta_no" name="txt_id_acta" value="<%= AC.getIdacta()%>" type="text" readonly class="form-control-plaintext">
                                        <label for="acta_no">Acta Nº:</label>
                                    </div>
                                </div>

                                <div class="col-4">
                                    <div class="form-floating mb-3">
                                        <input id="txt_zona" name="txt_zona" value="<%= zona%>" type="text" readonly class="form-control-plaintext">
                                        <label for="txt_zona">Zona:</label>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-4">
                                    <div class="form-floating mb-3">
                                        <input type="hidden" name="iddignidad" value="<%= iddignidad%>">
                                        <input type="hidden" name="dignidad" value="<%= dignidad%>">
                                        <input type="hidden" name="idprovincia" value="<%= idprovincia%>">
                                        <input type="hidden" name="provincia" value="<%= provincia%>">
                                        <input type="hidden" name="idcanton" value="<%= idcanton%>">
                                        <input type="hidden" name="canton" value="<%= canton%>">
                                        <input type="hidden" name="idparroquia" value="<%= idparroquia%>">
                                        <input type="hidden" name="parroquia" value="<%= parroquia%>">
                                        <input type="hidden" name="idzona" value="<%= idzona%>">
                                        <input type="hidden" name="zona" value="<%= zona%>">
                                        <input type="hidden" name="idjunta" value="<%= idjunta%>">
                                        <input type="hidden" name="junta" value="<%= junta%>">
                                        <input type="hidden" name="idacta" value="<%= AC.getIdacta()%>">
                                        <input id="txt_provincia" name="txt_provincia" value="<%= provincia%>" type="text" readonly class="form-control-plaintext">
                                        <label for="txt_provincia">Provincia</label>
                                    </div>
                                </div>

                                <div class="col-4">

                                    <div class="form-floating mb-3">
                                        <input type="hidden" name="txt_circunsc" id="txt_circunsc" class="form-control" value="">
                                        <input id="txt_canton" name="txt_canton" value="<%= canton%>" type="text" readonly class="form-control-plaintext">
                                        <label for="txt_canton">Cantón</label>
                                    </div>
                                </div>

                                <div class="col-4">

                                    <div class="form-floating mb-3">
                                        <input id="txt_parroquia" name="txt_parroquia" value="<%= parroquia%>" type="text" readonly class="form-control-plaintext">
                                        <label for="txt_parroquia">Parroquia</label>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>

            <div class="row d-flex justify-content-center mt-3">
                <div class="col-lg-10 col-sm-12">
                    <div class="card bg-light p-4">
                        <div class="card-header bg-light p-0 pb-3">
                            <h5 class="mb-0">Puedes modificar los campos del acta</h5>
                        </div>
                        <div class="card-body">

                            <div class="form-floating mb-3">
                                <input id="txt_cne_cod_acta" name="txt_cne_cod_acta" value="<%= AC.getCne_cod_acta()%>" type="number" autocomplete="off" readonly class="form-control" placeholder="No Obligatorio">
                                <label for="txt_cne_cod_acta">Código CNE de Acta</label>
                            </div>

                            <div class="form-floating mb-3">
                                <input type="number" min="0" autocomplete="off" class="form-control" max="350" name="txt_total_votos" id="txt_total_votos" value="<%= AC.getNum_validos()%>" onchange="activar_modificar()" placeholder="Ingrese un Número">
                                <label for="txt_total_votos">Total Firmas y Huellas</label>
                            </div>

                            <div class="form-floating mb-3">
                                <input type="number" min="0" autocomplete="off" class="form-control" max="350" name="txt_votos_blanco" id="txt_votos_blanco" value="<%= AC.getNum_blancos()%>" onchange="activar_modificar()" placeholder="Ingrese un Número">
                                <label for="txt_votos_blanco">Votos en Blanco</label>
                            </div>

                            <div class="form-floating mb-3">
                                <input type="hidden" name="txt_no_votaron" id="txt_no_votaron" value="0"/>
                                <input type="number" min="0" max="350" autocomplete="off" class="form-control" name="txt_votos_nulos" id="txt_votos_nulos" value="<%= AC.getNum_nulos()%>" onchange="activar_modificar()" placeholder="Ingrese un Número">                                <label for="txt_votos_nulos">Votos Nulos</label>
                            </div>
                        </div>
                    </div>
                </div>
            </div>


            <div class="row d-flex justify-content-center mt-3">
                <div class="col-lg-6 col-sm-12">
                    <div class="card bg-light p-4 mt-2">
                        <div class="card-header bg-light border-bottom p-3 p-sm-4">
                            <h5 class="card-title mb-0">Asignar Votos</h5>
                        </div>
                        <div class="card-body">
                            <%
                                ArrayList<acta_detalle> lista = null;
                                //Estado 1 Pendientes
                                lista = ACDetdb.CargarActasDetalleIdActa(AC.getIdacta());

                                //Busco el factor num_canidato en lista
                                int num_cand_elec = 0;
                                breakLoop:
                                for (acta_detalle p : lista) {
                                    for (acta_detalle q : lista) {
                                        if (p.getFr_id_organizacion() == q.getFr_id_organizacion()) {
                                            num_cand_elec++;
                                        } else {
                                            break breakLoop;
                                        }
                                    }
                                    break breakLoop;
                                }

                                //Excepción por CPCS numero de candidatos por lista
                                if (iddignidad == 6 || iddignidad == 7 || iddignidad == 8) {
                                    num_cand_elec = 1;
                                }

                                int t = 0;
                                for (acta_detalle p : lista) {
                                    t++;
                            %>
                            <div class="mt-5">
                                <div class="row g-2 g-md-4">

                                    <div class="col-3">
                                        <div class="image has-shadow"><img src="images/logos/<%= p.getFr_id_organizacion()%>.jpg" style="width:80px" alt="img" class="img-fluid img-avatar"></div>

                                    </div>
                                    <div class="col-5">
                                        <h5 class="card-title"><%= p.getCandidato_nombre()%></h5>
                                        <h6 class="card-subtitle mb-2 text-muted"><%= p.getOrganizacion_nombre()%> Lista: <%= p.getLista_nombre()%></h6>
                                    </div>

                                    <div class="col-1"></div>


                                    <div class="col-3 d-flex justify-content-end">
                                        <input class="form-control" autocomplete="off" type="number" min="0" max="350" id="<%= t%>" name="<%= p.getFr_id_candidato()%>" value="<%= p.getNum_votos()%>" onchange="activar_modificar()">
                                    </div>
                                </div>
                                <hr />
                            </div>
                            <%
                                }
                            %>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row d-flex justify-content-center mt-3">
                <div class="col-lg-6 col-sm-12">
                    <div class="card bg-light p-4 mt-2">
                        <div class="col-lg-12 col-md-6">
                            <label for="txt_es_legible" class="list-group-item d-flex gap-3">
                                <input name="txt_es_legible" id="txt_es_legible" class="form-check-input flex-shrink-0" type="checkbox" style="font-size: 1.375em;" <% if (AC.isLegible()) { %> checked<% }%> />
                                <span class="pt-1 form-checked-content"><strong>Si el acta no es legible, quite el check.</strong>
                                </span>
                            </label>    
                        </div>

                        <div class="col-lg-12 col-md-6">
                            <label for="txt_es_cuadrada" class="list-group-item d-flex gap-3">
                                <input name="txt_es_cuadrada" id="txt_es_cuadrada" class="form-check-input flex-shrink-0" type="checkbox" style="font-size: 1.375em;" <% if (AC.isCuadrada()) { %> checked<% }%> />
                                <span class="pt-1 form-checked-content"><strong>Si los valores del acta no coinciden, quite el check.</strong></span>
                            </label>    
                        </div>

                        <% if (request.getParameter("ver") != null) {
                                if (!request.getParameter("ver").equals("ver")) {%>
                        <div class="row text-center form-group mt-3">
                            <div class="col-10">
                                <input class="btn btn-dark" type="button" onclick="verifica_acta(<%= t%>,<%= num_cand_elec%>);" id="aceptar" name="Aceptar" value="Modificar Acta" disabled/>
                                <input class="btn btn-danger" type="button" id="regresar" onclick="javascript:history.back(1)" name="regresar" value="Regresar"/></td>
                            </div>
                        </div>
                        <% }
                        } else {%>
                        <div class="row text-center form-group mt-3">
                            <div class="col-10">
                                <input class="btn btn-dark" type="button" onclick="verifica_acta(<%= t%>,<%= num_cand_elec%>);" id="aceptar" name="Aceptar" value="Modificar Acta" disabled/>
                                <input class="btn btn-danger" type="button" id="aceptar" onclick="window.location = 'dig_actas_dignidad.jsp'" name="regresar" value="Regresar"/></td>
                            </div>
                        </div>
                        <% }%>
                        <div class="row d-flex justify-content-center mt-3 mb-3">
                            <div class="col-8">
                                <div class="alert alert-primary" role="alert">
                                    Esta <strong>acta</strong> fue digitada por:
                                    <strong><%= AC.getUsuario_nombre()%></strong>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </form>
                                
                                
        <!-- <div class="container">
            <h1>Cargar imagen del acta</h1>
            <form method="POST" enctype="multipart/form-data" action="<%= request.getContextPath()%>/UploadFile">
                <% session.setAttribute("id_junta_subir", idjunta);
                    session.setAttribute("id_dignidad_subir", iddignidad);
                    session.setAttribute("subir_desde", "ver");%>
                Elija la imagen y luego de clic en <b>Cargar</b>. <input required type="file" name="fichero" style="cursor:pointer;" accept="image/jpeg">
                <input class="btn bg-green text-center" type="submit" value="Cargar">
            </form>
        </div> -->
                
        <!-- <div class="container text-center" >
            <a href="dig_actas_dignidad_junta_ver.jsp?iddignidad=<%= iddignidad%>&idjunta=<%= idjunta%>"><img style="width: 90px;margin-bottom: 5%;" src="images/refresh.png"></a>
        </div> -->
        
        
        <%-- for (Cacta_images image : lista_imagenes) {%>            
        <div class="centrar_imagen">
            <div class="eliminar_imagen">
                <a href="admin/acta_images_actualizar_resultado.jsp?txt_idacta_images=<%= image.getidacta_images()%>&iddignidad=<%= iddignidad%>&idjunta=<%= idjunta%>"><img style="width: 20%;" src="images/delete.png"></a>
            </div>
            <div class="la_imagen">
                <img class="myImg" id="img_<%= image.getidacta_images()%>" onclick="show_modal('img_<%= image.getidacta_images()%>')" src="images/actas/<%= image.getidacta_images()%>.jpg" alt="Acta">
            </div>
        </div>
        <% }--%>
    </body>
</html>
