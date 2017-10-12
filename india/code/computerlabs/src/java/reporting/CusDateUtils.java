
package reporting;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

public class CusDateUtils {
	
	public static String dateToString(String format, Date date) { // lay ra ngay, thang, nam, gio, phu, giay hien tai
		String stringResult = "";
		SimpleDateFormat sdf = null;
		try {
			sdf = new SimpleDateFormat(format);
			stringResult = sdf.format(date);
		} catch (Exception e) {
			stringResult = "";
		}
		return stringResult;
	}
	
	public static Date stringToDate(String sDate, String format) {
		Date result = null;
		SimpleDateFormat sdf = null;
		try {
			sdf = new SimpleDateFormat(format);
			result = sdf.parse(sDate);
		} catch (Exception e) {
		}
		return result;
	}
	
	public static boolean isDate(String sDate, String format) {
		SimpleDateFormat sdf = null;
		try {
			sdf = new SimpleDateFormat(format);
			sdf.parse(sDate);
			return true;
		} catch (Exception e) {
			return false;
		}
	}
	
	public static String getDateAfterNumberDay(int soNgayAfterCurrentDay) {
		try {
			Calendar calendar = Calendar.getInstance();
			calendar.setTime(new Date());
			calendar.add(Calendar.DAY_OF_YEAR, soNgayAfterCurrentDay);
			
			return dateToString("dd/MM/yyyy", calendar.getTime());
		} catch (Exception e) {
			
		}
		return "";
	}
	
	public static Date addTime(Date date, int hour, int minutes, int second) {
		Calendar calendar = new GregorianCalendar();
		calendar.setTime(date);
		calendar.set(Calendar.HOUR_OF_DAY, hour);
		calendar.set(Calendar.MINUTE, minutes);
		calendar.set(Calendar.SECOND, second);
		
		return calendar.getTime();
	}
}
