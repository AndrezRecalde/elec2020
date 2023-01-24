<%-- 
    Document   : error
    Created on : 04-abr-2012, 9:24:11
    Author     : USUARIO
--%>

<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <LINK REL="SHORTCUT ICON" HREF="icon.ico">
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Mensaje</title>
        <!-- <link href="styles/generales.css" rel="stylesheet" type="text/css" media="screen" /> -->
        <!-- <link href="styles/basic.css" rel="stylesheet" type="text/css" media="screen" /> -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">

        <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js"></script>
        
        <style>
            img {
                width: 100px;
                height: 200px;
                object-fit: scale-down;
            }
        </style>

    </head>
    <body>
        <div class="row d-flex justify-content-center">
            <div class="col-lg-3 col-sm-12">
                <div class="card text-center text-bg-light mt-5">
                    <img src="images/exclamacion.png" class="card-img-top" alt="error">
                    <div class="card-body">
                        <h5 class="card-title">Advertencia</h5>
                        <h6 class="card-text">
                            <%
                              String datoUno = request.getParameter("men");
                              out.println(datoUno);
                            %>
                        </h6>
                    </div>

                    <div class="card-footer text-muted">
                        <input class="btn btn-dark" type="button" id="aceptar" onclick="javascript:history.back(1)" name="Atras" value="REGRESAR"/>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
