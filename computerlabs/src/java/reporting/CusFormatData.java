/**
 * 
 */

package reporting;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Locale;
import java.util.TimeZone;

import javax.xml.datatype.DatatypeFactory;
import javax.xml.datatype.XMLGregorianCalendar;

/**
 * @author win_64
 *
 */
public class CusFormatData {
	
	public static SimpleDateFormat formatDateShort = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	static SimpleDateFormat formatDateShort2 = new SimpleDateFormat("yyyy-MM-dd");
	public static SimpleDateFormat formatDateShort3 = new SimpleDateFormat("dd/MM/yyyy HH:mm");
	static SimpleDateFormat formatDateShort4 = new SimpleDateFormat("HH:mm dd/MM/yyyy");
	static SimpleDateFormat formatDD = new SimpleDateFormat("dd");
	static SimpleDateFormat formatMM = new SimpleDateFormat("MM");
	static SimpleDateFormat formatYYYY = new SimpleDateFormat("yyyy");
	public static SimpleDateFormat formatDDMMYYYY = new SimpleDateFormat("dd/MM/yyyy");
	static SimpleDateFormat formatDDMMYYY2 = new SimpleDateFormat("dd-MM-yyyy");
	static SimpleDateFormat formatDDMMYYYYHHMMSS = new SimpleDateFormat("ddMMyyyy-HHmmss");
	public static SimpleDateFormat formatDateShort5 = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
	
	
	
	public static String getCurrentTimeFull(){
		try {
			Calendar calendar = Calendar.getInstance(TimeZone.getTimeZone("Asia/Bangkok"));
			
			return formatDDMMYYYYHHMMSS.format(calendar.getTime());
		} catch (Exception es) {
		}
		return "";		
	}
	public static Date parseStringToDateTypeDDMMYYYY(String data) {
		try {
			return formatDDMMYYYY.parse(data);
		} catch (Exception es) {
		}
		return null;
	}
	public static Date parseStringToDateformatDDMMYYY2(String data){
		try{
			return formatDDMMYYY2.parse(data);
		}catch (Exception e) {
			// TODO: handle exception
		}
		return null;
	}
	public static String getDayOfMonth(Date date) {
		try {
			return formatDD.format(date);
		} catch (Exception es) {
		}
		return "";
	}
	
	public static String getMonth(Date date) {
		try {
			return formatMM.format(date);
		} catch (Exception es) {
		}
		return "";
	}
	
	public static String getYear(Date date) {
		try {
			return formatYYYY.format(date);
		} catch (Exception es) {
		}
		return "";
	}
	
	public static String getToday() {
		try {
			return formatDDMMYYYY.format(new Date());
		} catch (Exception es) {
		}
		return "";
	}
	
	public static String getCurrentDay() {
		try {
			return formatDD.format(new Date());
		} catch (Exception es) {
		}
		return "";
	}
	public static String getCurrentMonth() {
		try {
			return formatMM.format(new Date());
		} catch (Exception es) {
		}
		return "";
	}
	public static String getCurrentYear() {
		try {
			return formatYYYY.format(new Date());
		} catch (Exception es) {
		}
		return "";
	}
	
	public static String parseDateToTringDDMMYYY(Date date) {
		try {
			return formatDDMMYYYY.format(date);
		} catch (Exception es) {
		}
		return "";
	}
	
	public static String parseDateToTring(Date date) {
		try {
			return formatDateShort.format(date);
		} catch (Exception es) {
		}
		return "";
	}
	public static String parseDateToTring5(Date date) {
		try {
			return formatDateShort5.format(date);
		} catch (Exception es) {
		}
		return "";
	}
	public static String parseDateToTringType3(Date date) {
		try {
			return formatDateShort3.format(date);
		} catch (Exception es) {
		}
		return "";
	}
	
	public static Date parseStringToDateType3(String data) {
		try {
			return formatDateShort3.parse(data);
		} catch (Exception es) {
		}
		return null;
	}
	
	public static String parseDateToTringType4(Date date) {
		try {
			return formatDateShort4.format(date);
		} catch (Exception es) {
		}
		return "";
	}
	
	public static String parseDateToStringType5(Date date) {
		try {
			return formatDDMMYYY2.format(date);
		} catch (Exception e) {
		}
		return "";
	}
	
	public static String parseDateToStringType6(Date date) {
		try {
			return formatDateShort2.format(date);
		} catch (Exception e) {
		}
		return "";
	}
	
	public static XMLGregorianCalendar convertFromDateToXMLGregorianCalendar(Date date) {
		XMLGregorianCalendar dateReturn = null;
		try {
			GregorianCalendar c = new GregorianCalendar();
			c.setTime(date);
			dateReturn = DatatypeFactory.newInstance().newXMLGregorianCalendar(c);
		} catch (Exception es) {
			//			es.printStackTrace();
			try {
				dateReturn = DatatypeFactory.newInstance().newXMLGregorianCalendar();
			} catch (Exception e) {
				//				e.printStackTrace();
			}
		}
		return dateReturn;
	}
	
	public static Date parseStringToDate(String date) {
		try {
			if (date == null || date.length() == 0) return null;
			return formatDateShort.parse(date.trim());
		} catch (Exception es) {
			try {
				return formatDateShort2.parse(date.trim());
			} catch (Exception e1) {
				try {
					return formatDateShort3.parse(date.trim());
				} catch (Exception e2) {
					try {
						return formatDateShort4.parse(date.trim());
					} catch (Exception e) {
						e.printStackTrace();
					}
				}
			}
		}
		return new Date();
	}
	
	public static Date parseDateShort3StringToDate(String date) {
		try {
			return formatDateShort3.parse(date);
		} catch (Exception e) {
		}
		return new Date();
	}
	
	public static boolean isThisDateValid(String dateToValidate) {
		
		if (dateToValidate == null) { return false; }
		formatDateShort.setLenient(false);
		try {
			//if not valid, it will throw ParseException
			formatDateShort.parse(dateToValidate.trim());
		} catch (ParseException e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}
	
	public static String checkData(long number1, long number2) {
		try {
			if (number1 == number2) { return "selected=\"selected\""; }
		} catch (Exception es) {
		}
		return "";
	}
	
	public static String checkedData(String dmCode, String value) {
		try {
			if (dmCode.equals(value)) { return "selected=\"selected\""; }
		} catch (Exception es) {
		}
		return "";
	}
	
	public static String congNgay(Date date) {
		try {
			Calendar calendar = Calendar.getInstance();
			calendar.setTime(date);
			
			calendar.add(Calendar.DAY_OF_YEAR, 1);
			return formatDateShort3.format(calendar.getTime());
		} catch (Exception e) {
		}
		return "";
	}
	
	public static String replaceSpecialSign(String input) {
		try {
			String returnData = input.replaceAll("<script>", "");
			returnData = returnData.replaceAll("</script>", "");
			return returnData;
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return input;
	}
	
	public static int compareTwoDates(Date befortDate, Date afterDate) {
		if (befortDate == null || afterDate == null) {
			return 0;
		}
		return (int) ((afterDate.getTime() - befortDate.getTime()) / (24 * 60 * 60 * 1000));
	}
}
