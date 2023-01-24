<%-- 
   Document   : index
   Created on : Jul 12, 2014, 11:48:02 AM
   Author     : Generado V1.0
--%>

<%@page import="admin.CObjetoCombo"%>
<%@page import="java.util.ArrayList"%><%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Control Electoral-usuario</title>
        <!-- <link href="../styles/generales.css" rel="stylesheet" type="text/css" media="screen" /> -->
        <!--  <link href="../styles/basic.css" rel="stylesheet" type="text/css" media="screen" /> -->

        <!-- Bootstrap 5.2 -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">

        <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js"></script>
    </head>
    <body>
        <div class="container">
            <form name="form1" action="admin_controlador.srvlt_usuario_insert">         <center>
                    <div>
                        <a class="btn btn-primary" style="--bs-btn-padding-y: .25rem; --bs-btn-padding-x: .5rem; --bs-btn-font-size: .75rem;" href="usuario_ingresar.jsp">Nuevo</a>
                        <a class="btn btn-dark" style="--bs-btn-padding-y: .25rem; --bs-btn-padding-x: .5rem; --bs-btn-font-size: .75rem;" href="admin_controlador.srvlt_usuario_listar_todos">Listar Todos</a>
                        <a class="btn btn-danger" style="--bs-btn-padding-y: .25rem; --bs-btn-padding-x: .5rem; --bs-btn-font-size: .75rem;" href="javascript:history.back(1)">Cancelar</a>
                    </div> 

                    <div class="row d-flex justify-content-center">
                        <div class="col-lg-10 col-sm-12">
                            <div class="card mt-2 mb-2">
                                <div class="card-header">
                                    Ingresar Usuario
                                </div>
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col-6">
                                            <div class="form-floating mb-3">
                                                <input name="txt_nombres" type="text" class="form-control" id="InputNames" placeholder="Ingrese Nombres y Apellidos">
                                                <label for="InputNames">Nombres y Apellidos</label>
                                            </div> 
                                        </div>
                                        <div class="col-6">
                                            <div class="form-floating mb-3">
                                                <input name="txt_usuario" type="text" class="form-control" id="InputUser" placeholder="Ingrese el Usuario">
                                                <label for="InputUser">Usuario</label>
                                            </div>
                                        </div>

                                        <div class="col-6">
                                            <div class="form-floating mb-3">
                                                <%
                                                    if (session.getAttribute("lista_combo_provincia") == null) {
                                                        response.sendRedirect("admin_controlador.srvlt_provincia_listar_combo?red=usuario_ingresar.jsp");
                                                        return;
                                                    }
                                                    ArrayList<CObjetoCombo> lista_combo_provincia = (ArrayList<CObjetoCombo>) session.getAttribute("lista_combo_provincia");
                                                %>
                                                <select name="txt_fr_id_provincia" class="form-select" id="floatingSelectProvincias" aria-label="Floating label select provincia">
                                                    <%for (CObjetoCombo c : lista_combo_provincia) {
                                                    %>
                                                    <option value="<%= c.getId()%>"><%= c.getValor()%></option>
                                                    <% }%>
                                                </select>
                                                <label for="floatingSelectProvincias">Provincia</label>
                                            </div>
                                        </div>

                                        <div class="col-6">
                                            <div class="form-floating mb-3">
                                                <input name="txt_provincia_nombre" type="text" class="form-control" id="InputDireccion" placeholder="Ingrese una Dirección">
                                                <label for="InputDireccion">Dirección</label>
                                            </div>
                                        </div>

                                        <div class="col-6">
                                            <div class="form-floating mb-3">
                                                <%
                                                    if (session.getAttribute("lista_combo_tipo_usuario") == null) {
                                                        response.sendRedirect("admin_controlador.srvlt_tipo_usuario_listar_combo?red=usuario_ingresar.jsp");
                                                        return;
                                                    }
                                                    ArrayList<CObjetoCombo> lista_combo_tipo_usuario = (ArrayList<CObjetoCombo>) session.getAttribute("lista_combo_tipo_usuario");
                                                %>
                                                <select name="txt_fr_id_tipo_usuario" class="form-select" id="floatingSelectTypeUsers" aria-label="Floating label select type">
                                                    <%for (CObjetoCombo c : lista_combo_tipo_usuario) {
                                                    %>
                                                    <option value="<%= c.getId()%>"><%= c.getValor()%></option>   
                                                    <% }%>
                                                </select>
                                                <label for="floatingSelectTypeUsers">Tipo de Usuario</label>
                                            </div>
                                        </div>

                                        <div class="col-6">
                                            <div class="form-floating mb-3">
                                                <select name="txt_es_provincial" class="form-select" id="floatingSelectIsProv" aria-label="Floating label select isProv">                                         
                                                    <option value="1">Si</option>
                                                    <option value="0">No</option>
                                                </select>
                                                <label for="floatingSelectIsProv">¿Es Provincial?</label>
                                            </div>
                                        </div>

                                        <div class="col-6"> 
                                            <div class="form-floating mb-3">
                                                <%
                                                    if (session.getAttribute("lista_combo_cantones") == null) {
                                                        response.sendRedirect("admin_controlador.srvlt_cantones_listar_combo?red=usuario_ingresar.jsp");
                                                        return;
                                                    }
                                                    ArrayList<CObjetoCombo> lista_combo_cantones = (ArrayList<CObjetoCombo>) session.getAttribute("lista_combo_cantones");
                                                %>
                                                <select name="txt_fr_id_canton" class="form-select" id="floatingSelectCantonal" aria-label="Floating label select Canton">
                                                    <%for (CObjetoCombo c : lista_combo_cantones) {
                                                    %>
                                                    <option value="<%= c.getId()%>"><%= c.getValor()%></option>
                                                    <% }%>
                                                </select>
                                                <label for="floatingSelectCantonal">Cantón</label>
                                            </div>
                                        </div> 

                                        <div class="col-6">
                                            <div class="form-floating mb-3">
                                                <select name="txt_es_cantonal" class="form-select" id="floatingSelectIsCantonal" aria-label="Floating label select isCantonal">                                         
                                                    <option value="1">Si</option>
                                                    <option value="0">No</option>
                                                </select>
                                                <label for="floatingSelectCantonal">¿Es Cantonal?</label>
                                            </div>
                                        </div>

                                        <div class="col-6">
                                            <div class="form-floating mb-3">
                                                <input name="txt_tipo_usu_nombre" type="text" class="form-control" id="InputTypeUser" placeholder="Ingrese una typeUser">
                                                <label for="InputTypeUser">Tipo de Usuario</label>
                                            </div>
                                        </div>

                                        <div class="col-6">
                                            <div class="form-floating mb-3">
                                                <input name="txt_clave" type="password" class="form-control" id="InputPassw" placeholder="Ingrese una Passw">
                                                <label for="InputPassw">Contraseña</label>
                                            </div>
                                        </div>

                                        <div class="col-6">
                                            <div class="form-floating mb-3">
                                                <select name="txt_activo" class="form-select" id="floatingSelectActive" aria-label="Floating label select active">                                   
                                                    <option value="1">Si</option>
                                                    <option value="0">No</option>
                                                </select>
                                                <label for="floatingSelectActive">¿Usuario Activo?</label>
                                            </div>
                                        </div>

                                        <div class="col-6">
                                            <div class="form-check  mb-3">
                                                <input id="crear_nueva" name="crear_nueva" class="form-check-input" type="checkbox" checked>
                                                <label class="form-check-label" for="crear_nueva">
                                                    Después del ingreso, regresar a esta pantalla para crear un nuevo registro.
                                                </label>
                                            </div>
                                        </div>
                                        <div class="d-grid gap-2 col-6 mx-auto mt-3">
                                            <input class="btn btn-dark" type="submit" name="ingresar" value="Ingresar">
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>

                </center>
            </form>
        </div>
    </body>
</html>