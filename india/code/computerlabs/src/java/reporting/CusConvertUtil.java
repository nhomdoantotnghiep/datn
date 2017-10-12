/**
 *
 */

package reporting;

import java.text.DecimalFormat;
import java.text.Normalizer;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.regex.Pattern;



/**
 * @author win_64
 *
 */
public class CusConvertUtil {
	
	public static SimpleDateFormat formatDateShort = new SimpleDateFormat("dd/MM/yyyy");
	public static SimpleDateFormat formatDateShort2 = new SimpleDateFormat("yyyy/MM/dd");
	public static SimpleDateFormat formatDateFullTime = new SimpleDateFormat("HH:mm dd/MM/yyyy");
	public static SimpleDateFormat formatDateSendDate = new SimpleDateFormat("YYYY-MM-DD HH:mm:ss");
	public static SimpleDateFormat formatDateFullTime3 = new SimpleDateFormat("dd/MM/yyyy HH:mm");
	public static DecimalFormat formatNumber = new DecimalFormat("#,##0.00");
	public static DecimalFormat formatNumber2 = new DecimalFormat("#,##0");
        public static SimpleDateFormat formartDateEEMMDYYY = new SimpleDateFormat("EE, MMM d,yyyy");
	
	public static Date parseStringToDateEEMMDYYY(String data) {
		try {
			
			return formartDateEEMMDYYY.parse(data);
		} catch (Exception es) {
			
		}
		return new Date();
	}
	public static String parseDateEEMMDYYYToString(Date date) {
		try {
			return formartDateEEMMDYYY.format(date);
		} catch (Exception es) {
			
		}
		return "";
	}
	public static Date parseStringToDateOfSendDate(String data) {
		try {
			
			return formatDateSendDate.parse(data);
		} catch (Exception es) {
			
		}
		return new Date();
	}
	
	public static String parseDateToString2(Date date) {
		try {
			return formatDateShort2.format(date);
		} catch (Exception es) {
			
		}
		return "";
	}
	public static Date parseStringToDate2(String date) {
		try {
			return formatDateShort2.parse(date);
		} catch (Exception es) {
			
		}
		return new Date();
	}
	public static String parseDateToString3(Date date) {
		try {
			return formatDateFullTime3.format(date);
		} catch (Exception es) {
			
		}
		return "";
	}
	
	public static String parsefulldateToString(Date date) {
		try {
			return formatDateFullTime.format(date);
		} catch (Exception es) {
			
		}
		return "";
	}
	
	public static String parseDateToString(Date date) {
		try {
			return formatDateShort.format(date);
		} catch (Exception es) {
			
		}
		return "";
	}
	
	public static Date parseStringToDate(String data) {
		try {
			return formatDateShort.parse(data);
		} catch (Exception es) {
			
		}
		return null;
	}
	
	/**
	 * Convert from String to Long
	 * @param value
	 * @return
	 */
	public static long convertToLong(String value) {
		try {
			return Long.parseLong(value.trim());
		} catch (Exception es) {
			
		}
		
		return -1;
	}
	
	/**
	 * Convert from String to Double
	 * @param value
	 * @return
	 */
	public static double convertToDouble(String value) {
		try {
			return Double.parseDouble(value.trim());
		} catch (Exception es) {
			
		}
		
		return 0;
	}
	
	/**
	 * Convert from String to Long
	 * @param value
	 * @return
	 */
	public static int convertToInt(String value) {
		try {
			return Integer.parseInt(value.trim());
		} catch (Exception es) {
			
		}
		
		return 0;
	}
	
	public static String checkSelectData(long number1, long number2) {
		try {
			if (number1 == number2) { return "selected=\"selected\""; }
		} catch (Exception es) {
			
		}
		return "";
	}
	
	public static String checkSelectData(long number1, String number2) {
		try {
			if ((number2 != null) && (number2.trim().length() > 0)) {
				if (number1 == Long.parseLong(number2.trim())) { return "selected=\"selected\""; }
			}
			
		} catch (Exception es) {
			
		}
		return "";
	}
	
	public static String checkEqualData(String value1, String value2) {
		try {
			if (value1.equalsIgnoreCase(value2)) { return "selected=\"selected\""; }
		} catch (Exception es) {
			
		}
		return "";
	}
	
