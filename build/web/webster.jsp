<%-- 
    Document   : hont
    Created on : 07-ene-2021, 8:22:07
    Author     : TIC-DQUEVEDO
--%>

<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="eleccion.ClassResultadosBasico"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Webster</title>
        <!-- Bootstrap -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">

        <style type="text/css">
            .img-avatar {
                border-radius: 50%;
                text-align: center;           
            }
        </style>

        <script src="https://code.highcharts.com/highcharts.js"></script>
        <script src="https://code.highcharts.com/modules/exporting.js"></script>
        <script src="https://code.highcharts.com/modules/export-data.js"></script>
        <script src="https://code.highcharts.com/modules/accessibility.js"></script>
        <script>
            function marcar(i, id, code_color) {
                var tot = document.getElementById(i).value;
                if (document.getElementById(id).style.fontWeight === "bold") {
                    document.getElementById(id).removeAttribute("style");
                    tot--;
                } else {
                    document.getElementById(id).style.fontWeight = "bold";
                    document.getElementById(id).style.backgroundColor = code_color;
                    document.getElementById(id).style.padding = "5px";
                    tot++;
                }
                document.getElementById(i).value = tot;
            }
        </script>
    </head>
    <body>
        <h4 class="d-flex justify-content-center mt-3 mb-3"><%= request.getParameter("dignidad_string")%></h4>
        <h6 class="d-flex justify-content-center mt-3 mb-3"><span class="badge text-bg-primary">Concejales Urbanos - Esmeraldas Circ.1</span></h6>
        <% SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");%>
        <p class="d-flex justify-content-center mb-3" ><strong class="mr-3">Fecha y hora de reporte:&nbsp;</strong> <%= sdf.format(Calendar.getInstance().getTime())%></p>
        <div>
            <% ArrayList<ClassResultadosBasico> chart_lista_res_basic = (ArrayList<ClassResultadosBasico>) session.getAttribute("resultados_webster"); %>
            <div class="container-fluid">
                <div class="row clearfix">
                    <div class="col-sm-8">
                        <table class="table table-bordered table-hover table align-middle">
                            <thead>
                                <tr>
                                    <th>Listas</th>
                                    <th>Organización</th>
                                    <th>Total Votos</th>
                                    <th>1</th>
                                    <th>3</th>
                                    <th>5</th>
                                    <th>7</th>
                                    <th>No. Escaños</th>
                                </tr>
                            </thead>

                            <%
                                float total_votos = Float.parseFloat(request.getParameter("total_votos"));
                                float por = 0;
                                int i = 0;
                                for (ClassResultadosBasico c : chart_lista_res_basic) {
                                    por = (c.getTotal_votos() / total_votos) * 100;
                                    i++;
                            %>
                            <tr>
                                <td><img align="center" src="images/logos/<%= c.getIdorganizacion()%>.jpg" style="width: 70px; height: 70px;" class="d-flex p-2 img-avatar"></td>      
                                <td><%= c.getNombre()%></td>      
                                <td class="text-centered"><%= c.getTotal_votos()%></td>    
                                <td class="text-centered"><span onclick="marcar(<%= i%>, '<%=i%>_1', '<%= c.getColor()%>');" id="<%=i%>_1"><%= c.getTotal_votos()%></span></td> 
                                <td class="text-centered"><span onclick="marcar(<%= i%>, '<%=i%>_3', '<%= c.getColor()%>');" id="<%=i%>_3"><%= c.getTotal_votos() / 3%></span></td>
                                <td class="text-centered"><span onclick="marcar(<%= i%>, '<%=i%>_5', '<%= c.getColor()%>');" id="<%=i%>_5"><%= c.getTotal_votos() / 5%></span></td> 
                                <td class="text-centered"><span onclick="marcar(<%= i%>, '<%=i%>_7', '<%= c.getColor()%>');" id="<%=i%>_7"><%= c.getTotal_votos() / 7%></span></td> 
                                <td>
                                    <div class="input-group input-group-lg"> 
                                        <input disabled id="<%=i%>" value="0" type="number" style="width: 35px" class="form-control">
                                    </div>
                                </td>
                            </tr>
                            <%}%>
                        </table>
                    </div>
                    <div class="col-sm-4">
                        <div class="row">   
                            <div class="rep_pie">
                                <div id="pie-porcentaje-ingreso" style="min-width: 310px; height: 350px; max-width: 600px; margin: 0 auto"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script>
            Highcharts.setOptions({
                colors: Highcharts.map(Highcharts.getOptions().colors, function (color) {
                    return {
                        radialGradient: {
                            cx: 0.5,
                            cy: 0.3,
                            r: 0.7
                        },
                        stops: [
                            [0, color],
                            [1, Highcharts.color(color).brighten(-0.3).get('rgb')] // darken
                        ]
                    };
                })
            });

// Build the chart
            Highcharts.chart('pie-porcentaje-ingreso', {
                chart: {
                    plotBackgroundColor: null,
                    plotBorderWidth: null,
                    plotShadow: false,
                    type: 'pie'
                },
                title: {
                    text: 'Avance de Actas<br> <b>2023</b>'
                },
                tooltip: {
                    pointFormat: '{series.name}: <b>{point.percentage:.1f}%-{point.val}</b>'
                },
                accessibility: {
                    point: {
                        valueSuffix: '%'
                    }
                },
                plotOptions: {
                    pie: {
                        allowPointSelect: true,
                        cursor: 'pointer',
                        dataLabels: {
                            enabled: true,
                            format: '<b>{point.name}</b>: {point.percentage:.1f} %',
                            connectorColor: 'silver'
                        }
                    }
                },
                series: [{
                        name: 'Actas',
                        data: [
                            {
                                name: 'Ingresadas-<%= request.getParameter("total_actas_ingresadas")%>',
                                y: <%= request.getParameter("total_actas_ingresadas")%> * 100 /<%= request.getParameter("total_actas")%>,
                                val: <%= request.getParameter("total_actas_ingresadas")%>
                            },
                            {
                                name: 'Restantes-<%= request.getParameter("total_actas_faltantes")%>',
                                y: <%= request.getParameter("total_actas_faltantes")%> * 100 /<%= request.getParameter("total_actas")%>,
                                val: <%= request.getParameter("total_actas_faltantes")%>
                            }
                        ]
                    }]
            });
        </script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://code.jquery.com/jquery-3.6.1.slim.min.js"></script>

    </body>
</html>
