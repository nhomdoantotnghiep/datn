
<%@page import="reporting.ReportConstant"%>
<%@page import="processSchedule.totalRequestByScheID"%>
<%@page import="processSchedule.outPutRoomID"%>
<%@page import="processSchedule.checkRequest"%>
<%@page import="computerlabs.dbconnect"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="processSchedule.classSchedule"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<%@page import="java.util.List"%>  

<%
    int shiftType = 1;
    if (request.getParameter("shiftType") != null) {
        shiftType = Integer.parseInt(request.getParameter("shiftType"));
    }
    int checked = 1;
    if (request.getParameter("roomid") != null) {
        checked = Integer.parseInt(request.getParameter("roomid"));
    }    
    String inputdateFrom = "";
    if(request.getAttribute("inputdateFrom") != null){
        inputdateFrom = String.valueOf(request.getAttribute("inputdateFrom"));
    }
    String inputdateTo = "";
    if(request.getAttribute("inputdateFrom") != null){
        inputdateTo = String.valueOf(request.getAttribute("inputdateTo"));
    }
%>
<link rel="stylesheet" href="css/jquery-ui.css" />
<link rel="stylesheet" href="css/contentcss.css" />
<link rel="stylesheet" href="css/cssvalidate/validationEngine.jquery.css" type="text/css"/> 
<link rel="stylesheet" href="css/cssvalidate/template.css" type="text/css"/> 

