package reporting;

import java.util.HashMap;





public class ReportBusinessUtils {
	
	
	
	private static HashMap<String, Object> parameters = null;
	
	
	
	public static String actionExport_Dli_11_TH(String realPath, String namBaoCao, String maTinh, String soBaoCao, String ngayBaoCao, String nguoiLap, String nguoiDuyet, String duoiFile, String thoigianthuc,String donViBaoCao){
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
	
	/*
	public static void inBaoCaoDLI(ResourceRequest resourceRequest, ResourceResponse resourceResponse) {
		
		HashMap<String, Object> parameters = null;
		String currentTimeFull = CusFormatData.getCurrentTimeFull();
		
		
		
		String realPath = ReportUtils.getTemplateReportFilePath(resourceRequest);
		
		try{
			if(Validator.isNotNull(maTinh)
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
				
			}
			
		}catch (Exception e) {
			
		}
		
		
	}*/
}
