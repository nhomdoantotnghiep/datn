
package reporting;

import java.text.ParseException;
import java.util.Calendar;
import java.util.Date;






public class ReportFunction {
	
	
	
	private static final String NGAY_UPPERCASE = "Ngày";
	private static final String GIO = "giờ";
	private static final String NGAY = "ngày";
	private static final String THANG = "tháng";
	private static final String NAM = "năm";
	
	
	
	public static String getCurrentDate() {
		try {
			Calendar calendar = Calendar.getInstance();
			calendar.setTime(new Date());
			
			int day = calendar.get(Calendar.DAY_OF_MONTH);
			String sDay = "";
			if (day < 10) { sDay = "0" + day; }
			else { sDay = day + ""; };
			
			int month = calendar.get(Calendar.MONTH) + 1;
			String sMonth = "";
			if (month < 10) { sMonth = "0" + month; }
			else { sMonth = month + ""; }
			
			int year = calendar.get(Calendar.YEAR);
			return "(Date)      , " + NGAY + " " + sDay + " " + THANG + " " + sMonth + " " + NAM + " " + year;
		} catch (Exception e) {
			
		}
		return "(Date)      , " + NGAY + "      " + THANG + "      " + NAM + "     ";
	}
	
	public static String parseDateToString(Date date) {
		if (date != null) {
			try {
				return CusDateUtils.dateToString("dd/MM/yyyy", date);
			} catch (Exception es) {
				
			}
		}
		return "";
	}
	
	public static String parseDateToString1(Date date) {
		if (date != null) {
			try {
				return CusDateUtils.dateToString("dd/MM/yyyy", date);
			} catch (Exception es) {
				
			}
		}
		return "";
	}
	
	
	
	public static String parserDateToString3 (Date date) {
		if (date != null) {
			try {
				Calendar calendar = Calendar.getInstance();
				calendar.setTime(date);
				
				int hours = calendar.get(Calendar.HOUR_OF_DAY);
				String sHours = "";
				if (hours < 10) { sHours = "0" + hours; }
				else { sHours = hours + ""; }
				
				int minutes = calendar.get(Calendar.MINUTE);
				String sMinutes = "";
				if (minutes < 10) { sMinutes = "0" + minutes ; }
				else { sMinutes = minutes + ""; };
				
				int day = calendar.get(Calendar.DAY_OF_MONTH);
				String sDay = "";
				if (day < 10) { sDay = "0" + day; }
				else { sDay = day + ""; };
				
				int month = calendar.get(Calendar.MONTH) + 1;
				String sMonth = "";
				if (month < 10) { sMonth = "0" + month; }
				else { sMonth = month + ""; }
				
				int year = calendar.get(Calendar.YEAR);
				return sHours + ":" + sMinutes + " " + NGAY + " " + sDay + " " + THANG + " " + sMonth + " " + NAM + " " + year;
			} catch (Exception e) {
				
			}
		}
		return "";
	}
	public static String parserDateToString3LT (Date date) {
		if (date != null) {
			try {
				Calendar calendar = Calendar.getInstance();
				calendar.setTime(date);
				int hours = calendar.get(Calendar.HOUR_OF_DAY);
				int minutes = calendar.get(Calendar.MINUTE);
				
				String sHours = "";
				if (hours < 10) { sHours = "0" + hours; }
				else { sHours = hours + ""; };
				
				String sMinutes = "";
				if (minutes < 10) { sMinutes = "0" + minutes ; }
				else { sMinutes = minutes + ""; };
				
				int day = calendar.get(Calendar.DAY_OF_MONTH);
				
				String sDay = "";
				if (day < 10) { sDay = "0" + day; }
				else { sDay = day + ""; }
				
				int month = calendar.get(Calendar.MONTH) + 1;
				String sMonth = "";
				if (month < 10) { sMonth = "0" + month; }
				else { sMonth = month + ""; }
				
				int year = calendar.get(Calendar.YEAR);
				return sDay + "/" + sMonth + "/" + year + "-" + sHours +":"+ sMinutes + " ";
			} catch (Exception e) {
				
			}
		}
		return "";
	}
	
