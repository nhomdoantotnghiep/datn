/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package processSchedule;

/**
 *
 * @author User
 */
public class classSchedule {
    private String id;  
    private String shiftname;  
    private String roomName;  
    private String dateword;
    private String keyword;
    private String status;
    private int dateworkID;
    private int dayid;
    private int shiftID;

    public int getDateworkID() {
        return dateworkID;
    }

    public void setDateworkID(int dateworkID) {
        this.dateworkID = dateworkID;
    }
    

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getShiftname() {
        return shiftname;
    }

    public void setShiftname(String shiftname) {
        this.shiftname = shiftname;
    }

    public String getRoomName() {
        return roomName;
    }

    public void setRoomName(String roomName) {
        this.roomName = roomName;
    }

    public String getDateword() {
        return dateword;
    }

    public void setDateword(String dateword) {
        this.dateword = dateword;
    }

    public String getKeyword() {
        return keyword;
    }

    public void setKeyword(String keyword) {
        this.keyword = keyword;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public int getDayid() {
        return dayid;
    }

    public void setDayid(int dayid) {
        this.dayid = dayid;
    }

    public int getShiftID() {
        return shiftID;
    }

    public void setShiftID(int shiftID) {
        this.shiftID = shiftID;
    }
    
   
     public classSchedule(String id,String shiftname, String roomName, String dateword,  
            String keyword,String status,int dateworkID) {  
         this.id=id;
         this.shiftname=shiftname;
         this.roomName=roomName;
         this.dateword=dateword;
         this.keyword=keyword;
         this.status=status;
         this.dateworkID=dateworkID;
    }  

    public classSchedule(String id, String shiftname, String roomName, String dateword, String keyword, String status, int dateworkID, int dayid, int shiftID) {
        this.id = id;
        this.shiftname = shiftname;
        this.roomName = roomName;
        this.dateword = dateword;
        this.keyword = keyword;
        this.status = status;
        this.dateworkID = dateworkID;
        this.dayid = dayid;
        this.shiftID = shiftID;
    }
     
     
}
