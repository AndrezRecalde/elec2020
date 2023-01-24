<%-- 
    Document   : act_recepcion
    Created on : 29/01/2013, 05:21:08 PM
    Author     : root
--%>

<%@page import="admin.Cacta_images"%>
<%@page import="admin.Cacta_imagesDB"%>
<%@page import="com.sun.org.apache.bcel.internal.generic.RET"%>
<%@page import="eleccion.parroquiasDB"%>
<%@page import="eleccion.junta"%>
<%@page import="eleccion.juntaDB"%>
<%@page import="eleccion.cantonesDB"%>
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
        
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/11.1.9/sweetalert2.min.css" integrity="sha512-cyIcYOviYhF0bHIhzXWJQ/7xnaBuIIOecYoPZBgJHQKFPo+TOBA+BY1EnTpmM8yKDU4ZdI3UGccNGCEUdfbBqw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/11.1.9/sweetalert2.all.min.js" integrity="sha512-IZ95TbsPTDl3eT5GwqTJH/14xZ2feLEGJRbII6bRKtE/HC6x3N4cHye7yyikadgAsuiddCY2+6gMntpVHL1gHw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

        <script type="text/javascript" src="script/numeros4.js"></script>
        
        <!-- <link rel="stylesheet" href="styles/basic.css"> -->
        
        <style type="text/css">
            .img-avatar {
                border-radius: 50%;
            }
        </style>
        
        <link rel="stylesheet" href="styles/listado.css">

        <!-- <link rel="stylesheet" href="styles/modal_acta.css"> -->

        <script type="text/javascript" src="script/modal.js"></script>


    </head>
    <body>

        <div id="myModal" class="modal">
            <span class="close">&times;</span>
            <img style="transform: rotate(90deg);" class="modal-content" id="img01">
            <div id="caption"></div>
        </div>
        
        
        <form name="form1" id="form1" action="calificador">
            <%
                acta AC = new acta();
                actaDB ACdb = new actaDB();
                candidato CAND = new candidato();
                eleccion.junta JU = new junta();
                eleccion.juntaDB JUDb = new juntaDB();
                candidatoDB CANDdb = new candidatoDB();
                int iddignidad = 0, idprovincia = 0, idcanton = 0, idparroquia = 0, idzona = 0, idjunta = 0;
                String dignidad = "", provincia = "", canton = "", parroquia = "", zona = "", junta = "";
                iddignidad = Integer.parseInt(request.getParameter("iddignidad").toString());
                dignidad = request.getParameter("dignidad").toString();
                idprovincia = Integer.parseInt(request.getParameter("idprovincia").toString());
                provincia = request.getParameter("provincia").toString();
                idcanton = Integer.parseInt(request.getParameter("idcanton").toString());
                canton = request.getParameter("canton").toString();
                idparroquia = Integer.parseInt(request.getParameter("idparroquia").toString());
                parroquia = request.getParameter("parroquia").toString();
                idzona = Integer.parseInt(request.getParameter("idzona").toString());
                zona = request.getParameter("zona").toString();
                idjunta = Integer.parseInt(request.getParameter("idjunta").toString());
                junta = request.getParameter("junta").toString();
                JU = JUDb.CargarJuntaxId(idjunta);

                //CONDICION DEL TIPO DE PARROQUIA.
                /*
                * 1:PREFECTO
                * 2:ALCALDE
                * 3:CONCEJAR URBANO
                * 4:CONCEJAR RURAL
                * 5:JUNTA PARROQUIAL
                 */
                //Cargo las actas
                Cacta_imagesDB acImDB = new Cacta_imagesDB();
                ArrayList<Cacta_images> lista_imagenes = (ArrayList<Cacta_images>) session.getAttribute("lista_acta_images");
                lista_imagenes = acImDB.Cargar_Activas(idjunta, iddignidad);
                
                parroquiasDB parr = new parroquiasDB();
                String estParr = parr.CargarParroquiaId(idparroquia).getEstado_parroquia();
                if (estParr.equals("U")) {
                    if (iddignidad == 4 || iddignidad == 5) {
                        response.sendRedirect("mensaje.jsp?men=No se elije " + dignidad + " en una parroquia <b>URBANA</b>");
                        return;
                    }
                } else {
                    if (iddignidad == 3) {
                        response.sendRedirect("mensaje.jsp?men=No se elije " + dignidad + " en una parroquia <b>RURAL</b>");
                        return;
                    }
                }/*Comentado desde la linea 100 */
            %>
            <div class="container mt-3">
                <div class="clearfix text-center">
                    <input type="hidden" name="idusuario" value="<%= session.getAttribute("idusuario").toString()%>">
                    <h4>ACTA DE ESCRUTINIO</h4>    
                    <h4><%= request.getParameter("dignidad")%></h4> 
                </div>
            </div>

            <div class="row d-flex justify-content-center">
                <div class="col-lg-10 col-sm-12">
                    <div class="card bg-light p-4">
                        <div class="card-header bg-light p-0 pb-3">
                            <h5 class="mb-0"><%= JU.getRecinto_nombre()%> - <span class="badge text-bg-success"> <%= request.getParameter("junta")%> </span></h5>
                        </div>
                        <div class="card-body">

                            <div class="row">
                                <div class="col-4">
                                    <div class="form-floating mb-3">
                                        <input id="acta_no" name="txt_id_acta" value="(AUTO)" type="text" readonly class="form-control-plaintext">
                                        <label for="acta_no">Acta Nº:</label>
                                    </div>
                                </div>

                                <div class="col-4">
                                    <div class="form-floating mb-3">
                                        <input id="txt_zona" name="txt_zona" value="<%= request.getParameter("zona")%>" type="text" readonly class="form-control-plaintext">
                                        <label for="txt_zona">Zona:</label>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-4">
                                    <div class="form-floating mb-3">
                                        <input type="hidden" name="iddignidad" value="<%= request.getParameter("iddignidad")%>">
                                        <input type="hidden" name="dignidad" value="<%= request.getParameter("dignidad")%>">
                                        <input type="hidden" name="idprovincia" value="<%= request.getParameter("idprovincia")%>">
                                        <input type="hidden" name="provincia" value="<%= request.getParameter("provincia")%>">
                                        <input type="hidden" name="idcanton" value="<%= request.getParameter("idcanton")%>">
                                        <input type="hidden" name="canton" value="<%= request.getParameter("canton")%>">
                                        <input type="hidden" name="idparroquia" value="<%= request.getParameter("idparroquia")%>">
                                        <input type="hidden" name="parroquia" value="<%= request.getParameter("parroquia")%>">
                                        <input type="hidden" name="idzona" value="<%= request.getParameter("idzona")%>">
                                        <input type="hidden" name="zona" value="<%= request.getParameter("zona")%>">
                                        <input type="hidden" name="idjunta" value="<%= request.getParameter("idjunta")%>">
                                        <input type="hidden" name="junta" value="<%= request.getParameter("junta")%>">
                                        <input id="txt_provincia" name="txt_provincia" value="<%= request.getParameter("provincia")%>" type="text" readonly class="form-control-plaintext">
                                        <label for="txt_provincia">Provincia</label>
                                    </div>
                                </div>

                                <div class="col-4">

                                    <div class="form-floating mb-3">
                                        <input type="hidden" name="txt_circunsc" id="txt_circunsc" class="form-control" value="">
                                        <input id="txt_canton" name="txt_canton" value="<%= request.getParameter("canton")%>" type="text" readonly class="form-control-plaintext">
                                        <label for="txt_canton">Cantón</label>
                                    </div>
                                </div>

                                <div class="col-4">

                                    <div class="form-floating mb-3">
                                        <input id="txt_parroquia" name="txt_parroquia" value="<%= request.getParameter("parroquia")%>" type="text" readonly class="form-control-plaintext">
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
                            <h5 class="mb-0">Rellena los campos del acta</h5>
                        </div>
                        <div class="card-body">

                            <div class="form-floating mb-3">
                                <input type="number" autocomplete="off" id="txt_cne_cod_acta" name="txt_cne_cod_acta" value="" placeholder="No Obligatorio" class="form-control" autofocus>
                                <label for="txt_cne_cod_acta">Código CNE de Acta</label>
                            </div>

                            <div class="form-floating mb-3">
                                <input autocomplete="off" min="0" max="350" name="txt_total_votos" id="txt_total_votos" value="" type="number" class="form-control" placeholder="Ingrese un número">
                                <label for="txt_total_votos">Total Firmas y Huellas</label>
                            </div>

                            <div class="form-floating mb-3">
                                <input autocomplete="off" min="0" max="350" placeholder="Ingrese un Número" name="txt_votos_blanco" id="txt_votos_blanco" value="" type="number" class="form-control">
                                <label for="txt_votos_blanco">Votos en Blanco</label>
                            </div>

                            <div class="form-floating mb-3">
                                <input type="hidden" name="txt_no_votaron" id="txt_no_votaron" value="0"/>
                                <input autocomplete="off" min="0" max="350" placeholder="Ingrese un Número" type="number" name="txt_votos_nulos" id="txt_votos_nulos" value="" class="form-control">
                                <label for="txt_votos_nulos">Votos Nulos</label>
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
                                ArrayList<candidato> lista = null;
                                //Estado 1 Pendientes
                                if (iddignidad == 1) { //Presidente - Nacional
                                    lista = CANDdb.CargarxDignidadProvincial(iddignidad, idprovincia);
                                }
                                if (iddignidad == 2) { //Asambleista Provincial
                                    cantonesDB cantDD = new cantonesDB();
                                    lista = CANDdb.CargarxDignidadCantonal(iddignidad, cantDD.CargarIdCantonPadre(idcanton));
                                    //lista = CANDdb.CargarxDignidadProvincial(iddignidad, idprovincia);
                                }
                                if (iddignidad == 3) { //Concejales Urbanos
                                    lista = CANDdb.CargarxDignidadCantonal(iddignidad, idcanton);
                                    //lista = CANDdb.CargarxDignidadProvincial(iddignidad, idprovincia);
                                }
                                if (iddignidad == 4) { //Concejales Rurales
                                    lista = CANDdb.CargarxDignidadCantonal(iddignidad, idcanton);
                                    //lista = CANDdb.CargarxDignidadProvincial(iddignidad, idprovincia);
                                }
                                if (iddignidad == 5) { //Presidente Junta
                                    lista = CANDdb.CargarxDignidadParroquia(iddignidad, idparroquia);
                                }
                                /*
                                if (iddignidad == 6) { //CPCCS MUJER
                                    lista = CANDdb.CargarxDignidadProvincial(iddignidad, idprovincia);
                                }
                                if (iddignidad == 7) { //CPCCS HOMBRE
                                    lista = CANDdb.CargarxDignidadProvincial(iddignidad, idprovincia);
                                }
                                if (iddignidad == 8) { //CPCCS MIN ETCN
                                    lista = CANDdb.CargarxDignidadProvincial(iddignidad, idprovincia);
                                }*/

                                //Busco el factor num_canidato en lista
                                int num_cand_elec = 0;
                                breakLoop:
                                for (candidato p : lista) {
                                    for (candidato q : lista) {
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
                                for (candidato p : lista) {
                                    t++;
                            %>
                            <div class="mt-5">
                                <div class="row g-2 g-md-4">

                                    <div class="col-3">
                                        <div class="image has-shadow"><img src="images/logos/<%= p.getFr_id_organizacion()%>.jpg" style="width:80px" alt="img" class="img-fluid img-avatar"></div>

                                    </div>
                                    <div class="col-5">
                                        <h5 class="card-title"><%= p.getNombre()%></h5>
                                        <h6 class="card-subtitle mb-2 text-muted"><%= p.getOrganizacion_nombre()%> Lista: <%= p.getOrganizacion_lista()%></h6>
                                    </div>

                                    <div class="col-1"></div>


                                    <div class="col-3 d-flex justify-content-end">
                                        <input class="form-control" autocomplete="off" type="number" min="0" max="350" id="<%= t%>" name="<%= p.getIdcandidato()%>" value="">
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
                                <input name="txt_es_legible" id="txt_es_legible" class="form-check-input flex-shrink-0" type="checkbox" checked style="font-size: 1.375em;" />
                                <span class="pt-1 form-checked-content"><strong>Si el acta no es legible, quite el check.</strong>
                                </span>
                            </label>
                        </div>

                        <div class="col-lg-12 col-md-6">
                            <label for="txt_es_cuadrada" class="list-group-item d-flex gap-3">
                                <input name="txt_es_cuadrada" id="txt_es_cuadrada" class="form-check-input flex-shrink-0" type="checkbox" checked style="font-size: 1.375em;" />
                                <span class="pt-1 form-checked-content"><strong>Si los valores del acta no coinciden, quite el check.</strong></span>
                            </label>
                        </div>
                        <div class="form-group row text-center mt-3 mb-3">
                            <div class="col-sm-10">
                                <% if (t > 0) {%>
                                <input type="button" onclick="verifica_acta(<%= t%>,<%= num_cand_elec%>);" id="aceptar" name="Aceptar" value="Ingresar Acta" class="btn btn-dark"/>
                                <% }%>
                                <input type="button" id="regresar" onclick="javascript:history.back(1)" name="regresar" value="Regresar" class="btn btn-danger"/>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </form>
       <!-- <%-- for (Cacta_images image : lista_imagenes) {%>            
        <div class="centrar_imagen">
            <div class="la_imagen">
                <img class="myImg" id="img_<%= image.getidacta_images()%>" onclick="show_modal('img_<%= image.getidacta_images()%>')" src="images/actas/<%= image.getidacta_images()%>.jpg" alt="Acta">
            </div>
            <div class="eliminar_imagen">
                <a href="admin/acta_images_actualizar_resultado.jsp?txt_idacta_images=<%= image.getidacta_images()%>&iddignidad=<%= iddignidad%>&idjunta=<%= idjunta%>"><img style="width: 20%;" src="images/delete.png"></a>
            </div>
        </div>
        <% }--%> -->

        <!-- <div class="container">
            <h1>Cargar imagen del acta</h1>
            <form method="POST" enctype="multipart/form-data" action="<%= request.getContextPath()%>/UploadFile">
                <%-- session.setAttribute("id_junta_subir", idjunta);
                    session.setAttribute("id_dignidad_subir", iddignidad);
                    session.setAttribute("subir_desde", "digitar"); --%>
                Elija la imagen y luego de clic en <b>Cargar</b>. <input required type="file" name="fichero" style="cursor:pointer;" accept="image/jpeg">
                <input class="btn bg-green text-center" type="submit" value="Cargar">
            </form>
        </div> -->
    </body>
</html>
