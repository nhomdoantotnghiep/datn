/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package reporting.complaint;


import java.util.List;

/**
 *
 * @author Tai
 */
public class ComplaintModel {
    
    private List<ComplaintModelList> lst;

    

    public List<ComplaintModelList> getLst() {
        return lst;
    }

    public void setLst(List<ComplaintModelList> lst) {
        this.lst = lst;
    }
    
    public class ComplaintModelList{
        private int labid;
        private String labName;
        private int did;
        private String dName;
        private String from;
        private String to;
        private int totalComp;

        public String getLabName() {
            return labName;
        }

        public void setLabName(String labName) {
            this.labName = labName;
        }

        public int getLabid() {
            return labid;
        }

        public void setLabid(int labid) {
            this.labid = labid;
        }

        public int getDid() {
            return did;
        }

        public void setDid(int did) {
            this.did = did;
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

        public int getTotalComp() {
            return totalComp;
        }

        public void setTotalComp(int totalComp) {
            this.totalComp = totalComp;
        }
        

        
        
    }
}