<script src="js/jquery-1.8.3.min.js"></script>
<script src="js/jquery.bxslider.min.js"></script>
<script src="js/script.js" type="text/javascript"></script>
<script src="js/jquery-ui.min.js"></script>
<script src="js/jsvalidate/languages/jquery.validationEngine-en.js" type="text/javascript" charset="utf-8"></script> 
<script src="js/jsvalidate/jquery.validationEngine.js" type="text/javascript" charset="utf-8"></script> 
<script type="text/javascript">
    $(document).ready(function() {
        $(function() {
            $("#txtDateFrom").datepicker({
                dateFormat: "yy/mm/dd"
            });
            $("#txtDateTo").datepicker({
                dateFormat: "yy/mm/dd"
            });
        });
        $("#test").validationEngine();

    });

    function BASIC_SelectItem()
    {
        var c_value = "";
        
        for (var i = 0; i < document.test.chk.length; i++)

        {
            if (document.test.chk[i].checked)
            {
                c_value += (c_value ? '/' : '') + document.test.chk[i].value;
            }
        }
        document.test.txtResultShift.value = c_value;
    }

    var xmlHttpRe;
    function setXMLHttpRe() {
        try {
            xmlHttpRe = new ActiveXObject("Msxml2.XMLHTTP")
        }
        catch (e) {
            try {
                xmlHttpRe = new ActiveXObject("Microsoft.XMLHTTP")
            }
            catch (e2) {
                xmlHttpRe = false;
            }
        }
        if (!xmlHttpRe && typeof XMLHttpRequest !== 'undefined') {
            xmlHttpRe = new XMLHttpRequest();
        }
        return xmlHttpRe;
    }
    function show(pagenumber) {
        new setXMLHttpRe();
        var getText = pagenumber;  //Used to prevent caching during ajax call
        var v_room = "";
        var v_shift = "";
        var v_dateTo = "";
        var v_dateFrom = "";
        for (var i = 0; i < document.test.roomname.length; i++)

        {
            if (document.test.roomname[i].selected)
            {
                v_room += (v_room ? '/' : '') + document.test.roomname[i].value;
            }
        }
        for (var i = 0; i < document.test.shiftType.length; i++)

        {
            if (document.test.shiftType[i].selected)
            {
                v_shift += (v_shift ? '/' : '') + document.test.shiftType[i].value;
            }
        }
        v_dateTo = document.test.inputdateTo.value;
        v_dateFrom = document.test.inputdateFrom.value;
        if (xmlHttpRe) {

            xmlHttpRe.open("GET", "showScheClient?pageNumber=" + getText + "&roomid=" + v_room + "&inputdateTo=" + v_dateTo + "&inputdateFrom=" + v_dateFrom + "&shiftType=" + v_shift, true);// chú ý
            xmlHttpRe.onreadystatechange = handleResponse;
            xmlHttpRe.send(null);
        }
    }
    function goPage()
    {
        var c_value = "";
        c_value = document.test.go.value;
        var v_room = "";
        var v_shift = "";
        var v_dateTo = "";
        var v_dateFrom = "";
        for (var i = 0; i < document.test.roomname.length; i++)

        {
            if (document.test.roomname[i].selected)
            {
                v_room += (v_room ? '/' : '') + document.test.roomname[i].value;
            }
        }
        for (var i = 0; i < document.test.shiftType.length; i++)

        {
            if (document.test.shiftType[i].selected)
            {
                v_shift += (v_shift ? '/' : '') + document.test.shiftType[i].value;
            }
        }
        v_dateTo = document.test.inputdateTo.value;
        v_dateFrom = document.test.inputdateFrom.value;
        new setXMLHttpRe();
        var getText = c_value;  //Used to prevent caching during ajax call
        if (xmlHttpRe) {

            xmlHttpRe.open("GET", "showScheClient?pageNumber=" + c_value + "&roomid=" + v_room + "&inputdateTo=" + v_dateTo + "&inputdateFrom=" + v_dateFrom + "&shiftType=" + v_shift, true);// chú ý
            xmlHttpRe.onreadystatechange = handleResponse;
            xmlHttpRe.send(null);
        }
    }
    function Search()
    {
        var v_room = "";
        var v_shift = "";
        var v_dateTo = "";
        var v_dateFrom = "";
        for (var i = 0; i < document.test.roomname.length; i++)

        {
            if (document.test.roomname[i].selected)
            {
                v_room += (v_room ? '/' : '') + document.test.roomname[i].value;
            }
        }
        for (var i = 0; i < document.test.shiftType.length; i++)

        {
            if (document.test.shiftType[i].selected)
            {
                v_shift += (v_shift ? '/' : '') + document.test.shiftType[i].value;
            }
        }
        v_dateTo = document.test.inputdateTo.value;
        v_dateFrom = document.test.inputdateFrom.value;
        new setXMLHttpRe();
        var getText = v_room;  //Used to prevent caching during ajax call
        var getShift = v_shift;
        if (xmlHttpRe) {

            xmlHttpRe.open("GET", "showScheClient?roomid=" + getText + "&inputdateTo=" + v_dateTo + "&inputdateFrom=" + v_dateFrom + "&shiftType=" + getShift, true);// chú ý
            xmlHttpRe.onreadystatechange = handleResponse;
            xmlHttpRe.send(null);
        }
    }
    
    function handleResponse() {
        var parser = new DOMParser();
        if (xmlHttpRe.readyState === 4) {
            if (xmlHttpRe.status === 200) {
                //document.getElementById("fcuk").innerHTML = xmlHttpRe.responseText; //Update the HTML Form element
                var responseDoc = parser.parseFromString(xmlHttpRe.responseText, "text/html");
                document.getElementById("fcuk").innerHTML = responseDoc.getElementById("fcuk").innerHTML;
            }
            else {
                alert("Không kết nối được với Server");
            }
        }
    }

    
    function Export()
    {
        var typeRP = <%=String.valueOf(ReportConstant.TYPE_TIME_TABLE) %>;
        var duoiFileRP = "<%=ReportConstant.DUOI_XLS %>";
        var fromRP = "<%=inputdateFrom %>";
        var toRP = "<%=inputdateTo %>";
        var labRP = 1;

        for (var i = 0; i < document.test.roomname.length; i++)

        {
            if (document.test.roomname[i].selected)
            {
                labRP = document.test.roomname[i].value;
            }
        }
        
        toRP = document.test.inputdateTo.value;
        fromRP = document.test.inputdateFrom.value;
        
        window.open("ShowReport?typeRP=" + typeRP + "&duoiFileRP=" + duoiFileRP + "&fromRP=" + fromRP + "&toRP=" + toRP + "&labRP=" + labRP,"_blank");
    }


