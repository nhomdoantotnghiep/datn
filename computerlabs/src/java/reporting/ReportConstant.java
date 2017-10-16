
package reporting;



public class ReportConstant {
	// dinh nghia tieng viet
	
	
	//duoi file
	public static final String DUOI_PDF = "pdf";
	public static final String DUOI_XLS = "xls";
	public static final String DUOI_DOC = "doc";
	
	
	
	//type bao cao
	/// DLI 1.1 Tinh
	public static final int TYPE_TIME_TABLE = 1;
        public static final int TYPE_SCHEDULEWORK = 2;
        public static final int TYPE_WORKINGSHIFT = 3;
        public static final int TYPE_TIMETABLE_WORKINGSHIFT = 4;
	
	/* ten file jrxml va ten file se duoc export*/
	public static final String TEN_FILE_DEFAULT = "default";//100

	public static final String GIAY_TIMETABLE_TEMP = "TimeTable.jrxml"; 
	public static final String GIAY_TIMETABLE_EXPORT = "TimeTable" ;
	
        public static final String GIAY_SCHEDULEWORK_TEMP = "ScheduleWork.jrxml"; 
	public static final String GIAY_SCHEDULEWORK_EXPORT = "ScheduleWork" ;
	
        public static final String GIAY_WORKINGSHIFT_TEMP = "WorkingShift.jrxml"; 
	public static final String GIAY_WORKINGSHIFT_EXPORT = "WorkingShift" ;	
        
        public static final String GIAY_TIMETABLE_WORKINGSHIFT_TEMP = "TimeTableWorkingShift.jrxml"; 
	public static final String GIAY_TIMETABLE_WORKINGSHIFT_EXPORT = "TimeTableWorkingShift" ;
}
