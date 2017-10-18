/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package labroom;

import java.text.SimpleDateFormat;

/**
 *
 * @author User
 */
public class classLabroom {
    private int roomID;
    private String roomName;
    private int status;
    private float width;
    private float length;
    private String datecreate;
    private int maxSize;

    public int getMaxSize() {
        return maxSize;
    }

    public void setMaxSize(int maxSize) {
        this.maxSize = maxSize;
    }
    
    public int getRoomID() {
        return roomID;
    }

    public void setRoomID(int roomID) {
        this.roomID = roomID;
    }

    public String getRoomName() {
        return roomName;
    }

    public void setRoomName(String roomName) {
        this.roomName = roomName;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public float getWidth() {
        return width;
    }

    public void setWidth(float width) {
        this.width = width;
    }

    public float getLength() {
        return length;
    }

    public void setLength(float length) {
        this.length = length;
    }

    public String getDatecreate() {
        return datecreate;
    }

    public void setDatecreate(String datecreate) {
        this.datecreate = datecreate;
    }
    
    public classLabroom(int roomID,String roomName,int status,float width, float length, String datecreate,int maxSize){
        this.roomID=roomID;
        this.roomName=roomName;
        this.status=status;
        this.width=width;
        this.length=length;
        this.datecreate=datecreate;
        this.maxSize = maxSize;
    }

    public classLabroom() {
    }
    
}
