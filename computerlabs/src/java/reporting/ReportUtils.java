package reporting;

import com.google.common.net.HttpHeaders;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;
import java.util.Map;

import net.sf.jasperreports.engine.JRDataSource;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JRExporterParameter;
import net.sf.jasperreports.engine.JRParameter;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.design.JasperDesign;
import net.sf.jasperreports.engine.export.JRPdfExporter;
import net.sf.jasperreports.engine.export.JRXlsExporter;
import net.sf.jasperreports.engine.export.JRXlsExporterParameter;
import net.sf.jasperreports.engine.export.ooxml.JRDocxExporter;
import net.sf.jasperreports.engine.xml.JRXmlLoader;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class ReportUtils {

    public static final String PATH_FILE_REPORT = "template";
    public static final String PATH_FILE_EXPORT = "export";

    public static final String FOLDER_TIMETABLE = "timetable";
    public static final String FOLDER_SCHEDULE = "schedule";
    public static final String FOLDER_DEVICE = "device";
    

    public static String getTemplateReportFilePath(HttpServletRequest request, String reportOrexport, String fileName) {

        return request.getSession().getServletContext().getRealPath("/").replace("/", File.separator).replace(File.separator + ".", "")
                + reportOrexport + File.separator + fileName;
        /**
         * ResourceRequest
         *
         * return
         * resourceRequest.getPortletSession().getPortletContext().getRealPath("/").
         * replace("/", File.separator).replace(File.separator + ".", "") +
         * File.separator + reportOrexport + File.separator + fileName;
		 *
         */
    }

    public static String getTemplateReportFilePath(HttpServletRequest request) {

        return request.getSession().getServletContext().getRealPath("/").replace("/", File.separator).replace(File.separator + ".", "");
        /**
         * ResourceRequest
         *
         * return
         * resourceRequest.getPortletSession().getPortletContext().getRealPath("/").
         * replace("/", File.separator).replace(File.separator + ".", "") +
         * File.separator + reportOrexport + File.separator + fileName;
		 *
         */
    }

    /*
     * Function Export to Server, se luu thanh file moi show ra hoac cho download
     */
    public static String exportFunction(
            String realPath, String dirParent, String tenFile_Template, String tenFile_Export, JRDataSource dataSource, Map<String, Object> parameters, String duoiFile)
            throws IOException {

        String tenFile = tenFile_Export + "." + duoiFile;

        InputStream inputStream = null;

        try {
            String pathTemplate = realPath + PATH_FILE_REPORT + File.separator + dirParent + File.separator + tenFile_Template;
            inputStream = new FileInputStream(pathTemplate);

            JasperDesign jasperDesign = JRXmlLoader.load(inputStream);
            JasperReport jasperReport = JasperCompileManager.compileReport(jasperDesign);
            if (duoiFile.equalsIgnoreCase(ReportConstant.DUOI_XLS)) {
                parameters.put(JRParameter.IS_IGNORE_PAGINATION, Boolean.TRUE);
                parameters.put("TYPE_EXPORT", "XLS");
            }
            parameters.put("SUBREPORT_DIR", realPath + PATH_FILE_REPORT + File.separator + dirParent + File.separator);
            parameters.put("IMG_DIR", realPath + PATH_FILE_REPORT + File.separator + "img" + File.separator);

            JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, parameters, dataSource);
            String pathExport = realPath + PATH_FILE_EXPORT + File.separator + tenFile;

			//JasperExportManager.exportReportToPdfFile(jasperPrint, pathExport);
            if (duoiFile.equalsIgnoreCase(ReportConstant.DUOI_PDF)) {
                JasperExportManager.exportReportToPdfFile(jasperPrint, pathExport);
            } else if (duoiFile.equalsIgnoreCase(ReportConstant.DUOI_XLS)) {
                makeExcelXlsReport(jasperPrint, pathExport);
            } else if (duoiFile.equalsIgnoreCase(ReportConstant.DUOI_DOC)) {
                makeWordDocReport(jasperPrint, pathExport);
            }
        } catch (JRException e) {

            tenFile = ReportConstant.TEN_FILE_DEFAULT + "." + duoiFile;

        } finally {
            if (inputStream != null) {
                inputStream.close();
            }
        }

        return tenFile;
    }

    public static void makeWordDocReport(JasperPrint jasperPrint, String pathExport) throws IOException {
        ByteArrayOutputStream baoxDoc = null;
        FileOutputStream outputfile = null;
        try {
            baoxDoc = new ByteArrayOutputStream();
            JRDocxExporter exporterDoc = new JRDocxExporter();
            exporterDoc.setParameter(JRExporterParameter.JASPER_PRINT, jasperPrint);
            exporterDoc.setParameter(JRExporterParameter.OUTPUT_STREAM, baoxDoc);
            exporterDoc.exportReport();

            outputfile = new FileOutputStream(pathExport);
            outputfile.write(baoxDoc.toByteArray());

        } catch (Exception e) {

        } finally {
            if (baoxDoc != null) {
                baoxDoc.close();
            }
            if (outputfile != null) {
                outputfile.close();
            }
        }

    }

    public static void makeExcelXlsReport(JasperPrint jasperPrint, String pathExport) throws IOException {
        OutputStream outStream = null;
        ByteArrayOutputStream baoxXLS = null;
        try {
            baoxXLS = new ByteArrayOutputStream();

            JRXlsExporter exporterXLS = new JRXlsExporter();
            exporterXLS.setParameter(JRXlsExporterParameter.JASPER_PRINT, jasperPrint);
            exporterXLS.setParameter(JRExporterParameter.OUTPUT_FILE_NAME, pathExport);
            exporterXLS.setParameter(JRXlsExporterParameter.OUTPUT_STREAM, baoxXLS);
            /**
             * FALSE, phan trang, 1 file jasper, when in pdf co n trang, co n
             * sheet TRUE, ko phan trang, 1 file jasper, when in pdf co n trang,
             * co 1 sheet
			 *
             */

            exporterXLS.setParameter(JRXlsExporterParameter.IS_ONE_PAGE_PER_SHEET, Boolean.FALSE);
            exporterXLS.setParameter(JRXlsExporterParameter.IS_WHITE_PAGE_BACKGROUND, Boolean.TRUE);
            exporterXLS.setParameter(JRXlsExporterParameter.IS_COLLAPSE_ROW_SPAN, Boolean.FALSE);
            exporterXLS.setParameter(JRXlsExporterParameter.IS_REMOVE_EMPTY_SPACE_BETWEEN_COLUMNS, Boolean.FALSE);
            exporterXLS.setParameter(JRXlsExporterParameter.IS_REMOVE_EMPTY_SPACE_BETWEEN_ROWS, Boolean.TRUE);
            exporterXLS.setParameter(JRXlsExporterParameter.IS_FONT_SIZE_FIX_ENABLED, Boolean.TRUE);

            exporterXLS.exportReport();

            outStream = new FileOutputStream(pathExport);
            outStream.write(baoxXLS.toByteArray());

        } catch (Exception e) {

        } finally {
            if (baoxXLS != null) {
                baoxXLS.close();
            }
            if (outStream != null) {
                outStream.close();
            }
        }
    }

    /*
     * se cho view file truc tiep
     * 
     */
    public static void exportFunctionResourceURL(
            String realPath, String dirParent, String tenFile_Template, String tenFile_Export, JRDataSource dataSource, Map<String, Object> parameters, String duoiFile, HttpServletResponse resourceResponse)
            throws IOException {

        String tenFile = tenFile_Export + "." + duoiFile;
        InputStream inputStream = null;

        try {
            String pathTemplate = realPath + PATH_FILE_REPORT + File.separator + dirParent + File.separator + tenFile_Template;
            System.out.println("exportFunctionResourceURL-pathTemplate-"+pathTemplate);
            inputStream = new FileInputStream(pathTemplate);
            
            JasperDesign jasperDesign = JRXmlLoader.load(inputStream);
            JasperReport jasperReport = JasperCompileManager.compileReport(jasperDesign);
            if (duoiFile.equalsIgnoreCase(ReportConstant.DUOI_XLS)) {

                parameters.put(JRParameter.IS_IGNORE_PAGINATION, Boolean.TRUE);// neu khong phai cac bao cao tren thi in excel se ra cung 1 sheet.

                parameters.put("TYPE_EXPORT", "XLS");
            }
            parameters.put("SUBREPORT_DIR", realPath + PATH_FILE_REPORT + File.separator + dirParent + File.separator);
            parameters.put("IMG_DIR", realPath + PATH_FILE_REPORT + File.separator + "img" + File.separator);
            System.out.println("-exportFunctionResourceURL-report-"+realPath + PATH_FILE_REPORT + File.separator + dirParent + File.separator);
            System.out.println("-exportFunctionResourceURL-report-duoiFile+"+duoiFile);
            JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, parameters, dataSource);

            if (duoiFile.equalsIgnoreCase(ReportConstant.DUOI_PDF)) {
                makePdfReportResourceURL(jasperPrint, resourceResponse, tenFile);
            } else if (duoiFile.equalsIgnoreCase(ReportConstant.DUOI_XLS)) {
                makeExcelXlsReportResourceURL(jasperPrint, resourceResponse, tenFile);
            } else if (duoiFile.equalsIgnoreCase(ReportConstant.DUOI_DOC)) {
                makeWordDocReportResourceURL(jasperPrint, resourceResponse, tenFile);
            }

        } catch (Exception e) {

        } finally {
            if (inputStream != null) {
                inputStream.close();
            }
        }

    }

    public static void makePdfReportResourceURL(JasperPrint jasperPrint, HttpServletResponse resourceResponse, String tenFile) throws IOException {
        ByteArrayOutputStream baos = null;
        OutputStream out = null;
        try {
            baos = new ByteArrayOutputStream();
            JRPdfExporter exporterPdf = new JRPdfExporter();
            exporterPdf.setParameter(JRExporterParameter.JASPER_PRINT, jasperPrint);
            exporterPdf.setParameter(JRExporterParameter.OUTPUT_STREAM, baos);
            exporterPdf.exportReport();

            resourceResponse.setContentType("application/pdf");
            resourceResponse.addHeader(HttpHeaders.CACHE_CONTROL, "private, no-cache, no-store, must-revalidate");
            resourceResponse.addHeader(HttpHeaders.CONTENT_DISPOSITION, "filename=" + tenFile);
            resourceResponse.setContentLength(baos.size());

            out = resourceResponse.getOutputStream();
            baos.writeTo(out);

            baos.flush();
            baos.close();

            out.flush();
            out.close();

        } catch (Exception e) {

        } finally {
            if (baos != null) {
                baos.close();
            }
            if (out != null) {
                out.close();
            }
        }
    }

    public static void makeExcelXlsReportResourceURL(JasperPrint jasperPrint, HttpServletResponse resourceResponse, String tenFile) throws IOException {
        ByteArrayOutputStream baos = null;
        OutputStream out = null;
        try {
            baos = new ByteArrayOutputStream();

            JRXlsExporter exporterXLS = new JRXlsExporter();
            exporterXLS.setParameter(JRXlsExporterParameter.JASPER_PRINT, jasperPrint);
            exporterXLS.setParameter(JRXlsExporterParameter.OUTPUT_STREAM, baos);
            /**
             * FALSE, phan trang, 1 file jasper, when in pdf co n trang, co n
             * sheet TRUE, ko phan trang, 1 file jasper, when in pdf co n trang,
             * co 1 sheet
			 *
             */

            //exporterXLS.setParameter(JRXlsExporterParameter.IS_ONE_PAGE_PER_SHEET, Boolean.FALSE);
            exporterXLS.setParameter(JRXlsExporterParameter.IS_WHITE_PAGE_BACKGROUND, Boolean.TRUE);
            exporterXLS.setParameter(JRXlsExporterParameter.IS_COLLAPSE_ROW_SPAN, Boolean.FALSE);
            exporterXLS.setParameter(JRXlsExporterParameter.IS_REMOVE_EMPTY_SPACE_BETWEEN_COLUMNS, Boolean.FALSE);
            exporterXLS.setParameter(JRXlsExporterParameter.IS_REMOVE_EMPTY_SPACE_BETWEEN_ROWS, Boolean.TRUE);
            exporterXLS.setParameter(JRXlsExporterParameter.IS_FONT_SIZE_FIX_ENABLED, Boolean.TRUE);
            exporterXLS.exportReport();

            resourceResponse.setContentType("application/vnd.ms-excel");
            resourceResponse.addHeader(HttpHeaders.CACHE_CONTROL, "private, no-cache, no-store, must-revalidate");
            resourceResponse.addHeader(HttpHeaders.CONTENT_DISPOSITION, "filename=" + tenFile);
            resourceResponse.setContentLength(baos.size());

            out = resourceResponse.getOutputStream();
            baos.writeTo(out);

            baos.flush();
            baos.close();

            out.flush();
            out.close();
            System.out.println("-makeExcelXlsReportResourceURL-HET-");
        } catch (Exception e) {

        } finally {
            if (baos != null) {
                baos.close();
            }
            if (out != null) {
                out.close();
            }
        }
    }

    public static void makeWordDocReportResourceURL(JasperPrint jasperPrint, HttpServletResponse resourceResponse, String tenFile) throws IOException {
        ByteArrayOutputStream baos = null;
        OutputStream out = null;
        try {
            baos = new ByteArrayOutputStream();
            JRDocxExporter exporterDoc = new JRDocxExporter();
            exporterDoc.setParameter(JRExporterParameter.JASPER_PRINT, jasperPrint);
            exporterDoc.setParameter(JRExporterParameter.OUTPUT_STREAM, baos);
            exporterDoc.exportReport();

            resourceResponse.setContentType("application/msword");
            resourceResponse.addHeader(HttpHeaders.CACHE_CONTROL, "private, no-cache, no-store, must-revalidate");
            resourceResponse.addHeader(HttpHeaders.CONTENT_DISPOSITION, "filename=" + tenFile);
            resourceResponse.setContentLength(baos.size());

            out = resourceResponse.getOutputStream();
            baos.writeTo(out);

            baos.flush();
            baos.close();

            out.flush();
            out.close();

        } catch (Exception e) {

        } finally {
            if (baos != null) {
                baos.close();
            }
            if (out != null) {
                out.close();
            }
        }

    }

}
