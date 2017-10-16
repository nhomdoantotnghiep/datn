/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package processSchedule;

import computerlabs.dbconnect;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author User
 */
public class checkRequest {

    public int checkStatusRequest(int scheID) {
        Connection cnn = null;
        Statement st = null;
        ResultSet rs = null;
        int cntSuc = 0;
        int cntLoad = 0;
        String sql = "select * from tbl_request where scheduleID=" + scheID;
        cnn = dbconnect.Connect();
        try {
            st = cnn.createStatement();
            rs = st.executeQuery(sql);
            while (rs.next()) {
                if (rs.getInt("status") == 2) {
                    cntSuc = cntSuc + 1;
                } else if (rs.getInt("status") == 0) {
                    cntLoad = cntLoad + 1;
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(checkRequest.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                rs.close();
                st.close();
                cnn.close();
            } catch (SQLException ex) {
                Logger.getLogger(checkRequest.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        if (cntSuc > 0) {
            return 2;
        } else if (cntLoad > 0) {
            return 0;
        } else {
            return 10;
        }

    }

    public static int checkExistRequest(int[] scheIDarr) {
        int out = 0;/// 0 thi xoa dc, >0 ko xoa dc
        if (scheIDarr != null && scheIDarr.length > 0) {
            for (int i = 0; i < scheIDarr.length; i++) {
                int request = checkRequest(scheIDarr[i]);
                if (request > 0) {/// co request
                    out = out + 1;
                }
            }
        } else {
            out = 0;
        }
        return out;
    }

    public static int checkExistWorkingShift(int dateId) {
        Connection cnn = null;
        Statement st = null;
        ResultSet rs = null;
        int out = 0;
        String sql = "select * from tbl_workingshift where date_ID=" + dateId;
        cnn = dbconnect.Connect();
        try {
            st = cnn.createStatement();
            rs = st.executeQuery(sql);
            while (rs.next()) {
                out = out + 1;
            }
        } catch (SQLException ex) {
            Logger.getLogger(checkRequest.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                rs.close();
                st.close();
                cnn.close();
            } catch (SQLException ex) {
                Logger.getLogger(checkRequest.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return out;

    }

    public static int checkExistWorkingShift(int dateId, int uid) {
        Connection cnn = null;
        Statement st = null;
        ResultSet rs = null;
        int out = 0;
        String sql = "select * from tbl_workingshift where date_ID=" + dateId + " and user_id=" + uid;
        cnn = dbconnect.Connect();
        try {
            st = cnn.createStatement();
            rs = st.executeQuery(sql);
            if (rs.next()) {
                out = out + 1;
            }
        } catch (SQLException ex) {
            Logger.getLogger(checkRequest.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                rs.close();
                st.close();
                cnn.close();
            } catch (SQLException ex) {
                Logger.getLogger(checkRequest.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return out;

    }

    public static int checkRequest(int scheID) {
        Connection cnn = null;
        Statement st = null;
        ResultSet rs = null;
        int out = 0;
        String sql = "select * from tbl_request where scheduleID=" + scheID;
        cnn = dbconnect.Connect();
        try {
            st = cnn.createStatement();
            rs = st.executeQuery(sql);
            while (rs.next()) {
                out = out + 1;
            }
        } catch (SQLException ex) {
            Logger.getLogger(checkRequest.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                rs.close();
                st.close();
                cnn.close();
            } catch (SQLException ex) {
                Logger.getLogger(checkRequest.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return out;

    }

    public static int[] checkScheByDateID(int dateId) {
        Connection cnn = null;
        Statement st = null;
        ResultSet rs = null;
        int totalRow = checkRowScheByDateID(dateId);
        int[] out = new int[totalRow];
        String sql = "select * from tbl_schedule where dateworkID=" + dateId;
        int count = 0;
        cnn = dbconnect.Connect();
        try {
            st = cnn.createStatement();
            rs = st.executeQuery(sql);
            while (rs.next()) {
                out[count] = rs.getInt("scheduleid");
                count = count + 1;
            }
        } catch (SQLException ex) {
            Logger.getLogger(checkRequest.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                rs.close();
                st.close();
                cnn.close();
            } catch (SQLException ex) {
                Logger.getLogger(checkRequest.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return out;
    }

    public static int checkRowScheByDateID(int dateId) {
        Connection cnn = null;
        Statement st = null;
        ResultSet rs = null;
        int out = 0;

        String sql = "select count(scheduleid) as tt from tbl_schedule where dateworkID=" + dateId;
        cnn = dbconnect.Connect();
        try {
            st = cnn.createStatement();
            rs = st.executeQuery(sql);
            if (rs.next()) {
                out = rs.getInt("tt");
            }
        } catch (SQLException ex) {
            Logger.getLogger(checkRequest.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                rs.close();
                st.close();
                cnn.close();
            } catch (SQLException ex) {
                Logger.getLogger(checkRequest.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return out;

    }

    public static UserModel getListUserByID(int userid) {
        UserModel userModel = null;
        Connection cnn = null;
        Statement st = null;
        ResultSet rs = null;
        String sql = "select * from tbl_user where userID=" + userid;
        sql += " order by userID asc ";
        cnn = dbconnect.Connect();
        try {
            st = cnn.createStatement();
            rs = st.executeQuery(sql);
            if (rs.next()) {
                userModel = new UserModel();
                userModel.setUserId(rs.getInt("userID"));
                userModel.setPassword(rs.getString("password"));
                userModel.setFullName(rs.getString("fullname"));
                userModel.setAddress(rs.getString("address"));
                userModel.setEmail(rs.getString("email"));
                userModel.setGender(rs.getString("gender"));
                userModel.setBirthday(rs.getString("birthday"));
                userModel.setStatus(rs.getInt("status"));
                userModel.setDepartmentId(rs.getInt("departmentid"));
                userModel.setHod(rs.getInt("hod"));

            }
            System.out.println(userModel.getFullName()+"---1111");
        } catch (SQLException ex) {
            Logger.getLogger(checkRequest.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                rs.close();
                st.close();
                cnn.close();
            } catch (SQLException ex) {
                Logger.getLogger(checkRequest.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return userModel;
    }

    public static List<WorkingShift> getListWSByDateID(int dateid) {
        List<WorkingShift> lst = new ArrayList<WorkingShift>();
        Connection cnn = null;
        Statement st = null;
        ResultSet rs = null;
        String sql = "select * from tbl_workingshift where date_ID=" + dateid;

        cnn = dbconnect.Connect();
        try {
            st = cnn.createStatement();
            rs = st.executeQuery(sql);
            while (rs.next()) {
                WorkingShift workingShift = new WorkingShift();
                workingShift.setId(rs.getInt("id"));
                workingShift.setDate_id(rs.getInt("date_id"));
                workingShift.setUser_id(rs.getInt("user_id"));
                workingShift.setStatus(rs.getInt("status"));
                workingShift.setCreate_date(rs.getString("create_date"));
                
                lst.add(workingShift);
            }
            System.out.println("---12----"+lst.size()+" - "+sql);
        } catch (SQLException ex) {
            Logger.getLogger(checkRequest.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                rs.close();
                st.close();
                cnn.close();
            } catch (SQLException ex) {
                Logger.getLogger(checkRequest.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return lst;
    }
}
