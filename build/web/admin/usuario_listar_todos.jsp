<%-- 
   Document   : index
   Created on : Jul 12, 2014, 11:48:02 AM
   Author     : Generado V1.0
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="admin.Cusuario" %>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Control Electoral-usuario</title>

        <!-- <link href="../styles/generales.css" rel="stylesheet" type="text/css" media="screen" /> -->
        <!-- <link href="../styles/basic.css" rel="stylesheet" type="text/css" media="screen" /> -->

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">

        <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js"></script>

        <link rel="stylesheet" type="text/css" href="../includes/TableFilter/filtergrid.css" media="screen" />
        <style type="text/css">
            select {
                height: 30px;
            }
            input {
                height: 30px;
            }
        </style>
        <script type="text/javascript" src="../includes/TableFilter/tablefilter.js"></script>

    </head>
    <body>
        <% SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM-dd HH:mm:ss"); %>
        <form name="form1">     
            <div class="container">
                <div class="mt-5 mb-2">

                    <a href="usuario_ingresar.jsp" class="btn btn-primary"
                       style="--bs-btn-padding-y: .25rem; --bs-btn-padding-x: .5rem; --bs-btn-font-size: .75rem;">Nuevo Usuario</a>

                    <a href="admin_controlador.srvlt_usuario_listar_todos" class="btn btn-dark"
                       style="--bs-btn-padding-y: .25rem; --bs-btn-padding-x: .5rem; --bs-btn-font-size: .75rem;">Listar Usuarios</a>

                </div>
                <table id="lista_table_filter_usuario">
                    <thead>
                        <tr>               
                            <td>Nombres y Apellidos</td>               
                            <td>Usuario</td>   
                            <td>Dirección</td>               
                            <td>Provincia</td>               
                            <td>Es provincial</td>               
                            <td>Canton</td>               
                            <td>Es cantonal</td>               
                            <td>Tipo de usuario</td>               
                            <td>Activo</td>               
                            <td>Último Acceso</td>
                            <td>Acciones</td>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            ArrayList<Cusuario> lista = (ArrayList<Cusuario>) session.getAttribute("lista_usuario");
                            for (Cusuario c : lista) {
                        %>
                        <tr ondblclick="document.location = 'admin_controlador.srvlt_usuario_buscar?txt_idusuario=<%= c.getidusuario()%>'">
                            <td><%= c.getnombres()%></td>               
                            <td><%= c.getusuario()%></td>  
                            <td><%= c.getprovincia_nombre()%></td>               
                            <td><%= c.getprovincia_string()%></td>               
                            <td><% if (c.getes_provincial()) {%>SI<%} else {%>NO<%}%></td>               
                            <td><%= c.getcantones_string()%></td>               
                            <td><% if (c.getes_cantonal()) {%>SI<%} else {%>NO<%}%></td>               
                            <td><%= c.gettipo_usuario_string()%></td>               
                            <td><% if (c.getactivo()) {%>SI<%} else {%>NO<%}%></td>               
                            <td><% if (c.getusu_ui() != null) {%> <%= sdf.format(c.getusu_ui())%><%}%></td>               
                            <td>
                                <div class="row">
                                    <div class="col-lg-6 col-sm-12">
                                        <a class="boton active" title="Ver usuario" href="admin_controlador.srvlt_usuario_buscar?txt_idusuario=<%= c.getidusuario()%>" >Ver</a>
                                        <a class="boton active" title="Editar usuario" href="admin_controlador.srvlt_usuario_buscar_actualizar?txt_idusuario=<%= c.getidusuario()%>">Editar</a>
                                    </div>
                                    <div class="col-lg-6 col-sm-12">
                                        <a class="boton active" title="Eliminar usuario" href="admin_controlador.srvlt_usuario_buscar_eliminar?txt_idusuario=<%= c.getidusuario()%>">Eliminar</a>
                                        <a class="boton active" title="Ver usuario" href="admin_controlador.srvlt_accesos_listar_todos?txt_usuario_id=<%= c.getidusuario()%>&op=unico" >Accesos</a>
                                    </div>
                                </div>
                            </td>
                        </tr>
                        <%
                            }
                        %>
                    </tbody>
                </table>
                <script language="javascript" type="text/javascript">
                    var table3Filters = {
                        sort: true,
                        sort_config: {sort_col: [0, false]},
                        btn_reset: true,
                        btn_reset_text: "Quitar Filtros",
                        rows_counter: true,
                        remember_grid_values: true,
                        rows_counter_text: "Total: ",
                        base_path: "../includes/TableFilter/",
                        col_0: "input",
                        col_1: "input",
                        col_2: "input",
                        col_3: "select",
                        col_4: "select",
                        col_5: "select",
                        col_6: "select",
                        col_7: "select",
                        col_8: "select",
                        col_9: "select",
                        col_10: "none",
                        display_all_text: "TODOS",
                        loader: true,
                        loader_css_class: "myLoader",
                        loader_html: '<img src="../includes/TableFilter/loader.gif" alt="" style="vertical-align:middle; margin-right:5px;">Cargando...'
                    };
                    var tf03 = setFilterGrid("lista_table_filter_usuario", table3Filters);
                </script> 
            </div>
        </form>
    </body>
</html>