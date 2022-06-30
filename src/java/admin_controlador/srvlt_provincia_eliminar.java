
package admin_controlador;

import herramientas.conexion;
import admin.CprovinciaDB;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
/**
 *
 * @author Generador V1.0
 */
public class srvlt_provincia_eliminar extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        try {
           CprovinciaDB OBJ = new CprovinciaDB();
           if(OBJ.Eliminar_Id(Integer.parseInt(request.getParameter("txt_cne_cod_prov").toString()))){

                    response.sendRedirect("admin_controlador.srvlt_provincia_listar_todos?men=REGISTRO ELIMINADO CON EXITO");
            }else{

                    response.sendRedirect("admin_controlador.srvlt_provincia_listar_todos?men=ERROR NO SE PUDO ELIMINAR EL REGISTRO");
            }
        } finally {            
            out.close();
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}