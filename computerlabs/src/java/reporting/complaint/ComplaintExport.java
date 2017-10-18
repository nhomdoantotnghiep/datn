/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package reporting.complaint;



import computerlabs.dbconnect;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import labroom.classLabroom;


/**
 *
 * @author Tai
 */
public class ComplaintExport {

    public static ComplaintModel getModel(HashMap<String, Object> hashMap) {
        System.out.println("-ComplaintExport-");
        
        
        
        ComplaintModel result = new ComplaintModel();
        List<ComplaintModel.ComplaintModelList> lst = null;
        
        
        
        
        
        lst = getListRP(0);
        if(lst != null && lst.size()>0){
            for(ComplaintModel.ComplaintModelList item : lst){
                String labRoom = "";
                 if(item.getLabid() > 0){
                    classLabroom labroom = getLabById(item.getLabid());
                    labRoom = labroom.getRoomName();
                }
                int total = getTotalComplaint(item.getDid());
                item.setLabName(labRoom);
                item.setTotalComp(total);
            }
        }
        
        result.setLst(lst);
        System.out.println("complaint-"+lst.size());
        return result;
    }

    private static List<ComplaintModel.ComplaintModelList> getListRP(int lid) {
        List<ComplaintModel.ComplaintModelList> lst = new ArrayList<ComplaintModel.ComplaintModelList>();
        ComplaintModel cm = new ComplaintModel();
        Connection cnn = null;
        Statement st = null;
        ResultSet rs = null;

        String sql = " select d.dID did,d.dName dname,d.warranty_from dfrom,d.warranty_to dto,d.roomID lid "
                + " from tbl_device d join tbl_complaint_device cd on d.dID=cd.dID "
                + " where 1=1 ";
        if(lid > 0){
            sql += " and d.roomID = "+lid+" ";
        }
        sql += " group by d.dID,d.dName,d.warranty_from,d.warranty_to ,d.roomID ";
        sql += " ORDER by d.roomid,d.did asc";
        try {
            
            cnn = dbconnect.Connect();
            st = cnn.createStatement();
            rs = st.executeQuery(sql);
            while (rs.next()) {
                ComplaintModel.ComplaintModelList cml = cm.new ComplaintModelList();
                cml.setDid(rs.getInt("did"));
                cml.setdName(rs.getString("dname"));
                cml.setFrom(rs.getString("dfrom"));
                cml.setTo(rs.getString("dto"));
                cml.setLabid(rs.getInt("lid"));
                
                lst.add(cml);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ComplaintExport.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
            try {
                rs.close();
                st.close();
                cnn.close();
            } catch (SQLException ex) {
                Logger.getLogger(ComplaintExport.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

        return lst;
    }
    private static classLabroom getLabById(int lid){
        classLabroom model = null;
        Connection cnn = null;
        Statement st = null;
        ResultSet rs = null;

        String sql = "select * from tbl_labroom "
                + " where 1=1 ";
        if(lid > 0){
            sql += " and roomID = "+lid+" ";
        }
        
        try {
            
            cnn = dbconnect.Connect();
            st = cnn.createStatement();
            rs = st.executeQuery(sql);
            if (rs.next()) {
                model = new classLabroom();
                model.setRoomID(rs.getInt("roomID"));
                model.setRoomName(rs.getString("roomName"));
                model.setStatus(rs.getInt(rs.getInt("status")));
                model.setWidth(rs.getFloat("width"));
                model.setLength(rs.getFloat("length"));
                model.setDatecreate(rs.getString("datecreate"));
                model.setMaxSize(rs.getInt("size"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(ComplaintExport.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
            try {
                rs.close();
                st.close();
                cnn.close();
            } catch (SQLException ex) {
                Logger.getLogger(ComplaintExport.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        
        return model;
    }
    
     private static int getTotalComplaint(int id){
        int out = 0;
        Connection cnn = null;
        Statement st = null;
        ResultSet rs = null;

        String sql = " select count(*) tcomp from tbl_complaint_device "
                + " where 1=1 ";
        if(id > 0){
            sql += " and dID = "+id+" ";
        }
        
        try {
            
            cnn = dbconnect.Connect();
            st = cnn.createStatement();
            rs = st.executeQuery(sql);
            if (rs.next()) {
                out = rs.getInt("tcomp");
            }
        } catch (SQLException ex) {
            Logger.getLogger(ComplaintExport.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
            try {
                rs.close();
                st.close();
                cnn.close();
            } catch (SQLException ex) {
                Logger.getLogger(ComplaintExport.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        
        return out;
    }

}