</script>


<%!
    int pageSelected;
%>
<%
    List list = (List) session.getAttribute("Schedule");
%>  

<%
    List pageNumbers = (List) session.getAttribute("pages");
    
%>  

<form action="../updateSchedule" name="test" id="test" method="post">
    <table cellpadding="1px" cellspacing="1px" width="950px" align="center"> 
        <%
        
        %>
        
        <tr >

            <td style="height: 50px;" colspan="9" align="right" >                       
                <select name="shiftType" style="width: 150px;height: 25px;">

                    <option value="1" <%=shiftType == 1 ? "selected" : ""%> >Morning Shift</option>
                    <option value="2" <%=shiftType == 2 ? "selected" : ""%> >Outgoing Shift</option>
                    <option value="3" <%=shiftType == 3 ? "selected" : ""%> >Night Shift</option>
                </select>
                <select name="roomname" style="width: 150px;height: 25px;">
                    <%
                        Connection cnn = null;
                        Statement st = null;
                        ResultSet rs = null;
                        String sql = "select * from tbl_labroom where status=1";
                        cnn = dbconnect.Connect();
                        try {
                            st = cnn.createStatement();
                            rs = st.executeQuery(sql);
                            while (rs.next()) {
                                
                                int roomID = rs.getInt("roomID");
                                if (checked == roomID) {
                    %>           
                    <option selected="selected" value="<%=roomID%>"><%=rs.getString("roomName")%></option>
                    <%
                    } else {
                    %>
                    <option value="<%=roomID%>"><%=rs.getString("roomName")%></option>
                    <%
                                }
                            }
                        } catch (Exception ex) {

                        } finally {
                            rs.close();
                            st.close();
                            cnn.close();
                        }
                    %>
                </select>

                <input type="text" name="inputdateFrom" value="<%=request.getAttribute("inputdateFrom") == null ? "" : request.getAttribute("inputdateFrom")%>" id="txtDateFrom" class="validate[custom[date]]" placeholder="YYYY/MM/DD (Date From)" style="width: 200px;height: 20px;" />
                <input type="text" name="inputdateTo" value="<%=request.getAttribute("inputdateTo") == null ? "" : request.getAttribute("inputdateTo")%>" id="txtDateTo" class="validate[custom[date]]" placeholder="YYYY/MM/DD (Date To)" style="width: 200px; height: 20px;" />

                &nbsp;&nbsp;&nbsp;<input type="button" value="Search" class="button_example" onclick= "Search();" />
                &nbsp;&nbsp;&nbsp;<input type="button" value="Export Time Table" class="button_example" onclick= "Export();" />
            </td>

        </tr> 
    </table>
    <table cellpadding="1px" cellspacing="1px" id="fcuk" width="950px" align="center"> 
        <tr> 

            <td colspan="8" align="right">  
                <!--<form method="get" action="NewServlet">  -->
                <table align="right">  
                    <tr> 

                        <%--Fist--%>
                        <td>
                            <div id="container" style="margin-bottom:20px">
                                <div class="pagination">
                                    <%
                                        pageSelected = 1;
                                        if (request.getParameter("pageNumber") != null) {
                                            pageSelected = Integer.parseInt(request.getParameter("pageNumber"));
                                        }
                                        if (pageSelected > 1) {

                                    %>
                                    <li class="active" onclick="javascript:show(1);">
                                        First
                                    </li>
                                    <%                                    } else {
                                    %>
                                    <li class="active-max" onclick="javascript:show(1);">
                                        First
                                    </li>
                                    <%
                                        }
                                    %>
                                </div>
                            </div>
                        </td>
                        <%--Fist--%>
                        <%--Last--%>
                        <td>
                            <div id="container" style="margin-bottom:20px">
                                <div class="pagination">
                                    <%
                                        pageSelected = 1;
                                        if (request.getParameter("pageNumber") != null) {
                                            pageSelected = Integer.parseInt(request.getParameter("pageNumber"));
                                        }
                                        if (pageSelected == Integer.parseInt((pageNumbers.size() + "").trim())) {

                                    %>
                                    <li class="active-max" onclick="javascript:show(<%=pageNumbers.size()%>);">
                                        Last
                                    </li>
                                    <%
                                    } else {
                                    %>
                                    <li class="active" onclick="javascript:show(<%=pageNumbers.size()%>);">
                                        Last
                                    </li>
                                    <%
                                        }
                                    %>
                                </div>
                            </div>
                        </td>
                        <%--Last--%>

                        <%
                            int numberPage = pageNumbers.size();
                            int cnt = 6;
                            pageSelected = 1;
                            if (request.getParameter("pageNumber") != null) {
                                pageSelected = Integer.parseInt(request.getParameter("pageNumber"));
                                if (pageSelected < pageNumbers.size()) {
                                    cnt = pageSelected + 1;
                                } else {
                                    cnt = pageSelected;
                                }
                            }
                            if (numberPage <= 5) {
                                numberPage = pageNumbers.size();

                                for (int i = 0; i < numberPage; i++) {
                        %>  
                        <td width="27px">
                            <div id="container" style="margin-bottom:20px">
                                <div class="pagination">

<!--<a href="NewServlet?pageNumber=<%=pageNumbers.get(i)%>"><%=pageNumbers.get(i)%></a>-->
                                    <%

                                        if (pageSelected == Integer.parseInt(pageNumbers.get(i).toString())) {
                                    %>
                                    <li class="actived" onclick="javascript:show(<%=pageNumbers.get(i)%>);">
                                        <%=pageNumbers.get(i)%>
                                    </li>
                                    <%
                                    } else {
                                    %>
                                    <li class="active" onclick="javascript:show(<%=pageNumbers.get(i)%>);">
                                        <%=pageNumbers.get(i)%>
                                    </li>
                                    <%
                                        }

                                    %>

                                </div>
                            </div>
                        </td>  

                        <%                                    }
                        } else if (numberPage > 5) {

                            if (pageSelected <= 5) {
                                for (int i = 0; i < 6; i++) {
                        %>
                        <td width="27px">
                            <div id="container" style="margin-bottom:20px">
                                <div class="pagination">

<!--<a href="NewServlet?pageNumber=<%=pageNumbers.get(i)%>"><%=pageNumbers.get(i)%></a>-->
                                    <%

                                        if (pageSelected == Integer.parseInt(pageNumbers.get(i).toString())) {
                                    %>
                                    <li class="actived" onclick="javascript:show(<%=pageNumbers.get(i)%>);">
                                        <%=pageNumbers.get(i)%>
                                    </li>
                                    <%
                                    } else {
                                    %>
                                    <li class="active" onclick="javascript:show(<%=pageNumbers.get(i)%>);">
                                        <%=pageNumbers.get(i)%>
                                    </li>
                                    <%
                                        }

                                    %>

                                </div>
                            </div>
                        </td> 
                        <%                                    }
                        } else if (pageSelected > 5) {
                            if (cnt < pageNumbers.size()) {

                                for (int i = (cnt - 6); i < cnt; i++) {

                        %>
                        <td width="27px">
                            <div id="container" style="margin-bottom:20px">
                                <div class="pagination">

<!--<a href="NewServlet?pageNumber=<%=pageNumbers.get(i)%>"><%=pageNumbers.get(i)%></a>-->
                                    <%

                                        if (pageSelected == Integer.parseInt(pageNumbers.get(i).toString())) {
                                    %>
                                    <li class="actived" onclick="javascript:show(<%=pageNumbers.get(i)%>);">
                                        <%=pageNumbers.get(i)%>
                                    </li>
                                    <%
                                    } else {
                                    %>
                                    <li class="active" onclick="javascript:show(<%=pageNumbers.get(i)%>);">
                                        <%=pageNumbers.get(i)%>
                                    </li>
                                    <%
                                        }
                                    %>

                                </div>
                            </div>
                        </td> 
                        <%                                                         } //test    
                        } else if (cnt == pageNumbers.size()) {
                            for (int i = (cnt - 6); i < cnt; i++) {
                        %>
                        <td width="27px">
                            <div id="container" style="margin-bottom:20px">
                                <div class="pagination">

<!--<a href="NewServlet?pageNumber=<%=pageNumbers.get(i)%>"><%=pageNumbers.get(i)%></a>-->
                                    <%

                                        if (pageSelected == Integer.parseInt(pageNumbers.get(i).toString())) {
                                    %>
                                    <li class="actived" onclick="javascript:show(<%=pageNumbers.get(i)%>);">
                                        <%=pageNumbers.get(i)%>
                                    </li>
                                    <%
                                    } else {
                                    %>
                                    <li class="active" onclick="javascript:show(<%=pageNumbers.get(i)%>);">
                                        <%=pageNumbers.get(i)%>
                                    </li>
                                    <%
                                        }
                                    %>

                                </div>
                            </div>
                        </td> 
                        <%
                                        }
                                    }
                                }
                            }
                        %>  
                        <td>
                        </td>

                        <%--Next--%>
                        <td>

                            <div id="container" style="margin-bottom:20px">
                                <div class="pagination">
                                    <%
                                        int nextpage = pageSelected;
                                        if (nextpage == Integer.parseInt((pageNumbers.size() + "").trim())) {

                                    %>
                                    <li class="active-max" onclick="javascript:show(<%=nextpage%>);">
                                        Next
                                    </li>

                                    <%
                                    } else {

                                    %>
                                    <li class="active" onclick="javascript:show(<%=(nextpage + 1)%>);">
                                        Next
                                    </li>
                                    <%
                                        }
                                    %>
                                </div>
                            </div>
                        </td>
                        <%--Next--%>
                        <%--Previous--%>
                        <td>

                            <div id="container" style="margin-bottom:20px">
                                <div class="pagination">
                                    <%
                                        int previous = pageSelected;
                                        if (previous == 1) {

                                    %>
                                    <li class="active-max" onclick="javascript:show(<%=previous%>);">
                                        Previous
                                    </li>

                                    <%
                                    } else {

                                    %>
                                    <li class="active" onclick="javascript:show(<%=(previous - 1)%>);">
                                        Previous
                                    </li>
                                    <%
                                        }
                                    %>
                                </div>
                            </div>
                        </td>

                        <%--Previous--%>
                        <td>
                            <input type="text" class="" name="go" id="go" size="3" value="" />&nbsp;&nbsp;&nbsp;<input type="button" class="button_example" style="height: 25px" value="Go" onclick= "goPage();" />
                        </td>
                        <td><span>Page: 
                                <%=pageSelected%>/<%=pageNumbers.size()%>
                            </span></td>
                    </tr>  
                </table>  
                <!-- </form>   -->
            </td>  
        </tr>  

        <tr bgcolor="#78bbe3" >
            <td class="td-show" style="color: white;" width="100px" height="50px" align="center">Shift Name<br />/Date</td>
            <%
                Connection cnn2 = null;
                Statement st2 = null;
                ResultSet rs2 = null;
                String sql2 = "select * from tbl_shiftname where status=1 and shiftType=" + shiftType + "  ";
                cnn2 = dbconnect.Connect();
                try {
                    st2 = cnn2.createStatement();
                    rs2 = st2.executeQuery(sql2);
                    while (rs2.next()) {
            %>
            <td class="td-show" style="color: white;" width="90px" align="center"><span title="<%=rs2.getTime("starttime").toString().substring(0, 5)%>-<%=rs2.getTime("endtime").toString().substring(0, 5)%>"><%=rs2.getString("shiftname")%></span></td>
                <%
                        }
                    } catch (Exception ex3) {

                    } finally {
                        try {
                            rs2.close();
                            st2.close();
                            cnn2.close();
                        } catch (Exception ex4) {

                        }
                    }
                %>
            <td class="td-show"  style="color: white;" width="170px" align="center">Date</td>
        </tr>  


        <%
            String color = "style='background: #e7f5fe;height:30px'";
            for (int i = (list.size() - 1); i >= 0; i--) {
                System.out.println("-list.size()-"+list.size());    
                out.println("<tr>");
        %>  

        <%
            classSchedule studentDetailsDTO = (classSchedule) list
                    .get(i);
            out.println("<td style='background: #dfefff;height:30px;color:black;' align=\"center\">" + studentDetailsDTO.getKeyword()
                    + "</td>");
            String[] strGetStatus = studentDetailsDTO.getStatus().split("/");
            String[] strGetID = studentDetailsDTO.getId().split("/");
            //for (int j = (strGetStatus.length - 1); j >= 0; j--) {
            for (int j = 0; j <= (strGetStatus.length - 1); j++) {
                totalRequestByScheID totalRq = new totalRequestByScheID();
                if (Integer.parseInt(strGetStatus[j].trim()) == 1) {
                    checkRequest check = new checkRequest();

                    if (check.checkStatusRequest(Integer.parseInt(strGetID[j])) == 2) {
                        out.println("<td style='background: #bbff84;height:30px' align=\"center\"><img src=\"img/available.png\" /></td>");
                    } else if (check.checkStatusRequest(Integer.parseInt(strGetID[j])) == 0) {
                        out.println("<td style='background: #fffdc1;height:30px' align=\"center\"><a title=\"Total Request: " + totalRq.total(Integer.parseInt(strGetID[j])) + "\" href=\"?option=sendRequest&sid=" + strGetID[j] + "\"><img src=\"img/available.png\" /></a></td>");
                    } else {
                        out.println("<td style='background: #ececec;height:30px' align=\"center\"><a title=\"Total Request: " + totalRq.total(Integer.parseInt(strGetID[j])) + "\" href=\"?option=sendRequest&sid=" + strGetID[j] + "\"><img src=\"img/available.png\" /></a></td>");
                    }
                } else if (Integer.parseInt(strGetStatus[j].trim()) == 0) {
                    out.println("<td style='background: #ffe6e6;height:30px' align=\"center\"><img src=\"img/not-available.png\" /></td>");
                } else if (Integer.parseInt(strGetStatus[j].trim()) == 2) {
                    out.println("<td style='background: #efffc7;height:30px' align=\"center\"></td>");
                }
            }
            out.println("<td style='background: #dfefff;height:30px;color:black;' align=\"center\">" + studentDetailsDTO.getDateword()
                    + "</td>");
            out.println("</tr>");
        %>  


        <%                }
            out.println("</tr>");
        %>  

    </table> 
</form>
<table cellpadding="1px" cellspacing="1px"  width="950px" align="center"> 
    <tr>
        <td><br/>Note:</td>
    </tr>
    <tr>
        <td colspan="2">
            <img src="img/khonglamviec.png" />
        </td>
        <td colspan="2">
            <img src="img/chuachon.png" />
        </td>   
        <td colspan="2">
            <img src="img/dangcho.png" />
        </td>  
        <td colspan="2">
            <img src="img/daduyet.png" />
        </td>           
    </tr>
    <tr>
        <td  colspan="2">
            &nbsp;&nbsp;&nbsp;No working
        </td>
        <td colspan="2">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Empty
        </td>   
        <td colspan="2">
            Waiting approve
        </td>  
        <td colspan="2">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Approved
        </td>  
    </tr>
</table> 
<script type="text/javascript">

    var form = $('#test');
    $('#content').hide();//chu y
    form.submit(function() {

        $.ajax({
            type: form.attr('method'),
            url: form.attr('action'),
            data: form.serialize(),
            success: function(data) {
                var result = data;

                $('#content').show().html(result).fadeOut(3000, function() {
                    window.location.href = "?options=ManagerSchedule";
                });
            }
        });

        return false;
    }); </script>