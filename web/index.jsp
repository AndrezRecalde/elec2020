<%-- 
    Document   : index
    Created on : 29-mar-2012, 14:20:30
    Author     : USUARIO
--%>

<%@page import="admin.CaccesosDB"%>
<%@page import="admin.Cusuario"%>
<%@page import="admin.CusuarioDB"%>
<%@page import="java.util.ArrayList"%>
<%@page import="eleccion.provinciaDB"%>
<%@page import="eleccion.provincia"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="eleccion.usuarioDB"%>
<%@page import="herramientas.Cripto"%>
<%@page import="org.omg.PortableInterceptor.SYSTEM_EXCEPTION"%>
<%@page import="java.util.Date"%>
<%@page import="eleccion.usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <LINK REL="SHORTCUT ICON" HREF="images/logo_up.png">
        <jsp:useBean id="usuario" class="eleccion.usuarioDB" scope="page">
            <jsp:setProperty name="usuario" property="*"></jsp:setProperty>
        </jsp:useBean>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <!-- <link rel="stylesheet" href="styles/screen.css"> -->
        <link href='https://fonts.googleapis.com/css?family=Roboto' rel='stylesheet'>
        <!-- DEPENDENCIAS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">

        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@tabler/icons@latest/iconfont/tabler-icons.min.css">

        <title>Control Electoral</title>
    </head>
    <body>
        <%
            if (request.getParameter("validar") != null) {
                usuario usu = new usuario();
                Date fe = new Date();
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
                if (usuario.isCorrecto(Cripto.md5(request.getParameter("usuario").toString()),
                        Cripto.md5(request.getParameter("pass").toString()),
                        Integer.parseInt(request.getParameter("id_prov").toString()))) {
                    usu = usuario.CargarUsuario(Cripto.md5(request.getParameter("usuario").toString()));
                    session.setAttribute("idusuario", usu.getIdusuario());
                    session.setAttribute("usuario", usu.getNombres());
                    session.setAttribute("tipo_usuario", usu.getFr_id_tipo_usuario());
                    session.setAttribute("sp", 50);
                    session.setAttribute("idprovincia", usu.getFr_id_provincia());
                    session.setAttribute("idtipousuario", usu.getFr_id_tipo_usuario());

                    CusuarioDB usuDBNew = new CusuarioDB();
                    Cusuario usuNew = new Cusuario();
                    usuNew = usuDBNew.Seleccionar_Id(usu.getIdusuario());
                    session.setAttribute("usu_es_cantonal", usuNew.getes_cantonal());
                    session.setAttribute("usu_id_canton", usuNew.getfr_id_canton());

                    CaccesosDB CAU = new CaccesosDB();
                    CAU.Ingresar(usu.getIdusuario(), 1);

                    usuario.ActualizaUltimoAcceso(usu.getIdusuario());

                    response.sendRedirect("principal.jsp");
                } else {
                    response.sendRedirect("error_acceso.jsp");
                }
            }
        %>
        <form name="s" method="post">
            <div class="container">
                <div class="row d-flex justify-content-center">
                    <div class="col-lg-5 col-sm-12">
                        <div class="card mt-5 mb-5">
                            <h5 class="card-header">
                                Autenticación - Elecciones Seccionales
                            </h5>
                            <img src="images/cne.png" class="card-img-top" alt="banner-1" />
                            <div class="card-body">
                                <div>
                                    <label for="formGroupExampleInput" class="form-label">Usuario</label>
                                    <div class="input-group input-group-lg flex-nowrap mb-3">
                                        <i class="input-group-text ti ti-user-circle"></i>
                                        <input type="text" id="login" name="usuario" class="form-control" placeholder="Ingrese su usuario">
                                    </div>
                                </div>

                                <div>
                                    <label for="formGroupExampleInput2" class="form-label">Contraseña</label>
                                    <div class="input-group input-group-lg flex-nowrap mb-3">

                                        <i class="input-group-text ti ti-key"></i>

                                        <input type="password" id="password" name="pass" class="form-control" placeholder="Ingrese su contraseña">
                                    </div>
                                </div>
                                <input type="hidden" name="id_prov" value="8">
                                <div class="d-grid gap-2 col-6 mx-auto mt-3">
                                    <button name="validar" type="submit" class="btn btn-primary  btn-lg">Acceder</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </form>


        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"
                integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3"
        crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js"
                integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V"
        crossorigin="anonymous"></script>
    </body>
</html>
