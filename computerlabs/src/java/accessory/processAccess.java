/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package accessory;

import computerlabs.CheckUsername;
import computerlabs.dbconnect;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
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
public class processAccess extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String act = "";
        int id = 0;
        if (request.getParameter("ID") != null) {
            id = Integer.parseInt(request.getParameter("ID").toString().trim());
        }
        if (request.getParameter("act") != null) {
            act = request.getParameter("act").toString().trim();
        }
        if (act.equalsIgnoreCase("delete")) {
            if (checkExits(id) == 1) {
                out.println("<div class=\"style-result-fail\">Can not delete accessory. Update status hide!</div>");
            } else {
                if (deleteAccess(id) == 1) {
                    out.println("<div class=\"style-result-fail\">Delete successfull!</div>");
                } else {
                    out.println("<div class=\"style-result-fail\">Delete fail!</div>");
                }
            }
        } else if (act.equalsIgnoreCase("update")) {
            String accessNameUp = "";
            int typeName = 0;
            int status = 0;
            if (request.getParameter("accessNameUp") != null) {
                accessNameUp = request.getParameter("accessNameUp").toString().trim();
            }
            if (request.getParameter("typeNameUp") != null) {
                typeName = Integer.parseInt(request.getParameter("typeNameUp").toString().trim());
            }
            if (request.getParameter("statusUp") != null) {
                status = Integer.parseInt(request.getParameter("statusUp").toString().trim());
            }
            int existAcc = checkExitsAccess(id);
            System.out.println("--existAcc---"+existAcc);
            if (existAcc > 0) {// neu nh da co trong device
                int currentAccType = getCurrentAccessType(id);
                System.out.println("-currentAccType-"+currentAccType);
                System.out.println("-typeName-"+typeName);
                if (Integer.parseInt(request.getParameter("typeNameUp").toString().trim()) == currentAccType) {// neu type ko thay doi
                    if (updateInfo(id, accessNameUp, typeName, status) == 1) {
                        out.println("<div class=\"style-result\">Update successfull!</div>");
                    } else {
                        out.println("<div class=\"style-result-fail\">Update fail!</div>");
                    }
                } else {/// type thay doi

                    out.println("<div class=\"style-result-fail\">Update fail! This Accessory currently in devices</div>");
                       
                }
            } else {
                CheckUsername check = new CheckUsername();
                int result = check.checkUsername(accessNameUp, "tbl_accessory", "accessName", " and accessID!=" + id);
                if (result == 0) {
                    if (updateInfo(id, accessNameUp, typeName, status) == 1) {
                        out.println("<div class=\"style-result\">Update successfull!</div>");
                    } else {
                        out.println("<div class=\"style-result-fail\">Update fail!</div>");
                    }
                } else if (result == 1) {
                    out.println("<div class=\"style-result-fail\">Accessory Name is not valid!</div>");
                }
            }

        } else if (act.equalsIgnoreCase("create")) {
            String accessName = "";
            int status = 0;
            int typeName = 0;
            if (request.getParameter("namecreate") != null) {
                accessName = request.getParameter("namecreate").toString().trim();
            }
            if (request.getParameter("typeNameCreate") != null) {
                typeName = Integer.parseInt(request.getParameter("typeNameCreate").toString().trim());
            }
            if (request.getParameter("statusCreate") != null) {
                status = Integer.parseInt(request.getParameter("statusCreate").toString().trim());
            }
            CheckUsername check = new CheckUsername();
            int result = check.checkUsername(accessName, "tbl_accessory", "accessName", "");
            if (result == 0) {
                if (createAccess(typeName, accessName, status) == 1) {
                    out.println("<div class=\"style-result-fail\">Create successfull!</div>");
                } else {
                    out.println("<div class=\"style-result-fail\">Create fail!</div>");
                }
            } else if (result == 1) {
                out.println("<div class=\"style-result-fail\">Category Name is not valid!</div>");
            }

        }
    }

    private int deleteAccess(int accessID) {
        Connection cnn = null;
        Statement st = null;
        String sql = "delete from tbl_accessory where accessID=" + accessID;
        cnn = dbconnect.Connect();
        try {
            st = cnn.createStatement();
            int row = st.executeUpdate(sql);
            if (row > 0) {
                return 1;

            } else {
                return 0;
            }
        } catch (SQLException ex) {
            Logger.getLogger(processAccess.class.getName()).log(Level.SEVERE, null, ex);
            return 0;
        } finally {
            try {
                st.close();
                cnn.close();
            } catch (SQLException ex) {
                Logger.getLogger(processAccess.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

    }

    private int updateInfo(int accessID, String accessName, int typeName, int status) {
        Connection cnn = null;
        Statement st = null;
        String sql = "update tbl_accessory set typeID=" + typeName + ",accessName='" + accessName + "',status=" + status + " where accessID=" + accessID;
        cnn = dbconnect.Connect();
        try {
            st = cnn.createStatement();
            int row = st.executeUpdate(sql);
            if (row > 0) {
                return 1;

            } else {
                return 0;
            }
        } catch (SQLException ex) {
            Logger.getLogger(processAccess.class.getName()).log(Level.SEVERE, null, ex);
            return 0;
        } finally {
            try {
                st.close();
                cnn.close();
            } catch (SQLException ex) {
                Logger.getLogger(processAccess.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

    }

    private int updateStatusHide(int accessID) {
        Connection cnn = null;
        Statement st = null;
        String sql = "update tbl_accessory set status=0 where accessID=" + accessID;
        cnn = dbconnect.Connect();
        try {
            st = cnn.createStatement();
            int row = st.executeUpdate(sql);
            if (row > 0) {
                return 1;

            } else {
                return 0;
            }
        } catch (SQLException ex) {
            Logger.getLogger(processAccess.class.getName()).log(Level.SEVERE, null, ex);
            return 0;
        } finally {
            try {
                st.close();
                cnn.close();
            } catch (SQLException ex) {
                Logger.getLogger(processAccess.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

    }

    private int createAccess(int typeName, String accessName, int status) {
        Connection cnn = null;
        Statement st = null;
        String sql = "insert into tbl_accessory values(" + typeName + ",'" + accessName + "'," + status + ")";
        cnn = dbconnect.Connect();
        try {
            st = cnn.createStatement();
            int row = st.executeUpdate(sql);
            if (row > 0) {
                return 1;

            } else {
                return 0;
            }
        } catch (SQLException ex) {
            Logger.getLogger(processAccess.class.getName()).log(Level.SEVERE, null, ex);
            return 0;
        } finally {
            try {
                st.close();
                cnn.close();
            } catch (SQLException ex) {
                Logger.getLogger(processAccess.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

    }

    private int checkExits(int accessID) {
        Connection cnn = null;
        Statement st = null;
        ResultSet rs = null;
        int cnt = 0;
        String sql = "select * from tbl_device_accessory where accessID=" + accessID;
        cnn = dbconnect.Connect();
        try {
            st = cnn.createStatement();
            rs = st.executeQuery(sql);
            while (rs.next()) {
                cnt = cnt + 1;
            }
            if (cnt > 0) {
                if (updateStatusHide(accessID) == 1) {
                    return 1;
                } else {
                    return 0;
                }
            } else {
                return 0;
            }
        } catch (SQLException ex) {
            Logger.getLogger(processAccess.class.getName()).log(Level.SEVERE, null, ex);
            return 0;
        } finally {
            try {
                rs.close();
                st.close();
                cnn.close();
            } catch (SQLException ex) {
                Logger.getLogger(processAccess.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

    }

    private int checkExitsAccess(int accessID) {
        Connection cnn = null;
        Statement st = null;
        ResultSet rs = null;
        int cnt = 0;
        String sql = "select * from tbl_device_accessory where accessID=" + accessID;
        cnn = dbconnect.Connect();
        try {
            st = cnn.createStatement();
            rs = st.executeQuery(sql);
            while (rs.next()) {
                cnt = cnt + 1;
            }

        } catch (SQLException ex) {
            Logger.getLogger(processAccess.class.getName()).log(Level.SEVERE, null, ex);

        } finally {
            try {
                rs.close();
                st.close();
                cnn.close();
            } catch (SQLException ex) {
                Logger.getLogger(processAccess.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return cnt;
    }

    private int getCurrentAccessType(int accessID) {
        Connection cnn = null;
        Statement st = null;
        ResultSet rs = null;
        int out = 0;
        String sql = "select * from tbl_accessory where accessID=" + accessID;
        cnn = dbconnect.Connect();
        try {
            st = cnn.createStatement();
            rs = st.executeQuery(sql);
            if (rs.next()) {
                out = rs.getInt("typeID");
            }

        } catch (SQLException ex) {
            Logger.getLogger(processAccess.class.getName()).log(Level.SEVERE, null, ex);

        } finally {
            try {
                rs.close();
                st.close();
                cnn.close();
            } catch (SQLException ex) {
                Logger.getLogger(processAccess.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return out;
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