	public static String parserDateToString4 (Date date) {
		if (date != null) {
			try {
				Calendar calendar = Calendar.getInstance();
				calendar.setTime(date);
				int day = calendar.get(Calendar.DAY_OF_MONTH);
				String sDay = "";
				if (day < 10) { sDay = "0" + day;
				} else { sDay = day + ""; }

				int month = calendar.get(Calendar.MONTH) + 1;
				String sMonth = "";
				if (month < 10) { sMonth = "0" + month; }
				else { sMonth = month + ""; }
				
				int year = calendar.get(Calendar.YEAR);
				return NGAY + " " + sDay + " " + THANG + " " + sMonth + " " + NAM + " " + year;
			} catch (Exception e) {
				
			}
		}
		return "";
	}
	
	public static String parserDateToString5 (Date date) {
		if (date != null) {
			try {
				Calendar calendar = Calendar.getInstance();
				calendar.setTime(date);
				
				int day = calendar.get(Calendar.DAY_OF_MONTH);
				String sDay = "";
				if (day < 10) { sDay = "0" + day;
				} else { sDay = day + ""; }

				int month = calendar.get(Calendar.MONTH) + 1;
				String sMonth = "";
				if (month < 10) { sMonth = "0" + month; }
				else { sMonth = month + ""; }
				
				int year = calendar.get(Calendar.YEAR);
				return NGAY_UPPERCASE + " " + sDay + " " + THANG + " " + sMonth + " " + NAM + " " + year;
			} catch (Exception e) {
				
			}
		}
		return "";
	}
	public static String getSignPlaceAndSignDate (String signPlace, String signDate) {
		if(signPlace != null && signPlace.trim().length() > 0){
			signPlace = signPlace + ", ";
		}
		Date date = null;
		if (signDate != null && signDate.trim().length() > 0) {
			try {
				date = CusFormatData.formatDateShort.parse(signDate);
			} catch (ParseException e1) {
				e1.printStackTrace();
			}
			try {
				Calendar calendar = Calendar.getInstance();
				calendar.setTime(date);
				int day = calendar.get(Calendar.DAY_OF_MONTH);
				String sDay = "";
				if (day < 10) { sDay = "0" + day;
				} else { sDay = day + ""; }

				int month = calendar.get(Calendar.MONTH) + 1;
				String sMonth = "";
				if (month < 10) { sMonth = "0" + month; }
				else { sMonth = month + ""; }
				
				int year = calendar.get(Calendar.YEAR);
				return signPlace + NGAY + " " + sDay + " " + THANG + " " + sMonth + " " + NAM + " " + year;
			} catch (Exception e) {
				
			}
		}
		return "(Date)       ,ngày       tháng      năm     ";
	}
	
	public static String parseDateVN(Date date) {
		if (date != null) {
			try {
				Calendar calendar = Calendar.getInstance();
				calendar.setTime(date);
				int day = calendar.get(Calendar.DAY_OF_MONTH);
				String sDay = "";
				if (day < 10) {
					sDay = "0" + day;
				} else {
					sDay = day + "";
				}
				
				int month = calendar.get(Calendar.MONTH) + 1;
				String sMonth = "";
				if (month < 10) {
					sMonth = "0" + month;
				} else {
					sMonth = month + "";
				}
				int year = calendar.get(Calendar.YEAR);
				return NGAY + "  " + sDay + "  " + THANG + "  " + sMonth + "  " + NAM + "  " + year;
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return "";
	}
	
	public static String parseDateVN() {
		Date date = new Date();
		try {
			Calendar calendar = Calendar.getInstance();
			calendar.setTime(date);
			int day = calendar.get(Calendar.DAY_OF_MONTH);
			String sDay = "";
			if (day < 10) {
				sDay = "0" + day;
			} else {
				sDay = day + "";
			}
			
			int month = calendar.get(Calendar.MONTH) + 1;
			String sMonth = "";
			if (month < 10) {
				sMonth = "0" + month;
			} else {
				sMonth = month + "";
			}
			int year = calendar.get(Calendar.YEAR);
		
			
			//return NGAY + "  " + sDay + "  " + THANG + "  " + sMonth + "  " + NAM + "  " + year;
			return "ngày" + "  " + sDay + "  " + "tháng" + "  " + sMonth + "  " + "năm" + "  " + year;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "";
	}
}