	public static String formatIntToString(int data) {
		try {
			if (data < 10) { return "0" + data; }
		} catch (Exception es) {
			
		}
		
		return String.valueOf(data);
	}
	
	public static long getDefferenBetweenTwoDate(Date startDate, Date endDate) {
		try {
			Calendar c1 = Calendar.getInstance();
			Calendar c2 = Calendar.getInstance();
			
			c1.setTime(startDate);
//			c1.set(Calendar.MONTH, startDate.getMonth() + 1);
//			c1.set(Calendar.YEAR, startDate.getYear());
//			c1.set(Calendar.DAY_OF_MONTH, startDate.getDate());
			
			c2.setTime(endDate);
//			c2.set(Calendar.MONTH, endDate.getMonth() + 1);
//			c2.set(Calendar.YEAR, endDate.getYear());
//			c2.set(Calendar.DAY_OF_MONTH, endDate.getDate());
			
			long noDay = (c2.getTime().getTime() - c1.getTime().getTime()) / (24 * 3600 * 1000);
			if (noDay > 0) { return noDay; }
		} catch (Exception es) {
			
		}
		return 0;
	}
	
	public static String parseLongToString(long value) {
		try {
			return String.valueOf(value);
		} catch (Exception es) {
			
			return null;
		}
	}
	
	public static String parseIntToString(int value) {
		try {
			return String.valueOf(value);
		} catch (Exception es) {
			
			return null;
		}
	}
	
	public static String parseDoubleToString2Digits(double data){
		String out = "";
		try{
			out = formatNumber.format(data);
		}catch(Exception e){
			
		}
		return out;
	}
	
	public static String parseIntToString1000(int data){
		String out = "";
		try{
			out = formatNumber2.format(data);
		}catch(Exception e){
			
		}
		return out;
	}
	
	public static String parseLongToString1000(long data){
		String out = "";
		try{
			out = formatNumber2.format(data);
		}catch(Exception e){
			
		}
		return out;
	}
	
	public static double convertIntToDouble(int value) {
		try {
			return (double) value;
		} catch (Exception es) {
			
		}
		
		return 0;
	}
	
	public static int convertDoubleToint(double value) {	
		try {
			Double s = value;
			return s.intValue();
		} catch (Exception es) {
			
		}
		
		return 0;
	}
	
	public static long convertIntToLong(int value) {	
		try {
			long s = Long.parseLong(String.valueOf(value));
			return s;
		} catch (Exception es) {
			
		}
		
		return 0;
	}
	
	public static String IntegerToRoman(int n){
        String roman="";
        int repeat;
        int magnitude[]={1000,900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1};
        String symbol[]={"M","CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"};
        repeat=n/1;
        for(int x=0; n>0; x++){
            repeat=n/magnitude[x];
            for(int i=1; i<=repeat; i++){
                roman=roman + symbol[x];
            }
            n=n%magnitude[x];
        }
        return roman;
    }
	public static String validateString(String source){ 
		  String result = "";
		        // Cắt khoảng trống 2 đầu 
		        source = source.replaceAll("\u00A0", " ").trim(); 
		        while (source.indexOf(" ") != -1){ 
		            // Bỏ khoảng trống thừa ở giữa 
		            source = source.replaceAll(" "," "); 
		        } 
		        while (source.indexOf("  ") != -1){ 
		            // Bỏ khoảng trống thừa ở giữa 
		            source = source.replaceAll("  "," "); 
		        } 
		        source.toLowerCase(); 
		        String[] sp = source.split(" ");
		        for (String string : sp) {
		         if(string.length() > 0){
		          result += string +" ";
		         }
		  }
		       
		        return result.trim(); 
	}
	public static String unAccent(String s) {
		  String temp = Normalizer.normalize(s, Normalizer.Form.NFD);
		  Pattern pattern = Pattern.compile("\\p{InCombiningDiacriticalMarks}+");
		  String ret = "";
		  String retu = "";
		  ret = pattern.matcher(temp).replaceAll("").replaceAll("\u0110", "D")
		    .replaceAll("\u0111", "d").replaceAll("  ", "").replaceAll(" ", "")
		    .replaceAll("_", "").replaceAll(",", "")
		    .replaceAll("'", "").replaceAll("\u00A0", " ")
		    .replaceAll("ubndthitran", "");
		  retu = validateString(ret);
		  return retu;
		 }
}
