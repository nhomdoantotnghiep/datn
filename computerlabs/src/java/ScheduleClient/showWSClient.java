/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ScheduleClient;

import computerlabs.NewServlet;
import computerlabs.classUser;
import computerlabs.dbconnect;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import processSchedule.checkRequest;
import processSchedule.classSchedule;

/**
 *
 * @author User
 */
public class showWSClient extends HttpServlet {

    static final long serialVersionUID = 1L;
    int offset;
    int length;
    List list;

    protected void doGet(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {

        int maxEntriesPerPage = 6;
        int page = 1;
        
        
        String pageNumberValue = request.getParameter("pageNumber");
        String inputdateTo = "";
        if (request.getParameter("inputdateTo") != null) {
            if (!request.getParameter("inputdateTo").trim().equalsIgnoreCase("")) {
                if (request.getParameter("inputdateTo").matches("(\\d{4})[\\/\\-\\.](0?[1-9]|1[012])[\\/\\-\\.](0?[1-9]|[12][0-9]|3[01])")) {
                    inputdateTo = request.getParameter("inputdateTo");
                    request.setAttribute("inputdateTo", inputdateTo);
                }
            }
        }
        String inputdateFrom = "";
        if (request.getParameter("inputdateFrom") != null) {
            if (!request.getParameter("inputdateFrom").trim().equalsIgnoreCase("")) {
                if (request.getParameter("inputdateFrom").matches("(\\d{4})[\\/\\-\\.](0?[1-9]|1[012])[\\/\\-\\.](0?[1-9]|[12][0-9]|3[01])")) {
                    inputdateFrom = request.getParameter("inputdateFrom");
                    request.setAttribute("inputdateFrom", inputdateFrom);
                }
            }
        }
        int roomid = 1;
        if (request.getParameter("roomid") != null) {
            if (request.getParameter("roomid").equalsIgnoreCase("")) {
                roomid = 1;
            } else {
                roomid = Integer.parseInt(request.getParameter("roomid"));
            }
        }
        int shiftType = 1;
        if (request.getParameter("shiftType") != null) {
            if (request.getParameter("shiftType").equalsIgnoreCase("")) {
                shiftType = 1;
            } else {
                shiftType = Integer.parseInt(request.getParameter("shiftType"));
            }
        }
//        int wuid = -1;
//        if (request.getAttribute("userID") != null) {
//            if (!(request.getAttribute("userID").toString().equalsIgnoreCase(""))) {
//                wuid = Integer.parseInt(request.getAttribute("userID").toString());
//            } else {
//                wuid = -1;
//            }
//        }
        int userID = 0;
        int wuid = -1;
        HttpSession session=request.getSession();
        if(session.getAttribute("userID")!=null){
            userID=Integer.parseInt(session.getAttribute("userID").toString().trim());
            
        }
        if (request.getParameter("wuid") != null) {
            if (request.getParameter("wuid").equalsIgnoreCase("")) {
                wuid = -1;
            } else {
                wuid = Integer.parseInt(request.getParameter("wuid"));
            }
        }else{
            if(userID > 0){
                wuid = userID;
            }
        }
        System.out.println("--wuid--"+wuid);
        if (pageNumberValue != null) {
            try {
                page = Integer.parseInt(pageNumberValue);
                System.out.println("Page Number:" + page);
            } catch (NumberFormatException e) {
                e.printStackTrace();
            }
        }
        int offset = maxEntriesPerPage * (page - 1);
        TestList(offset, maxEntriesPerPage, roomid, inputdateTo, inputdateFrom,shiftType,wuid);
        
        HttpSession httpSession = request.getSession();
        
        System.out.println("---userID---"+userID+"--WS");
        httpSession.setAttribute("pages", getPages());
        httpSession.setAttribute("userID", userID);
        httpSession.setAttribute("Schedule", getListByOffsetAndLength());

        RequestDispatcher dispatcher = request
                .getRequestDispatcher("/WorkingShift.jsp");  //link
        dispatcher.forward(request, response);
    }

    /* 
     * Hard-coded sample data. Normally this would come from a real data source 
     * such as a database 
     */
    public void fillList(int roomid, String inputdateTo, String inputdateFrom, int shiftType,int wuid) {
        list = new ArrayList();
        Connection cnn = null;
        Statement st = null;
        ResultSet rs = null;

        String sql = "select sche.scheduleID as ID,shift.shiftname as shiftname,lab.roomName as roomName,d.dateword as datework,"
                + " we.keyword as keywork,sche.status as status,sche.dateworkID sdateworkID, we.dayid, shift.shiftID "
                + " from tbl_schedule as sche inner join "
                + " tbl_shiftname as shift on sche.shiftID=shift.shiftID inner "
                + " join tbl_labroom as lab on sche.roomID=lab.roomID inner join "
                + " tbl_datework as d on sche.dateworkID=d.datewordID inner join "
                + " days_week as we on d.dayID=we.dayID "
                //+ " left join tbl_workingshift ws on d.datewordID=ws.date_id"
                + " where 1=1 ";
        if(roomid > 0){
            sql += " and lab.roomID=" + roomid;
        }
        if (inputdateTo.trim().length() > 3) {
            sql += " and d.dateword <='" + inputdateTo + "' ";
        }
        if (inputdateFrom.trim().length() > 3) {
            sql += " and d.dateword >='" + inputdateFrom + "' ";
        }
        if(shiftType > 0){
            sql += " and shift.shiftType =" + shiftType + " ";
        }
        if(wuid > 0){
            //sql+=" and ws.user_id="+wuid+" ";
        }
        sql += " order by d.dateword desc, shift.shiftID asc ";
        System.out.println("--sqlws--"+sql);
        //sql += " order by shift.shiftID,d.dateword desc ";
        //String connectionURL = "jdbc:odbc:sem4";
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
            int dateworkID = 0;
            SimpleDateFormat formarter = new SimpleDateFormat("EE, MMM d,yyyy");
            while (rs.next()) {
                count = count + 1;
                ID += rs.getInt("ID") + "/";
                shiftname += rs.getString("shiftname") + "/";
                //shiftname = rs.getString("shiftname") + "/";
                roomName = rs.getString("roomName");

                datework = formarter.format(rs.getDate("datework"));
                daysweek = rs.getString("keywork");
                status += rs.getString("status") + "/";
                dateworkID = rs.getInt("sdateworkID");
                int hasWS = 1;
                if(wuid > 0){
                    hasWS = checkRequest.checkExistWorkingShift(dateworkID,wuid);
                }
                if(wuid == -1){// no tech
                    hasWS = checkRequest.checkExistWorkingShift(dateworkID,0);
                    if(hasWS > 0){// ngay hom day co tech
                        hasWS = 0;
                    }else{
                        hasWS = 1;
                    }
                    //hasWS = 0;
                }
                        
                int totalShift = cntShiftShow(shiftType);
                if (count % totalShift == 0) {
                    if(hasWS > 0){
                        list.add(new classSchedule(ID, shiftname, roomName, datework, daysweek, status, dateworkID));
                    }
                    ID = "";
                    shiftname = "";
                    status = "";
                    roomName = "";
                    datework = "";
                    daysweek = "";
                }

            }
        } catch (SQLException ex) {
            Logger.getLogger(showWSClient.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    /**
     * @param offset
     * @param length
     */
    public void TestList(int offset, int length, int roomid, String inputdateTo, String inputdateFrom, int shiftType,int wuid) {
        this.offset = offset;
        this.length = length;
        fillList(roomid, inputdateTo, inputdateFrom,shiftType,wuid);
    }

    private int cntShiftShow(int shiftType) {
        Connection cnn = null;
        Statement st = null;
        ResultSet rs = null;
        String sql = "select COUNT(shiftID) as cnt from tbl_shiftname where status = 1 AND shiftType = "+shiftType;
        cnn = dbconnect.Connect();
        try {
            st = cnn.createStatement();
            rs = st.executeQuery(sql);
            if (rs.next()) {
                return rs.getInt("cnt");
            } else {
                return 0;
            }
        } catch (SQLException ex) {
            Logger.getLogger(showWSClient.class.getName()).log(Level.SEVERE, null, ex);
            return 0;
        } finally {
            try {
                rs.close();
                st.close();
                cnn.close();
            } catch (SQLException ex) {
                Logger.getLogger(showWSClient.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    /**
     * @return List
     */
    public ArrayList getListByOffsetAndLength() {

        ArrayList arrayList = new ArrayList();
        int to = this.offset + this.length;
        if (this.offset > list.size()) {
            this.offset = list.size();
        }
        if (to > list.size()) {
            to = list.size();
        }
        for (int i = this.offset; i < to; i++) {
            arrayList.add(list.get(i));
        }
        Collections.reverse(arrayList);// reverse list dao chieu list lan nua
        return arrayList;
    }

    /**
     * @return List with page numbers
     */
    public List getPages() {
        List pageNumbers = new ArrayList();
        int pages = list.size() / this.length;
        if (list.size() % this.length != 0) {
            pages = pages + 1;
        }

        for (int i = 1; i <= pages; i++) {
            pageNumbers.add(new Integer(i));
        }
        return pageNumbers;
    }
}
