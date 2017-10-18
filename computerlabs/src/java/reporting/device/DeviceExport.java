/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package reporting.device;


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
public class DeviceExport {

    public static DeviceModel getModel(HashMap<String, Object> hashMap) {
        System.out.println("-DeviceModel11-");
        String lidStr = (String)hashMap.get("lab") ;
        int lid = Integer.parseInt(lidStr);
        
        System.out.println("-DeviceModel-"+lidStr+"==");
        DeviceModel result = new DeviceModel();
        System.out.println("DeviceModel1");
        String labRoom = "";
        List<DeviceModel.DeviceModelList> lst = null;
        
        
        if(lid > 0){
            classLabroom labroom = getLabById(lid);
            labRoom = labroom.getRoomName();
        }
        System.out.println("DeviceModel2");
        List<DeviceDBModel> lstDB = getListRP(lid);
        lst = new ArrayList<DeviceModel.DeviceModelList>();
        if(lstDB != null && lstDB.size() > 0){
            for(DeviceDBModel item : lstDB){
                DeviceModel.DeviceModelList deviceModelList = result.new DeviceModelList();
                int labid = 0;
                String lab = "";
                String dName = "";
                int did = 0;
                String from = "";
                String to = "";
                int aid = 0;
                String aName = "";
                
                labid = item.getLid();
                lab = item.getRname();
                dName = item.getDname();
                did = item.getDid();
                from = item.getDfrom();
                to = item.getDto();
                aid = item.getAid();
                aName = item.getAname();
                
                deviceModelList.setLabid(labid);
                deviceModelList.setLab(lab);
                deviceModelList.setdName(dName);
                deviceModelList.setDid(did);
                deviceModelList.setFrom(from);
                deviceModelList.setTo(to);
                deviceModelList.setAid(aid);
                deviceModelList.setaName(aName);
                lst.add(deviceModelList);
            }
        }
        
        //List<DeviceDBModel> lstDeviceDBModels = getListRP(lid);
        result.setLabRoom(labRoom);
        result.setLst(lst);
        System.out.println("DeviceModel3-"+lst.size());
        return result;
    }

    private static List<DeviceDBModel> getListRP(int lid) {
        List<DeviceDBModel> lst = new ArrayList<DeviceDBModel>();

        Connection cnn = null;
        Statement st = null;
        ResultSet rs = null;

        String sql = "select l.roomID lid,l.roomName rname, "
                + " d.dID did, d.dName dname,d.warranty_from dfrom,d.warranty_to dto,"
                + " a.accessID aid,a.accessName aname"
                + " from tbl_labroom l "
                + " join tbl_device d on l.roomID=d.roomID "
                + " join tbl_device_accessory da on d.dID = da.dID "
                + " join tbl_accessory a on da.accessID=a.accessID "
                + " where 1=1 ";
        if(lid > 0){
            sql += " and d.roomID = "+lid+" ";
        }
        sql += " ORDER BY l.roomID,d.dID,a.accessID asc ";
        try {
            
            cnn = dbconnect.Connect();
            st = cnn.createStatement();
            rs = st.executeQuery(sql);
            while (rs.next()) {
                DeviceDBModel deviceDBModel = new DeviceDBModel();
                deviceDBModel.setLid(rs.getInt("lid"));
                deviceDBModel.setRname(rs.getString("rname"));
                deviceDBModel.setDid(rs.getInt("did"));
                deviceDBModel.setDname(rs.getString("dname"));
                deviceDBModel.setDfrom(rs.getString("dfrom"));
                deviceDBModel.setDto(rs.getString("dto"));
                deviceDBModel.setAid(rs.getInt("aid"));
                deviceDBModel.setAname(rs.getString("aname"));
                lst.add(deviceDBModel);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DeviceExport.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
            try {
                rs.close();
                st.close();
                cnn.close();
            } catch (SQLException ex) {
                Logger.getLogger(DeviceExport.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(DeviceExport.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
            try {
                rs.close();
                st.close();
                cnn.close();
            } catch (SQLException ex) {
                Logger.getLogger(DeviceExport.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        
        return model;
    }

}
