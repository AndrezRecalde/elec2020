<%-- 
    Document   : cambiar_contrasena
    Created on : 11/03/2019, 8:32:14
    Author     : DQuevedo
--%>

<%@page import="admin.CaccesosDB"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cambiar contraseña</title>

        <!--<link href="styles/basic.css" rel="stylesheet" type="text/css" media="screen" /> -->

        <!-- Bootstrap Core Css -->
        <!--  <link href="plugins/bootstrap/css/bootstrap.css" rel="stylesheet"> -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">


        <!-- Google Fonts -->

        <!-- Jquery Core Js -->
        <!-- <script src="plugins/jquery/jquery.min.js"></script> -->
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>


        <!-- Bootstrap Core Js -->
        <!--<script src="plugins/bootstrap/js/bootstrap.js"></script> -->
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js"></script>
    </head>
    <body>
        <%
            int id_usuario_session = Integer.parseInt(session.getAttribute("idusuario").toString());
            CaccesosDB CAU = new CaccesosDB();
            CAU.Ingresar(id_usuario_session, 5);
        %>
        <form method="post" action="admin/admin_controlador.srvlt_usuario_actualizar_contrasena">
            <div class="container">
                <div class="row d-flex justify-content-center">
                    <div class="col-lg-5 col-sm-12">
                        <div class="card mt-5 mb-3 ms-3">
                            <div class="card-header">
                                Cambio de contraseña
                            </div>
                            <div class="card-body">
                                
                                <div class="form-floating mb-3">
                                    <input type="password" name="clave" class="form-control" id="InputPassw" placeholder="Contraseña Nueva" autocomplete="off" required autofocus>
                                    <label for="InputPassw">Contraseña Nueva</label>
                                </div>
                                
                                <div class="form-floating">
                                    <input type="password" name="clave2" class="form-control" id="ConfirmPassw" placeholder="Confirmar Contraseña" autocomplete="off" required>
                                    <label for="ConfirmPassw">Confirmar Contraseña</label>
                                </div>
                                
                                <div class="mt-3 d-grid gap-2">
                                    <button type="submit" name="validar" class="btn btn-dark">Cambiar</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </form>

        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js"></script>
    </body>
</html>
