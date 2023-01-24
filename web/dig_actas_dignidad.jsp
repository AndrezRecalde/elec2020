<%-- 
    Document   : act_recepcion
    Created on : 29/01/2013, 05:21:08 PM
    Author     : root
--%>

<%@page import="admin.CaccesosDB"%>
<%@page import="admin.Ccantones"%>
<%@page import="admin.CcantonesDB"%>
<%@page import="admin.Cusuario"%>
<%@page import="admin.CusuarioDB"%>
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
        <title>Digitacion de Actas</title>
        <link href="css/alertas.css" rel="stylesheet" type="text/css" media="screen" />

        <!-- Iconos -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" rel="stylesheet">

        <!-- <link href="styles/generales.css" rel="stylesheet" type="text/css" media="screen" /> -->
        <!-- <link href="styles/basic.css" rel="stylesheet" type="text/css" media="screen" /> -->

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>

        <!-- <script type="text/javascript" src="includes/jquery.js"></script> -->
        <script type="text/javascript" src="includes/combinados.js"></script>

    </head>
    <body>
        <form name="form1" action="dig_actas_dignidad.jsp">
            <%
                CusuarioDB usuDB = new CusuarioDB();
                Cusuario usu_edi = new Cusuario();
                int id_usuario_session = Integer.parseInt(session.getAttribute("idusuario").toString());
                usu_edi = usuDB.Seleccionar_Id(id_usuario_session);

                CaccesosDB CAU = new CaccesosDB();
                CAU.Ingresar(id_usuario_session, 2);

                if (request.getParameter("actas") != null) {
                    actaDB actaDB = new actaDB();
                    int iddignidad = 0, idprovincia = 0, idcanton = 0, idparroquia = 0, idzona = 0, idjunta = 0;
                    String dignidad = "", provincia = "", canton = "", parroquia = "", zona = "", junta = "";
                    boolean error = false;
                    String errorString = "";
                    if (request.getParameter("iddignidad") != null) {
                        iddignidad = Integer.parseInt(request.getParameter("iddignidad").toString());
                        if (iddignidad == -1) {
                            error = true;
                            errorString = "Por favor seleccione una Dignidad";
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
                            errorString = "Por favor seleccione una Provincia";
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
                        if (usu_edi.getes_cantonal()) {
                            CcantonesDB canDB = new CcantonesDB();
                            Ccantones can = new Ccantones();
                            can = canDB.Seleccionar_Id(idcanton);
                            if (usu_edi.getFr_id_canton_padre() != can.getfr_id_canton_pertenece()) {
                                error = true;
                                errorString = "Por favor selecciona actas del cantón al que has sido asignado.";
                            }
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
                            errorString = "Por favor seleccione una Parroquia";
                        } else {
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
                    }
                    if (request.getParameter("idzona") != null) {
                        idzona = Integer.parseInt(request.getParameter("idzona").toString());
                        if (idzona == -1) {
                            error = true;
                            errorString = "Por favor seleccione una Zona";
                        } else {
                            ArrayList lista = null;
                            if (session.getAttribute("zonas") != null) {
                                lista = (ArrayList) session.getAttribute("zonas");
                            }
                            if (lista.size() != 0) {
                                for (int x = 0; x < lista.size(); x = x + 3) {
                                    if (lista.get(x).toString().equals(request.getParameter("idzona").toString())) {
                                        zona = lista.get(x + 1).toString();
                                    }
                                }
                            }
                        }
                    }
                    if (request.getParameter("idjunta") != null) {
                        idjunta = Integer.parseInt(request.getParameter("idjunta").toString());
                        if (idjunta == -1) {
                            error = true;
                            errorString = "Por favor seleccione una Junta";
                        } else {
                            ArrayList lista = null;
                            if (session.getAttribute("juntas") != null) {
                                lista = (ArrayList) session.getAttribute("juntas");
                            }
                            if (lista.size() != 0) {
                                for (int x = 0; x < lista.size(); x = x + 3) {
                                    if (lista.get(x).toString().equals(request.getParameter("idjunta").toString())) {
                                        junta = lista.get(x + 1).toString();
                                    }
                                }
                            }
                        }
                    }
                    if (request.getParameter("error") != null) {
                        error = true;
                        errorString = request.getParameter("error");
                    }
                    if (!error) {
                        //Veo si ya se ha ingresado el acta de esa dignidad
                        if (actaDB.ExisteJuntaDignidad(idjunta, iddignidad)) {
                            //Restrinjo acta en caso de ser usuario de conteo rápido.
                            if (Integer.parseInt(session.getAttribute("idtipousuario").toString()) == 5) {
                                //Si es dueño de ese ingreso.
                                if (actaDB.CargarJuntaDignidad(idjunta, iddignidad).getActa_usu_ing() == id_usuario_session) {
                                    response.sendRedirect("dig_actas_dignidad_junta_ver.jsp?iddignidad=" + iddignidad + "&idjunta=" + idjunta);
                                    return;
                                } else {
                                    response.sendRedirect("dig_actas_dignidad.jsp?error=Esta acta ya ha sido ingresada por otro usuario.&actas=");
                                    return;
                                }
                            } else {
                                //Si no es de conteo rápido.
                                response.sendRedirect("dig_actas_dignidad_junta_ver.jsp?iddignidad=" + iddignidad + "&idjunta=" + idjunta);
                                return;
                            }

                        } else {
                            response.sendRedirect("dig_actas_dignidad_junta_digitar.jsp?iddignidad=" + iddignidad + "&idprovincia=" + idprovincia + "&idcanton=" + idcanton
                                    + "&idparroquia=" + idparroquia + "&idzona=" + idzona + "&idjunta=" + idjunta + "&ver=dig&dignidad=" + dignidad + "&provincia=" + provincia
                                    + "&canton=" + canton + "&parroquia=" + parroquia + "&zona=" + zona + "&junta=" + junta);
                            return;
                        }
                    } else {
            %>
            <div class="row d-flex justify-content-center mt-3">
                <div class="col-lg-5">
                    <div class="alert alert-danger" role="alert">
                        Error: <strong><%= errorString%></strong> 
                    </div>
                </div>
            </div>  
            <%
                    }
                }
            %>
            <center>
                <%
                    if (request.getParameter("men") != null) {
                %>
                <div id="alerts-x" class="alert alert-success alert-dismissible fade show" role="alert">
                    <%= request.getParameter("men").toString()%>
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>

                <%
                    }
                %>
            </center>

            <div class="row d-flex justify-content-center">
                <div class="col-lg-5 col-sm-12">
                    <div class="card bg-light p-4 mt-2 mt-2 mb-5">
                        <h5 class="card-header bg-light border-bottom p-3 p-sm-4">DIGITAR ACTAS</h5>
                        <div class="card-body">
                            <div class="form-floating">
                                <select class="form-select" name="iddignidad" id="iddignidad" aria-label="Floating label select dignidad">                                 
                                </select>
                                <label for="iddignidad">Seleccione Dignidad</label>
                            </div>

                            <div class="form-floating mt-3">
                                <select class="form-select" name="idprovincia" id="idprovincia" aria-label="Floating label select provincia">                                 
                                </select>
                                <label for="idprovincia">Seleccione la Provincia</label>
                            </div>

                            <div class="form-floating mt-3">
                                <select class="form-select" name="idcanton" id="idcanton" aria-label="Floating label select canton">                                 
                                </select>
                                <label for="idcanton">Seleccione el Cantón</label>
                            </div>

                            <div class="form-floating mt-3">
                                <select class="form-select" name="idparroquia" id="idparroquia" aria-label="Floating label select parroquia">                                 
                                </select>
                                <label for="idparroquia">Seleccione la Parroquia</label>
                            </div>

                            <div class="form-floating mt-3">
                                <select class="form-select" name="idzona" id="idzona" aria-label="Floating label select zona">                                 
                                </select>
                                <label for="idzona">Seleccione la Zona</label>
                            </div>

                            <div class="form-floating mt-3">
                                <select class="form-select" name="idjunta" id="idjunta" aria-label="Floating label select junta">                                 
                                </select>
                                <label for="idjunta">Seleccione la Junta</label>
                            </div>
                            <hr />
                            <div class="d-grid gap-2 d-md-flex d-lg-flex justify-content-md-center mt-3">
                                <input type="submit" name="actas" value="Digitar Acta" class="btn btn-dark" />
                                <input type="button" id="aceptar" onclick="javascript:history.back(1)" name="Atras" value="Regresar" class="btn btn-danger" />
                            </div>
                        </div>




                    </div>
                </div>
            </div>
        </form>
        <script type="text/javascript">
            $("#alerts-x").fadeIn(300).delay(1500).fadeOut(400);
        </script>
    </body>
</html>
