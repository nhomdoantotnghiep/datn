/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package device;

/**
 *
 * @author User
 */
public class classDevice {

    private int dID;
    private String dName;
    private String cateName;
    private String wTo;
    private String wFrom;
    private String dateAdd;
    private String status;

    
    public int getdID() {
        return dID;
    }

    public void setdID(int dID) {
        this.dID = dID;
    }

    public String getdName() {
        return dName;
    }

    public void setdName(String dName) {
        this.dName = dName;
    }


    public String getCateName() {
        return cateName;
    }

    public void setCateName(String cateName) {
        this.cateName = cateName;
    }
    public String getwTo() {
        return wTo;
    }

    public void setwTo(String wTo) {
        this.wTo = wTo;
    }

    public String getwFrom() {
        return wFrom;
    }

    public void setwFrom(String wFrom) {
        this.wFrom = wFrom;
    }

    public String getDateAdd() {
        return dateAdd;
    }

    public void setDateAdd(String dateAdd) {
        this.dateAdd = dateAdd;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
    public classDevice(int dID,String dName,String cateName,String wTo,String wFrom,String dateAdd,int status){
        this.dID=dID;
        this.dName=dName;
        this.cateName=cateName;
        this.wTo=wTo;
        this.wFrom=wFrom;
        this.dateAdd=dateAdd;
        if(status==1){
            this.status="Show";
        }else{
            this.status="Hide";
        }
    }
}
