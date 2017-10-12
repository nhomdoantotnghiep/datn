package reporting;

import java.io.IOException;
import java.util.ArrayList;

import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;

import javax.transaction.SystemException;

public class ObjectExportToReportUtils {

    public static <T> JRBeanCollectionDataSource exportBieuMau(T object) throws SystemException, IOException {
        ArrayList<T> dataBeanList = getDataReport(object);

        JRBeanCollectionDataSource beanColDataSource = new JRBeanCollectionDataSource(dataBeanList);
        return beanColDataSource;
    }

    public static <T> ArrayList<T> getDataReport(T object) throws SystemException {
        ArrayList<T> dataBeanList = new ArrayList<T>();
        dataBeanList.add(getModel(object));
        return dataBeanList;
    }

    public static <T> T getModel(T object) throws SystemException {
        return object;
    }

}
