/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package computerlabs;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author User
 */
public class updateStatusAccount extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        int userID = 0;
        int statusUser = 0;
        String addressStr = "";
        String fullNameStr = "";
        String emailStr = "";
        String username ="";
        try {
            userID = Integer.parseInt(request.getParameter("ID").toString().trim());
            String nameStatus = "statusUser" + userID;
            
            username = request.getParameter("usernameU"+userID);
            
            statusUser = Integer.parseInt(request.getParameter(nameStatus));
            String address = "addressU" + userID;
            addressStr = request.getParameter(address);
//            String nameHOD = "HOD" + userID;
//            HOD = Integer.parseInt(request.getParameter(nameHOD));
            String fullName = "txtUFullName" + userID;
            fullNameStr = request.getParameter(fullName);
            String email = "txtUEmail" + userID;
            emailStr = request.getParameter(email);
        } catch (Exception ex1) {

        }
        boolean check = true;
        int fail = 0;
        if(!(addressStr != null && addressStr.trim().length() > 0)){
            fail = fail+1;
        }
        if(!(fullNameStr != null && fullNameStr.trim().length() > 0)){
            fail = fail+1;
        }
        if(!(emailStr != null && emailStr.trim().length() > 0)){
            fail = fail+1;
        }
        if(fail > 0){
            check = false;
        }
        if(check){
            Connection cnn = dbconnect.Connect();
            PreparedStatement pst = null;
            String sql = "update tbl_user set [status]=?,address=?,fullname=?,email=? where userID=?";
            try {
                pst = cnn.prepareStatement(sql);
                pst.setInt(1, statusUser);
                pst.setString(2, addressStr);
                pst.setString(3, fullNameStr);
                pst.setString(4, emailStr);
                pst.setInt(5, userID);
                int row = pst.executeUpdate();
                if (row > 0) {

                    out.println("<div class=\"style-result\">Update Successfull - User name: "+username+" !</div>");

                } else {
                    out.println("<div class=\"style-result-fail\">Update fail - User name: "+username+" !</div>");
                }
            } catch (SQLException ex) {
                Logger.getLogger(updateStatusAccount.class.getName()).log(Level.SEVERE, null, ex);
            } finally {
                try {
                    pst.close();
                    cnn.close();
                } catch (SQLException ex) {
                    Logger.getLogger(updateStatusAccount.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }else{
            out.println("<div class=\"style-result-fail\">Validate your input - User name: "+username+" !</div>");
        }
        
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
