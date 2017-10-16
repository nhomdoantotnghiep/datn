/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package processSchedule;

import computerlabs.dbconnect;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import reporting.CusConvertUtil;

/**
 *
 * @author Tai
 */
public class assignSchedule extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
//        try (PrintWriter out = response.getWriter()) {
//            /* TODO output your page here. You may use following sample code. */
//            out.println("<!DOCTYPE html>");
//            out.println("<html>");
//            out.println("<head>");
//            out.println("<title>Servlet assignSchedule</title>");            
//            out.println("</head>");
//            out.println("<body>");
//            out.println("<h1>Servlet assignSchedule at " + request.getContextPath() + "</h1>");
//            out.println("</body>");
//            out.println("</html>");
//        }
        String txtResultUser = request.getParameter("txtResultUser");
        String chkUser = request.getParameter("chkUser");
        String dateID = request.getParameter("dateID");
        System.out.println("-txtResultUser-" + txtResultUser + "--" + CusConvertUtil.parseDateToStringOfSendDate(new Date()));
        System.out.println("-chkUser-" + chkUser + "--");
        System.out.println("-dateID-" + dateID + "--");
        int count = 0;

        if (txtResultUser != null && txtResultUser.trim().length() > 0) {
            String[] userIDarr = txtResultUser.split("/");
            if (userIDarr != null && userIDarr.length > 0) {
                int temp = deleteWorkingShift(dateID);
                if (temp > 0) {//delete het
                    for (String user : userIDarr) {
                        int temp2 = createWorkingShift(user, dateID);
                        if(temp2 > 0){
                            count = count + 1;
                        }
                    }
                }
            }
        }
        if (count > 0) {
            out.println("<div class=\"style-result\">Assign successfull !!!!</div>");
        } else {
            out.println("<div class=\"style-result-fail\">Assign Fail !!!!</div>");
        }
    }

    private int createWorkingShift(String userID, String dateID) {
        Connection cnn = null;
        PreparedStatement pst = null;
        PreparedStatement pstDate = null;
        Statement st = null;
        ResultSet rs = null;
        int uid = Integer.parseInt(userID);
        int did = Integer.parseInt(dateID);
        int out = 0;
        try {

            String sql = "insert into tbl_workingshift(date_id,user_id,status,create_date) values(?,?,1,?)";

            cnn = dbconnect.Connect();
            pst = cnn.prepareStatement(sql);
            pst.setInt(1, did);
            pst.setInt(2, uid);
            pst.setString(3, CusConvertUtil.parseDateToStringOfSendDate(new Date()));
            out = pst.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(assignSchedule.class.getName()).log(Level.SEVERE, null, ex);
        }
        return out;
    }

    private int deleteWorkingShift(String dateID) {
        int did = Integer.parseInt(dateID);
        int out = 0;
        Connection cnn = null;
        Statement st = null;
        String sql = "delete from tbl_workingshift where date_id=" + did;
        cnn = dbconnect.Connect();
        try {
            st = cnn.createStatement();
            int row = st.executeUpdate(sql);
            if (row > 0) {
                out = out + 1;
            }
        } catch (SQLException ex) {
            Logger.getLogger(assignSchedule.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                st.close();
                cnn.close();
            } catch (SQLException ex) {
                Logger.getLogger(assignSchedule.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return out;
    }
    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
