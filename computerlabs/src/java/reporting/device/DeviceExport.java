/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package reporting.device;

import java.util.HashMap;
import java.util.List;

/**
 *
 * @author Tai
 */
public class DeviceExport {
    public static DeviceModel getModel(HashMap<String, Object> hashMap){
        DeviceModel result = new DeviceModel();
        
        String labRoom = "";
        List<DeviceModel.DeviceModelList> lst = null;
        
        result.setLabRoom(labRoom);
        result.setLst(lst);
        return result;
    }
    
}
