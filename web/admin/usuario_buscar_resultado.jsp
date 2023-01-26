<%-- 
   Document   : index
   Created on : Jul 12, 2014, 11:48:02 AM
   Author     : Generado V1.0
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Control Electoral-usuario</title>
        <!--  <link href="../styles/generales.css" rel="stylesheet" type="text/css" media="screen" /> -->
        <!-- <link href="../styles/basic.css" rel="stylesheet" type="text/css" media="screen" /> -->

        <!-- Bootstrap 5.2 -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">

        <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js"></script>

    </head>
    <body>
        <div class="container">
            <form name="form1" action="admin_controlador.srvlt_usuario_insert">      
                <div class="mt-2 mb-2">
                    <a class="btn btn-primary" style="--bs-btn-padding-y: .25rem; --bs-btn-padding-x: .5rem; --bs-btn-font-size: .75rem;" href="usuario_ingresar.jsp">Nuevo</a>
                    <a class="btn btn-dark" style="--bs-btn-padding-y: .25rem; --bs-btn-padding-x: .5rem; --bs-btn-font-size: .75rem;" href="admin_controlador.srvlt_usuario_listar_todos">Listar Todos</a>
                    <a class="btn btn-danger" style="--bs-btn-padding-y: .25rem; --bs-btn-padding-x: .5rem; --bs-btn-font-size: .75rem;" href="javascript:history.back(1)">Cancelar</a>
                </div>  

                <div class="row d-flex justify-content-center">
                    <div class="col-lg-10 col-sm-12">
                        <div class="card mt-2 mb-2">
                            <div class="card-header">
                                Detalles del usuario <strong><%= request.getParameter("txt_nombres")%></strong>
                            </div>
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-6">
                                        <div class="form-floating mb-3">
                                            <input readOnly name="txt_nombres" type="text" class="form-control" id="InputNames" value="<%= request.getParameter("txt_nombres")%>" />
                                            <label for="InputNames">Nombres y Apellidos</label>
                                        </div> 
                                    </div>
                                    <div class="col-6">
                                        <div class="form-floating mb-3">
                                            <input name="txt_usuario" type="text" class="form-control" id="InputUser" value="<%= request.getParameter("txt_usuario")%>" />
                                            <label for="InputUser">Usuario</label>
                                        </div>
                                    </div>

                                    <div class="col-6">
                                        <div class="form-floating mb-3">
                                            <input name="txt_provincia_string" type="text" class="form-control" id="floatingSelectProvincias" value="<%= request.getParameter("txt_provincia_nombre")%>" />
                                            <label for="floatingSelectProvincias">Provincia</label>
                                        </div>
                                    </div>

                                    <div class="col-6">
                                        <div class="form-floating mb-3">
                                            <input name="txt_provincia_nombre" type="text" class="form-control" id="floatingDireccion" value="<%= request.getParameter("txt_provincia_nombre")%>" />
                                            <label for="floatingDireccion">Dirección</label>
                                        </div>
                                    </div>

                                    <div class="col-12">
                                        <div class="form-floating mb-3">
                                            <input name="txt_es_provincial" type="text" class="form-control" id="floatingProvincias" <% if (request.getParameter("txt_es_provincial").contains("true")) {%>value="SI"<%} else {%>value="NO"<%}%> />
                                            <label for="floatingProvincias">¿Es Provincial?</label>
                                        </div>
                                    </div>
                                    <div class="col-6">
                                        <div class="form-floating mb-3">
                                            <input name="txt_es_cantonal" type="text" class="form-control" id="floatingEsCantonal" <% if (request.getParameter("txt_es_cantonal").contains("true")) {%>value="SI"<%} else {%>value="NO"<%}%> />
                                            <label for="floatingEsCantonal">¿Es Cantonal?</label>
                                        </div>
                                    </div>
                                    <div class="col-6">
                                        <div class="form-floating mb-3">
                                            <input name="txt_cantones_string" type="text" class="form-control" id="floatingCanton" value="<%= request.getParameter("txt_cantones_string")%>" />
                                            <label for="floatingCanton">Canton</label>
                                        </div>
                                    </div>
                                    <div class="col-6">
                                        <div class="form-floating mb-3">
                                            <input name="txt_tipo_usu_nombre" type="text" class="form-control" id="txt_tipo_usu_nombre" value="<%= request.getParameter("txt_tipo_usu_nombre")%>" />
                                            <label for="txt_tipo_usu_nombre">Tipo de Usuario</label>
                                        </div>
                                    </div>
                                    <div class="col-6">
                                        <div class="form-floating mb-3">
                                            <input name="txt_activo" type="text" class="form-control" id="txt_activo" <% if (request.getParameter("txt_activo").contains("true")) {%>value="SI"<%} else {%>value="NO"<%}%> />
                                            <label for="txt_activo">¿Activo?</label>
                                        </div>
                                    </div>                             
                                    <div class="col-6">
                                        <div class="form-floating mb-3">
                                            <input name="txt_usu_fi" type="text" class="form-control" id="txt_usu_fi" value="<%= request.getParameter("txt_usu_fi")%>" />
                                            <label for="txt_usu_fi">Fecha de creación</label>
                                        </div>
                                    </div>
                                    <div class="col-6">
                                        <div class="form-floating mb-3">
                                            <input name="txt_usu_ui" type="text" class="form-control" id="txt_usu_ui" value="<%= request.getParameter("txt_usu_ui")%>" />
                                            <label for="txt_usu_ui">Ultimo Ingreso</label>
                                        </div>
                                    </div>
                                    <div class="d-grid gap-2 col-6 mx-auto mt-3">
                                        <a class="btn btn-dark" href="javascript:history.back(1)">Volver Atrás</a>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
            </form>
        </div>
    </body>
</html>