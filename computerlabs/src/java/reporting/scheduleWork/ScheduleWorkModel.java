
package reporting.scheduleWork;


import java.util.List;



public class ScheduleWorkModel {
    private String labName;
    private String from;
    private String to;
    private String tStaff;
    private List<ShiftLst> shiftLst;
    private List<ShiftLst> shiftLstTable;

    public String gettStaff() {
        return tStaff;
    }

    public void settStaff(String tStaff) {
        this.tStaff = tStaff;
    }
            
    
    public String getLabName() {
        return labName;
    }

    public void setLabName(String labName) {
        this.labName = labName;
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

    public List<ShiftLst> getShiftLst() {
        return shiftLst;
    }

    public void setShiftLst(List<ShiftLst> shiftLst) {
        this.shiftLst = shiftLst;
    }

    public List<ShiftLst> getShiftLstTable() {
        return shiftLstTable;
    }

    public void setShiftLstTable(List<ShiftLst> shiftLstTable) {
        this.shiftLstTable = shiftLstTable;
    }
    
    public class ShiftLst{
        private String dateName;
        private String shift1;
        private String shift2;
        private String shift3;
        private String shift4;
        private String shift5;
        private String shift6;
        private String shift7;
        private String shift8;
        private String shift9;
        private String shift10;
        private String shift11;
        private String shift12;
        private String shift13;
        private String shift14;
        private String shift15;
        private String shift16;
        private String DateW;
        private String working;

        public String getWorking() {
            return working;
        }

        public void setWorking(String working) {
            this.working = working;
        }
        
        public String getDateName() {
            return dateName;
        }

        public void setDateName(String dateName) {
            this.dateName = dateName;
        }

        public String getShift1() {
            return shift1;
        }

        public void setShift1(String shift1) {
            this.shift1 = shift1;
        }

        public String getShift2() {
            return shift2;
        }

        public void setShift2(String shift2) {
            this.shift2 = shift2;
        }

        public String getShift3() {
            return shift3;
        }

        public void setShift3(String shift3) {
            this.shift3 = shift3;
        }

        public String getShift4() {
            return shift4;
        }

        public void setShift4(String shift4) {
            this.shift4 = shift4;
        }

        public String getShift5() {
            return shift5;
        }

        public void setShift5(String shift5) {
            this.shift5 = shift5;
        }

        public String getShift6() {
            return shift6;
        }

        public void setShift6(String shift6) {
            this.shift6 = shift6;
        }

        public String getShift7() {
            return shift7;
        }

        public void setShift7(String shift7) {
            this.shift7 = shift7;
        }

        public String getShift8() {
            return shift8;
        }

        public void setShift8(String shift8) {
            this.shift8 = shift8;
        }

        public String getShift9() {
            return shift9;
        }

        public void setShift9(String shift9) {
            this.shift9 = shift9;
        }

        public String getShift10() {
            return shift10;
        }

        public void setShift10(String shift10) {
            this.shift10 = shift10;
        }

        public String getShift11() {
            return shift11;
        }

        public void setShift11(String shift11) {
            this.shift11 = shift11;
        }

        public String getShift12() {
            return shift12;
        }

        public void setShift12(String shift12) {
            this.shift12 = shift12;
        }

        public String getShift13() {
            return shift13;
        }

        public void setShift13(String shift13) {
            this.shift13 = shift13;
        }

        public String getShift14() {
            return shift14;
        }

        public void setShift14(String shift14) {
            this.shift14 = shift14;
        }

        public String getShift15() {
            return shift15;
        }

        public void setShift15(String shift15) {
            this.shift15 = shift15;
        }

        public String getShift16() {
            return shift16;
        }

        public void setShift16(String shift16) {
            this.shift16 = shift16;
        }

        public String getDateW() {
            return DateW;
        }

        public void setDateW(String DateW) {
            this.DateW = DateW;
        }
        
    }
    
	
	
}
