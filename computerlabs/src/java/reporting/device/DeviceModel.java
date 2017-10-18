/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package reporting.device;

import java.util.List;

/**
 *
 * @author Tai
 */
public class DeviceModel {
    private String labRoom;
    private List<DeviceModelList> lst;

    public String getLabRoom() {
        return labRoom;
    }

    public void setLabRoom(String labRoom) {
        this.labRoom = labRoom;
    }

    public List<DeviceModelList> getLst() {
        return lst;
    }

    public void setLst(List<DeviceModelList> lst) {
        this.lst = lst;
    }
    
    public class DeviceModelList{
        private int labid;
        private String lab;
        private String dName;
        private int did;
        private String from;
        private String to;
        private int aid;
        private String aName;

        public int getAid() {
            return aid;
        }

        public void setAid(int aid) {
            this.aid = aid;
        }

        public int getDid() {
            return did;
        }

        public void setDid(int did) {
            this.did = did;
        }

        public int getLabid() {
            return labid;
        }

        public void setLabid(int labid) {
            this.labid = labid;
        }

        public String getLab() {
            return lab;
        }

        public void setLab(String lab) {
            this.lab = lab;
        }

        public String getdName() {
            return dName;
        }

        public void setdName(String dName) {
            this.dName = dName;
        }

        public String getFrom() {
            return from;
        }

        public void setFrom(String from) {
            this.from = from;
        }

        public String getTo() {
            return to;
        }

        public void setTo(String to) {
            this.to = to;
        }

        public String getaName() {
            return aName;
        }

        public void setaName(String aName) {
            this.aName = aName;
        }
        
    }
}
