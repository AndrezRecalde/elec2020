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
                                
                                   
                                        <a class="boton active" title="Ver usuario" href="admin_controlador.srvlt_usuario_buscar?txt_idusuario=<%= c.getidusuario()%>" >
                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-eye" viewBox="0 0 16 16">
                                            <path d="M16 8s-3-5.5-8-5.5S0 8 0 8s3 5.5 8 5.5S16 8 16 8zM1.173 8a13.133 13.133 0 0 1 1.66-2.043C4.12 4.668 5.88 3.5 8 3.5c2.12 0 3.879 1.168 5.168 2.457A13.133 13.133 0 0 1 14.828 8c-.058.087-.122.183-.195.288-.335.48-.83 1.12-1.465 1.755C11.879 11.332 10.119 12.5 8 12.5c-2.12 0-3.879-1.168-5.168-2.457A13.134 13.134 0 0 1 1.172 8z"/>
                                            <path d="M8 5.5a2.5 2.5 0 1 0 0 5 2.5 2.5 0 0 0 0-5zM4.5 8a3.5 3.5 0 1 1 7 0 3.5 3.5 0 0 1-7 0z"/>
                                            </svg></a>
                                        <a class="boton active" title="Editar usuario" href="admin_controlador.srvlt_usuario_buscar_actualizar?txt_idusuario=<%= c.getidusuario()%>">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil" viewBox="0 0 16 16">
                                            <path d="M12.146.146a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1 0 .708l-10 10a.5.5 0 0 1-.168.11l-5 2a.5.5 0 0 1-.65-.65l2-5a.5.5 0 0 1 .11-.168l10-10zM11.207 2.5 13.5 4.793 14.793 3.5 12.5 1.207 11.207 2.5zm1.586 3L10.5 3.207 4 9.707V10h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.293l6.5-6.5zm-9.761 5.175-.106.106-1.528 3.821 3.821-1.528.106-.106A.5.5 0 0 1 5 12.5V12h-.5a.5.5 0 0 1-.5-.5V11h-.5a.5.5 0 0 1-.468-.325z"/>
                                            </svg></a>
                                    
                                    
                                        <a class="boton active" title="Eliminar usuario" href="admin_controlador.srvlt_usuario_buscar_eliminar?txt_idusuario=<%= c.getidusuario()%>">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash" viewBox="0 0 16 16">
                                            <path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z"/>
                                            <path fill-rule="evenodd" d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4 4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z"/>
                                            </svg></a>
                                        <a class="boton active" title="Ver usuario" href="admin_controlador.srvlt_accesos_listar_todos?txt_usuario_id=<%= c.getidusuario()%>&op=unico" >
                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-card-checklist" viewBox="0 0 16 16">
                                            <path d="M14.5 3a.5.5 0 0 1 .5.5v9a.5.5 0 0 1-.5.5h-13a.5.5 0 0 1-.5-.5v-9a.5.5 0 0 1 .5-.5h13zm-13-1A1.5 1.5 0 0 0 0 3.5v9A1.5 1.5 0 0 0 1.5 14h13a1.5 1.5 0 0 0 1.5-1.5v-9A1.5 1.5 0 0 0 14.5 2h-13z"/>
                                            <path d="M7 5.5a.5.5 0 0 1 .5-.5h5a.5.5 0 0 1 0 1h-5a.5.5 0 0 1-.5-.5zm-1.496-.854a.5.5 0 0 1 0 .708l-1.5 1.5a.5.5 0 0 1-.708 0l-.5-.5a.5.5 0 1 1 .708-.708l.146.147 1.146-1.147a.5.5 0 0 1 .708 0zM7 9.5a.5.5 0 0 1 .5-.5h5a.5.5 0 0 1 0 1h-5a.5.5 0 0 1-.5-.5zm-1.496-.854a.5.5 0 0 1 0 .708l-1.5 1.5a.5.5 0 0 1-.708 0l-.5-.5a.5.5 0 0 1 .708-.708l.146.147 1.146-1.147a.5.5 0 0 1 .708 0z"/>
                                            </svg></a>
                                    
                                
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