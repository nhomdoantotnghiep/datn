
package reporting.timeTable;

import ScheduleClient.showScheClient;
import computerlabs.dbconnect;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import processSchedule.checkRequest;
import processSchedule.classSchedule;
import processSchedule.totalRequestByScheID;



public class TimeTableExport {
        
	public static TimeTableModel getModel(HashMap<String, Object> hashMap){
            String type = (String)hashMap.get("type");
            String duoiFile = (String) hashMap.get("duoiFile");
            String from = (String)hashMap.get("from");
            String to = (String)hashMap.get("to");
            String lab = (String)hashMap.get("lab");
            System.out.println("TimeTableExport-getModel-type:"+type);
            System.out.println("duoiFile:"+duoiFile);
            System.out.println("from:"+from);
            System.out.println("to:"+to);
            System.out.println("lab:"+lab);
            
            TimeTableModel result = new TimeTableModel();
            int roomid = lab != null ? Integer.parseInt(lab) : 1;
            String labName = lab != null ? getRoomNameById(lab) : "";
//            String from = "";
//            String to = "";
            List<TimeTableModel.ShiftLst> shiftLst = null;
            List<TimeTableModel.ShiftLst> shiftLstTable = null;
            
            shiftLst = new ArrayList<TimeTableModel.ShiftLst>();
            shiftLst = getListShift();
            if(shiftLst != null){
                System.out.println("-shiftLst-"+shiftLst.size());
            }else{
                System.out.println("-shiftLst-NULL");
            }
            
            List lst = fillList(roomid, to, from);
            
            shiftLstTable = new ArrayList<TimeTableModel.ShiftLst>();
            if(lst != null && lst.size() > 0){
                System.out.println("-lst-lst.siez"+lst.size());
                Collections.reverse(lst);// reverse list dao chieu list lan nua
                int cell = 0;
                for (int i = (lst.size() - 1); i >= 0; i--) {
                    String dateName = "";
                    String shift1 = "";
                    String shift2 = "";
                    String shift3 = "";
                    String shift4 = "";
                    String shift5 = "";
                    String shift6 = "";
                    String shift7 = "";
                    String shift8 = "";
                    String shift9 = "";
                    String shift10 = "";
                    String shift11 = "";
                    String shift12 = "";
                    String shift13 = "";
                    String shift14 = "";
                    String shift15 = "";
                    String shift16 = "";
                    String DateW = "";
                    cell = cell + 1;
                    TimeTableModel.ShiftLst model = result.new ShiftLst();
                    classSchedule studentDetailsDTO = (classSchedule) lst.get(i);
                    String[] strGetStatus = studentDetailsDTO.getStatus().split("/");
                    String[] strGetID = studentDetailsDTO.getId().split("/");
                    
                    dateName = studentDetailsDTO.getKeyword();
                    for (int j = 0; j <= (strGetStatus.length - 1); j++) {//0-15
                        String status = "";
                        if (Integer.parseInt(strGetStatus[j].trim()) == 1) {// co hoat dong
//                            if (check.checkStatusRequest(Integer.parseInt(strGetID[j])) == 2) {
//                                out.println("<td style='background: #bbff84;height:30px' align=\"center\"><img src=\"img/available.png\" /></td>");
//                            } else if (check.checkStatusRequest(Integer.parseInt(strGetID[j])) == 0) {
//                                out.println("<td style='background: #fffdc1;height:30px' align=\"center\"><a title=\"Total Request: " + totalRq.total(Integer.parseInt(strGetID[j])) + "\" href=\"?option=sendRequest&sid=" + strGetID[j] + "\"><img src=\"img/available.png\" /></a></td>");
//                            } else {
//                                out.println("<td style='background: #ececec;height:30px' align=\"center\"><a title=\"Total Request: " + totalRq.total(Integer.parseInt(strGetID[j])) + "\" href=\"?option=sendRequest&sid=" + strGetID[j] + "\"><img src=\"img/available.png\" /></a></td>");
//                            }
                            status = "O";
                        } else if (Integer.parseInt(strGetStatus[j].trim()) == 0) {// ko hoat dong
                            //out.println("<td style='background: #ffe6e6;height:30px' align=\"center\"><img src=\"img/not-available.png\" /></td>");
                            status = "X";
                        } else if (Integer.parseInt(strGetStatus[j].trim()) == 2) {// da lam sao do
                            //out.println("<td style='background: #efffc7;height:30px' align=\"center\"></td>");
                        }
                        if(j == 0){
                            shift1 = status;
                        }
                        if(j == 1){
                            shift2 = status;
                        }
                        if(j == 2){
                            shift3 = status;
                        }
                        if(j == 3){
                            shift4 = status;
                        }
                        if(j == 4){
                            shift5 = status;
                        }
                        if(j == 5){
                            shift6 = status;
                        }
                        if(j == 6){
                            shift7 = status;
                        }
                        if(j == 7){
                            shift8 = status;
                        }
                        if(j == 8){
                            shift9 = status;
                        }
                        if(j == 9){
                            shift10 = status;
                        }
                        if(j == 10){
                            shift11 = status;
                        }
                        if(j == 11){
                            shift12 = status;
                        }
                        if(j == 12){
                            shift13 = status;
                        }
                        if(j == 13){
                            shift14 = status;
                        }
                        if(j == 14){
                            shift15 = status;
                        }
                        if(j == 15){
                            shift16 = status;
                        }
                        
                    }
                    
                    DateW = studentDetailsDTO.getDateword();
                    
                    model.setDateName(dateName);
                    model.setShift1(shift1);
                    model.setShift2(shift2);
                    model.setShift3(shift3);
                    model.setShift4(shift4);
                    model.setShift5(shift5);
                    model.setShift6(shift6);
                    model.setShift7(shift7);
                    model.setShift8(shift8);
                    model.setShift9(shift9);
                    model.setShift10(shift10);
                    model.setShift11(shift11);
                    model.setShift12(shift12);
                    model.setShift13(shift13);
                    model.setShift14(shift14);
                    model.setShift15(shift15);
                    model.setShift16(shift16);
                    model.setDateW(DateW);
                    
                    shiftLstTable.add(model);
                    
                }
            }
            
            result.setLabName(labName);
            result.setFrom(from);
            result.setTo(to);
            result.setShiftLst(shiftLst);
            result.setShiftLstTable(shiftLstTable);
            return result;
        }
        private static String getRoomNameById(String roomid){
            int id = Integer.parseInt(roomid);
            Connection cnn=null;
            Statement st=null;
            ResultSet rs=null;
            String sql="select * from tbl_labroom where roomID="+id;
            cnn=dbconnect.Connect();
            try {
                st=cnn.createStatement();
                rs=st.executeQuery(sql);
                if(rs.next()){
                    return rs.getString("roomName");
                }else{
                    return "";
                }
            } catch (SQLException ex) {
                Logger.getLogger(TimeTableExport.class.getName()).log(Level.SEVERE, null, ex);
                return "";
            }finally{
               try {
                   rs.close();
                   st.close();
                   cnn.close();
               } catch (SQLException ex) {
                   Logger.getLogger(TimeTableExport.class.getName()).log(Level.SEVERE, null, ex);
               }
           }
        }
	private static List fillList(int roomid,String inputdateTo,String inputdateFrom) {
            List list = new ArrayList();
            Connection cnn = null;
            Statement st = null;
            ResultSet rs = null;

            String sql = "select sche.scheduleID as ID,shift.shiftname as shiftname,lab.roomName as roomName,d.dateword as datework,"
                    + " we.keyword as keywork,sche.status as status,sche.dateworkID sdateworkID, we.dayid, shift.shiftID"
                    + " from tbl_schedule as sche inner join "
                    + " tbl_shiftname as shift on sche.shiftID=shift.shiftID inner "
                    + " join tbl_labroom as lab on sche.roomID=lab.roomID inner join "
                    + " tbl_datework as d on sche.dateworkID=d.datewordID inner join "
                    + " days_week as we on d.dayID=we.dayID where 1=1 ";
            if(roomid > 0){
                sql += " and lab.roomID="+roomid+" ";
            }        
                    //+ "and d.dateword >='"+outPutDateSelect()+"'";
            if (inputdateTo.trim().length() > 3) {
                sql += " and d.dateword <='" + inputdateTo + "'";
            }
            if (inputdateFrom.trim().length() > 3) {
                sql += " and d.dateword >='" + inputdateFrom + "'";
            }
    //        if(shiftType > 0){
    //            sql += " and shift.shiftType =" + shiftType + " ";
    //        }
            sql+=" order by d.dateword desc, shift.shiftID asc ";
            //String connectionURL = "jdbc:odbc:sem4";
            System.out.println("--sqlreport--"+sql);
            try {
                //Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
                //cnn = DriverManager.getConnection(connectionURL, "lab", "");
                cnn = dbconnect.Connect();
                st = cnn.createStatement();
                rs = st.executeQuery(sql);
                int count = 0;
                String ID = "";
                String shiftname = "";
                String status = "";
                String roomName = "";
                String datework = "";
                String daysweek = "";
                int dateworkID=0;
                SimpleDateFormat formarter=new SimpleDateFormat("EE, MMM d,yyyy");
                while (rs.next()) {
                    count = count + 1;
                    ID += rs.getInt("ID") + "/";
                    shiftname += rs.getString("shiftname") + "/";
                    roomName = rs.getString("roomName");

                    datework = formarter.format(rs.getDate("datework"));
                    daysweek = rs.getString("keywork");
                    status += rs.getString("status") + "/";
                    dateworkID = rs.getInt("sdateworkID");
                    int totalShift=cntShiftShow();
                    if (count % totalShift == 0) {
                        list.add(new classSchedule(ID, shiftname, roomName, datework, daysweek, status,dateworkID));
                        ID = "";
                        shiftname = "";
                        status = "";
                        roomName = "";
                        datework = "";
                        daysweek = "";
                    }

                }
            } catch (SQLException ex) {
                Logger.getLogger(TimeTableExport.class.getName()).log(Level.SEVERE, null, ex);
            }
            return list;
        }
        private static int cntShiftShow(){
            Connection cnn=null;
            Statement st=null;
            ResultSet rs=null;
            String sql="select COUNT(shiftID) as cnt from tbl_shiftname where status = 1 ";
            cnn=dbconnect.Connect();
             try {
                 st=cnn.createStatement();
                 rs=st.executeQuery(sql);
                 if(rs.next()){
                     return rs.getInt("cnt");
                 }else{
                     return 0;
                 }
             } catch (SQLException ex) {
                 Logger.getLogger(showScheClient.class.getName()).log(Level.SEVERE, null, ex);
                 return 0;
             }finally{
                try {
                    rs.close();
                    st.close();
                    cnn.close();
                } catch (SQLException ex) {
                    Logger.getLogger(showScheClient.class.getName()).log(Level.SEVERE, null, ex);
                }
             }
        }
        private static List<TimeTableModel.ShiftLst> getListShift(){
            List<TimeTableModel.ShiftLst> lst = new ArrayList<TimeTableModel.ShiftLst>();
            List<String> lstTemp = new ArrayList<String>();
            TimeTableModel result = new TimeTableModel();
            Connection cnn2 = null;
                Statement st2 = null;
                ResultSet rs2 = null;
                String sql2 = "select * from tbl_shiftname where status=1 ";
                cnn2 = dbconnect.Connect();
                try {
                    st2 = cnn2.createStatement();
                    rs2 = st2.executeQuery(sql2);
                    while (rs2.next()) {
                        String shiftName = rs2.getString("shiftname");
                        lstTemp.add(shiftName);
//                        TimeTableModel.ShiftLst model = result.new ShiftLst();
//                        
//                        model.
                    }
                } catch (Exception ex3) {

                } finally {
                    try {
                        rs2.close();
                        st2.close();
                        cnn2.close();
                    } catch (Exception ex4) {

                    }
                }
                if(lstTemp != null && lstTemp.size() > 0){
                    TimeTableModel.ShiftLst model = result.new ShiftLst();
                    model.setShift1(lstTemp.get(0));
                    model.setShift2(lstTemp.get(1));
                    model.setShift3(lstTemp.get(2));
                    model.setShift4(lstTemp.get(3));
                    model.setShift5(lstTemp.get(4));
                    model.setShift6(lstTemp.get(5));
                    model.setShift7(lstTemp.get(6));
                    model.setShift8(lstTemp.get(7));
                    model.setShift9(lstTemp.get(8));
                    model.setShift10(lstTemp.get(9));
                    model.setShift11(lstTemp.get(10));
                    model.setShift12(lstTemp.get(11));
                    model.setShift13(lstTemp.get(12));
                    model.setShift14(lstTemp.get(13));
                    model.setShift15(lstTemp.get(14));
                    model.setShift16(lstTemp.get(15));
                    lst.add(model);
                }
            return lst;
        }
}
