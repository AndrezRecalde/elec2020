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
        <form name="form1" action="admin_controlador.srvlt_usuario_insert">      
            <center>
                <div>
                    <a class="btn btn-primary" style="--bs-btn-padding-y: .25rem; --bs-btn-padding-x: .5rem; --bs-btn-font-size: .75rem;" href="usuario_ingresar.jsp">Nuevo</a>
                    <a class="btn btn-dark" style="--bs-btn-padding-y: .25rem; --bs-btn-padding-x: .5rem; --bs-btn-font-size: .75rem;" href="admin_controlador.srvlt_usuario_listar_todos">Listar Todos</a>
                    <a class="btn btn-danger" style="--bs-btn-padding-y: .25rem; --bs-btn-padding-x: .5rem; --bs-btn-font-size: .75rem;" href="javascript:history.back(1)">Cancelar</a>
                    
                </div>      
                <div class="contenedor_tabla">
                    <table class="clsTablaDatos form_style">
                        <thead><tr><td colspan="2">Detalles del usuario</td></tr></thead>
                        <tbody>
                            <tr ><td><b>ID</b>
                                </td>
                                <td>
                                    <input readonly type="text" name="txt_idusuario" value="<%= request.getParameter("txt_idusuario")%>">
                                </td>
                            </tr>

                            <tr ><td><b>Nombres y Apellidos</b>
                                </td>
                                <td>
                                    <input readonly type="text" name="txt_nombres" value="<%= request.getParameter("txt_nombres")%>">
                                </td>
                            </tr>

                            <tr ><td><b>Usuario</b>
                                </td>
                                <td>
                                    <input readonly type="text" name="txt_usuario" value="<%= request.getParameter("txt_usuario")%>">
                                </td>
                            </tr>

                            <tr ><td><b>Provincia</b>
                                </td>
                                <td>
                                    <input readonly type="text" name="txt_fr_id_provincia" value="<%= request.getParameter("txt_fr_id_provincia")%>">
                                </td>
                            </tr>

                            <tr ><td><b>Provincia</b>
                                </td>
                                <td>
                                    <input readonly type="text" name="txt_provincia_string" value="<%= request.getParameter("txt_provincia_string")%>">
                                </td>
                            </tr>

                            <tr ><td><b>Dirección</b>
                                </td>
                                <td>
                                    <input readonly type="text" name="txt_provincia_nombre" value="<%= request.getParameter("txt_provincia_nombre")%>">
                                </td>
                            </tr>

                            <tr ><td><b>Tipo de usuario</b>
                                </td>
                                <td>
                                    <input readonly type="text" name="txt_fr_id_tipo_usuario" value="<%= request.getParameter("txt_fr_id_tipo_usuario")%>">
                                </td>
                            </tr>

                            <tr ><td><b>Es provincial</b>
                                </td>
                                <td>
                                    <input readonly type="text" name="txt_es_provincial" <% if (request.getParameter("txt_es_provincial").contains("true")) {%>value="SI"<%} else {%>value="NO"<%}%>>
                                </td>
                            </tr>

                            <tr ><td><b>Canton</b>
                                </td>
                                <td>
                                    <input readonly type="text" name="txt_fr_id_canton" value="<%= request.getParameter("txt_fr_id_canton")%>">
                                </td>
                            </tr>

                            <tr ><td><b>Canton</b>
                                </td>
                                <td>
                                    <input readonly type="text" name="txt_cantones_string" value="<%= request.getParameter("txt_cantones_string")%>">
                                </td>
                            </tr>

                            <tr ><td><b>Es cantonal</b>
                                </td>
                                <td>
                                    <input readonly type="text" name="txt_es_cantonal" <% if (request.getParameter("txt_es_cantonal").contains("true")) {%>value="SI"<%} else {%>value="NO"<%}%>>
                                </td>
                            </tr>

                            <tr ><td><b>Tipo de usuario</b>
                                </td>
                                <td>
                                    <input readonly type="text" name="txt_tipo_usu_nombre" value="<%= request.getParameter("txt_tipo_usu_nombre")%>">
                                </td>
                            </tr>

                            <tr ><td><b>Tipo de usuario</b>
                                </td>
                                <td>
                                    <input readonly type="text" name="txt_tipo_usuario_string" value="<%= request.getParameter("txt_tipo_usuario_string")%>">
                                </td>
                            </tr>

                            <tr ><td><b>Login</b>
                                </td>
                                <td>
                                    <input readonly type="text" name="txt_login" value="<%= request.getParameter("txt_login")%>">
                                </td>
                            </tr>

                            <tr ><td><b>Clave</b>
                                </td>
                                <td>
                                    <input readonly type="text" name="txt_clave" value="<%= request.getParameter("txt_clave")%>">
                                </td>
                            </tr>

                            <tr ><td><b>Activo</b>
                                </td>
                                <td>
                                    <input readonly type="text" name="txt_activo" <% if (request.getParameter("txt_activo").contains("true")) {%>value="SI"<%} else {%>value="NO"<%}%>>
                                </td>
                            </tr>

                            <tr ><td><b>usu de ui</b>
                                </td>
                                <td>
                                    <input readonly type="text" name="txt_usu_ui" value="<%= request.getParameter("txt_usu_ui")%>">
                                </td>
                            </tr>

                            <tr ><td><b>usu de fi</b>
                                </td>
                                <td>
                                    <input readonly type="text" name="txt_usu_fi" value="<%= request.getParameter("txt_usu_fi")%>">
                                </td>
                            </tr>

                            <tr ><td><b>usu de um</b>
                                </td>
                                <td>
                                    <input readonly type="text" name="txt_usu_um" value="<%= request.getParameter("txt_usu_um")%>">
                                </td>
                            </tr>

                        </tbody>
                        <tfoot>
                            <tr>
                                <td colspan="2" style="text-align:center;">
                                    <a href="javascript:history.back(1)">Volver Atrás</a>
                                </td>
                            </tr>
                        </tfoot>         </table>
                </div>
            </center>
        </form>
    </body>
</html>