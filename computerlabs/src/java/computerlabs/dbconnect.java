/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package computerlabs;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.sql.*;
import javax.naming.*;

/**
 *
 * @author User
 */
public class dbconnect {
    static Connection cnn;
    public static Connection Connect(){
        try {
            //String connectionURL = "jdbc:odbc:sem4";
            //Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
            //cnn = DriverManager.getConnection(connectionURL, "lab", "");
            

            /* chuoi ket noi cho sql server */
            /*
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            cnn = DriverManager.getConnection("jdbc:sqlserver://localhost:1435;databaseName=sem4labs","lab","");
            */
            
            /* */
            InitialContext ctx = new InitialContext();
            DataSource ds = (DataSource) ctx.lookup("jdbc/computerlabsdatn");
            cnn = ds.getConnection();
            
            /* chuoi ket noi o mysql, laptop lttai*/
        } catch (SQLException ex) {
            Logger.getLogger(dbconnect.class.getName()).log(Level.SEVERE, null, ex);
        } catch (NamingException ex) {
            Logger.getLogger(dbconnect.class.getName()).log(Level.SEVERE, null, ex);
        } 
        return cnn;
    }
    public static void Disconnect(Connection cnn){
        try {
            cnn.close();
        } catch (SQLException ex) {
            Logger.getLogger(dbconnect.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
