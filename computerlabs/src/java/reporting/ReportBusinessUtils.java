package reporting;

import com.sun.faces.util.CollectionsUtils;
import java.util.HashMap;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;
import reporting.timeTable.TimeTableExport;
import reporting.timeTable.TimeTableModel;

public class ReportBusinessUtils {

    private static HashMap<String, Object> parameters = null;

    public static String actionExport_Dli_11_TH(String realPath, String namBaoCao, String maTinh, String soBaoCao, String ngayBaoCao, String nguoiLap, String nguoiDuyet, String duoiFile, String thoigianthuc, String donViBaoCao) {
        String fileUrl = "";
        /*
		
         try {
         String tenFile_Export = namBaoCao+"_"+maTinh+"_"+ReportConstant.GIAY_DLI1_1_TH_EXPORT+"_"+thoigianthuc;
         SoDauNoiMoiHoatDong objectReport = SoDauNoiMoiHoatDongExport.getModel(namBaoCao, maTinh,  soBaoCao, ngayBaoCao,nguoiLap,nguoiDuyet,thoigianthuc,donViBaoCao);
         JRBeanCollectionDataSource dataSource = ObjectExportToReportUtils.exportBieuMau( objectReport);
         parameters = new HashMap<String, Object>();
         fileUrl = ReportUtils.exportFunction(realPath, ReportUtils.DLI_1_1, ReportConstant.GIAY_DLI1_1_TH_TEMP, tenFile_Export, dataSource, parameters,duoiFile);
         } catch (Exception e) {
			
         } */
        return fileUrl;
    }

    public static void inBaoCao(HttpServletRequest resourceRequest, HttpServletResponse resourceResponse) {

        HashMap<String, Object> parameters = null;
        String currentTimeFull = CusFormatData.getCurrentTimeFull();

        String realPath = ReportUtils.getTemplateReportFilePath(resourceRequest);
        System.out.println("inBaoCao-realPath-"+realPath);
        String type = resourceRequest.getParameter("typeRP");
        String duoiFile = resourceRequest.getParameter("duoiFileRP");
        try {
            if (type.trim().equalsIgnoreCase(String.valueOf(ReportConstant.TIME_TABLE))) {
                HashMap<String, Object> input = new HashMap<String, Object>();
                input.put("type", type);
                input.put("duoiFile", duoiFile);
                String tenFile_Export = ReportConstant.GIAY_TIMETABLE_EXPORT + "_" + currentTimeFull;

                TimeTableModel objectReport = TimeTableExport.getModel(input);
                JRBeanCollectionDataSource dataSource = ObjectExportToReportUtils.exportBieuMau(objectReport);
                parameters = new HashMap<String, Object>();
                ReportUtils.exportFunctionResourceURL(realPath, ReportUtils.TIMETABLE, ReportConstant.GIAY_TIMETABLE_TEMP, tenFile_Export, dataSource, parameters, duoiFile, resourceResponse);

            }
            /*if(Validator.isNotNull(maTinh)
             && Validator.isNotNull(namBaoCao) 
             && Validator.isNotNull(thoiGianThuc) 
             && Validator.isNotNull(type) 
             && type.trim().equalsIgnoreCase(ReportConstant.DLI1_1_TH)){
             log.info("==type--"+type);
				
             String tenFile_Export = namBaoCao+"_"+maTinh+"_"+ReportConstant.GIAY_DLI1_1_TH_EXPORT+"_"+thoiGianThuc+"_"+currentTimeFull;
             SoDauNoiMoiHoatDong objectReport = SoDauNoiMoiHoatDongExport.getModel(namBaoCao, maTinh,  soBaoCao, ngayBaoCao,nguoiLap,nguoiDuyet,thoiGianThuc,donViBaoCao);
             JRBeanCollectionDataSource dataSource = ObjectExportToReportUtils.exportBieuMau( objectReport);
             parameters = new HashMap<String, Object>();
             ReportUtils.exportFunctionResourceURL(realPath, ReportUtils.DLI_1_1, ReportConstant.GIAY_DLI1_1_TH_TEMP, tenFile_Export, dataSource, parameters,duoiFile,resourceResponse);
				
             }*/

        } catch (Exception e) {

        }

    }
}
