
<%@page import="complaint.classComplaint"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="computerlabs.dbconnect"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<%@page import="java.util.List"%>  


        <link rel="stylesheet" href="../css/cssvalidate/validationEngine.jquery.css" type="text/css"/> 
        <link rel="stylesheet" href="../css/cssvalidate/template.css" type="text/css"/> 
        <link rel="stylesheet" href="../css/jquery-ui.min.css" />
        <script src="../js/jsvalidate/jquery-1.8.2.min.js" type="text/javascript"></script> 
        <script src="../js/jquery-ui.min.js"></script>
        <script src="../js/jsvalidate/languages/jquery.validationEngine-en.js" type="text/javascript" charset="utf-8"></script> 
        <script src="../js/jsvalidate/jquery.validationEngine.js" type="text/javascript" charset="utf-8"></script> 
        <script type="text/javascript">
            jQuery(document).ready(function() {
                // binds form submission and fields to the validation engine 
                //jQuery("#ajaxform").validationEngine();
                $("#txtDateFrom").datepicker({
                    dateFormat: "yy/mm/dd"
                });
                $("#txtDateTo").datepicker({
                    dateFormat: "yy/mm/dd"
                });
            });
            function BASIC_SelectItem(act, id)
            {
                
                var getID = id;
                var getACT = act;
                document.ajaxform.ID.value = getID;
                document.ajaxform.act.value = getACT;
                if(act == 'update' ){
                    mySubmit();
                }
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
            function show(pagenumber, status) {
                new setXMLHttpRe();
                var getText = pagenumber;  //Used to prevent caching during ajax call
                var strStatus = "&status=" + status;
                var v_dateTo = "";
                var v_dateFrom = "";
                v_dateTo = document.ajaxform.txtDateTo.value;
                v_dateFrom = document.ajaxform.txtDateFrom.value;
                if (xmlHttpRe) {

                    xmlHttpRe.open("GET", "../showComplaint?pageNumber=" + getText + strStatus + "&inputdateTo=" + v_dateTo + "&inputdateFrom=" + v_dateFrom, true);// chú ý
                    xmlHttpRe.onreadystatechange = handleResponse;
                    xmlHttpRe.send(null);
                }
            }
            function goPage(status)
            {
                var c_value = "";
                c_value = document.ajaxform.go.value;
                var v_dateTo = "";
                var v_dateFrom = "";
                v_dateTo = document.ajaxform.txtDateTo.value;
                v_dateFrom = document.ajaxform.txtDateFrom.value;
                new setXMLHttpRe();
                var getText = c_value;  //Used to prevent caching during ajax call
                var strStatus = "&status=" + status;
                if (xmlHttpRe) {

                    xmlHttpRe.open("GET", "../showComplaint?pageNumber=" + c_value + strStatus + "&inputdateTo=" + v_dateTo + "&inputdateFrom=" + v_dateFrom, true);// chú ý
                    xmlHttpRe.onreadystatechange = handleResponse;
                    xmlHttpRe.send(null);
                }
            }
            function Search()
            {
                var v_status = "";
                v_status = document.ajaxform.status.value;
                var v_dateTo = "";
                var v_dateFrom = "";
                v_dateTo = document.ajaxform.txtDateTo.value;
                v_dateFrom = document.ajaxform.txtDateFrom.value;
                new setXMLHttpRe();
                if (xmlHttpRe) {

                    xmlHttpRe.open("GET", "../showComplaint?status=" + v_status + "&inputdateTo=" + v_dateTo + "&inputdateFrom=" + v_dateFrom, true);// chú ý
                    xmlHttpRe.onreadystatechange = handleResponse;
                    xmlHttpRe.send(null);
                }
            }
            function handleResponse() {
                var parser      = new DOMParser ();
                if (xmlHttpRe.readyState === 4) {
                    if (xmlHttpRe.status === 200) {
                        var responseDoc = parser.parseFromString (xmlHttpRe.responseText, "text/html");
                        //document.getElementById("fcuk").innerHTML = xmlHttpRe.responseText; //Update the HTML Form element
                        document.getElementById("fcuk").innerHTML = responseDoc.getElementById("fcuk").innerHTML;
                    }
                    else {
                        alert("Can not connect Server");
                    }
                }
            }

        </script>
<script>
    function mySubmit() {
        
        //var vali = jQuery("#ajaxform").validationEngine('validate');
        
        var form = $('#ajaxform');
        //if (vali === true) {
            console.log("---4---");
            $('#ajaxform').submit(function(e) {
                e.preventDefault();
                $.ajax({
                    type: 'post',
                    url: '../updateUserProcess',
                    data: form.serialize(),
                    success: function(data) {
                        var result = data;
                        $('#content').show().html(result).fadeOut(4000, function() {
                            window.location.href = "?options=ManagerComplaint";
                        });
                    }
                });
                
                //return false;
            }); 
//        } else {
//            
//        }

    }

    jQuery(document).ready(function() {
        $('#content').hide();//chu y
        // binds form submission and fields to the validation engine 
        jQuery("#ajaxform").validationEngine();

    });
</script>    


        <%!
            int pageSelected;
        %>
        <%
            List list = (List) session.getAttribute("complaintDetails");
        %>  

        <%
            List pageNumbers = (List) session.getAttribute("pages");
        %>  

        <form  name="ajaxform" id="ajaxform" method="post">
            <table cellpadding="1px" cellspacing="1px" border="0" width="950px" align="center">  
                <tr >

                    <td colspan="4" style="height: 30px" >
                        <input type="text" name="inputdateFrom" value="<%=request.getAttribute("inputdateFrom") == null ? "" : request.getAttribute("inputdateFrom")%>" id="txtDateFrom" class="validate[custom[date]]" placeholder="YYYY/MM/DD (Date From)" style="width: 200px;height: 20px;" />
                        <input type="text" name="inputdateTo" value="<%=request.getAttribute("inputdateTo") == null ? "" : request.getAttribute("inputdateTo")%>" id="txtDateTo" class="validate[custom[date]]" placeholder="YYYY/MM/DD (Date To)" style="width: 200px; height: 20px;" />
                        <select name="status">
                            <%
                                if (request.getAttribute("statusSelected") != null) {
                                    if (Integer.parseInt(request.getAttribute("statusSelected").toString().trim()) == 0) {
                            %>
                            <option value="3">Status ALL</option>
                            <option selected="selected" value="0">Process</option>
                            <option value="1">Processing</option>
                            <option value="2">Processed</option>
                            <%
                            } else if (Integer.parseInt(request.getAttribute("statusSelected").toString().trim()) == 1) {
                            %>
                            <option value="3">Status ALL</option>
                            <option  value="0">Process</option>
                            <option selected="selected" value="1">Processing</option>
                            <option value="2">Processed</option>
                            <%
                            } else if (Integer.parseInt(request.getAttribute("statusSelected").toString().trim()) == 2) {
                            %>
                            <option value="3">Status ALL</option>
                            <option  value="0">Process</option>
                            <option value="1">Processing</option>
                            <option selected="selected"  value="2">Processed</option>
                            <%
                            } else {
                            %>
                            <option value="3">Status ALL</option>
                            <option  value="0">Process</option>
                            <option value="1">Processing</option>
                            <option  value="2">Processed</option>
                            <%
                                }
                            } else {
                            %>
                            <option value="3">Status ALL</option>
                            <option  value="0">Process</option>
                            <option value="1">Processing</option>
                            <option  value="2">Processed</option>
                            <%
                                }
                            %>
                        </select>
                        <input type="button" class="button_example" onclick="Search(<%=pageSelected%>);" value="Search"/>
                    </td>
                </tr>  
            </table>
            <table cellpadding="1px" cellspacing="1px" border="0" id="fcuk" width="950px" align="center"> 

                <tr>  

                    <td colspan="4" align="right">  
                        <!--<form method="get" action="NewServlet">  -->
                        <table>  
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
                                            <li class="active" onclick="javascript:show(1,<%=request.getAttribute("statusSelected") == null ? 3 : request.getAttribute("statusSelected")%>);">
                                                First
                                            </li>
                                            <%                                    } else {
                                            %>
                                            <li class="active-max" onclick="javascript:show(1,<%=request.getAttribute("statusSelected") == null ? 3 : request.getAttribute("statusSelected")%>);">
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
                                            <li class="active-max" onclick="javascript:show(<%=pageNumbers.size()%>,<%=request.getAttribute("statusSelected") == null ? 3 : request.getAttribute("statusSelected")%>);">
                                                Last
                                            </li>
                                            <%
                                            } else {
                                            %>
                                            <li class="active" onclick="javascript:show(<%=pageNumbers.size()%>,<%=request.getAttribute("statusSelected") == null ? 3 : request.getAttribute("statusSelected")%>);">
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
                                    for (int i = 0; i < pageNumbers.size(); i++) {
                                %>  
                                <td width="27px">
                                    <div id="container" style="margin-bottom:20px">
                                        <div class="pagination">

<!--<a href="NewServlet?pageNumber=<%=pageNumbers.get(i)%>"><%=pageNumbers.get(i)%></a>-->
                                            <%
                                                if (pageSelected == Integer.parseInt(pageNumbers.get(i).toString())) {
                                            %>
                                            <li class="actived" onclick="javascript:show(<%=pageNumbers.get(i)%>,<%=request.getAttribute("statusSelected") == null ? 3 : request.getAttribute("statusSelected")%>);">
                                                <%=pageNumbers.get(i)%>
                                            </li>
                                            <%
                                            } else {
                                            %>
                                            <li class="active" onclick="javascript:show(<%=pageNumbers.get(i)%>,<%=request.getAttribute("statusSelected") == null ? 3 : request.getAttribute("statusSelected")%>);">
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
                                            <li class="active-max" onclick="javascript:show(<%=nextpage%>,<%=request.getAttribute("statusSelected") == null ? 3 : request.getAttribute("statusSelected")%>);">
                                                Next
                                            </li>

                                            <%
                                            } else {

                                            %>
                                            <li class="active" onclick="javascript:show(<%=(nextpage + 1)%>,<%=request.getAttribute("statusSelected") == null ? 3 : request.getAttribute("statusSelected")%>);">
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
                                            <li class="active-max" onclick="javascript:show(<%=previous%>,<%=request.getAttribute("statusSelected") == null ? 3 : request.getAttribute("statusSelected")%>);">
                                                Previous
                                            </li>

                                            <%
                                            } else {

                                            %>
                                            <li class="active" onclick="javascript:show(<%=(previous - 1)%>,<%=request.getAttribute("statusSelected") == null ? 3 : request.getAttribute("statusSelected")%>);">
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
                                    <input type="text" class="" name="go" id="go" size="3" value="" /><input type="button" value="Go" onclick= "goPage(<%=request.getAttribute("statusSelected") == null ? 3 : request.getAttribute("statusSelected")%>);" />
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

                    <td class="td-show" width="250px" align="center">Type name</td>
                    <td class="td-show" width="200px" align="center">User Send</td>
                    <td class="td-show" width="200px" align="center">User Process</td>
                    <td class="td-show" width="100px" align="center">Date Send</td>
                    <td class="td-show" width="100px" align="center">Status</td>
                    <td class="td-show" width="100px" align="center" colspan="2" >Action</td>
                </tr>  
                <%
                    String color = "style='background: #e7f5fe;height:30px'";

                    String statusN = "";
                    if (request.getAttribute("statusSelected") != null) {
                        statusN = "&status=" + request.getAttribute("statusSelected");
                    }
                    String inputdateFrom = "";
                    String inputdateTo = "";
                    if (request.getAttribute("inputdateTo") != null) {
                        inputdateTo = "&inputdateTo=" + request.getAttribute("inputdateTo");
                    }
                    if (request.getParameter("inputdateFrom") != null) {
                        inputdateFrom = "&inputdateFrom=" + request.getParameter("inputdateFrom");
                    }
                    for (int i = 0; i < list.size(); i++) {
                %>  
                <tr>  
                    <%
                        classComplaint studentDetailsDTO = (classComplaint) list
                                .get(i);
                        if (i % 2 == 0) {
                            out.println("<td style='height:30px' align=\"center\">" + studentDetailsDTO.getTitle()
                                    + "</td>");
                            out.println("<td style='height:30px' align=\"center\">" + studentDetailsDTO.getUserSend()
                                    + "</td>");
                            if (request.getParameter("cID") != null) {
                                if (Integer.parseInt(request.getParameter("cID").toString().trim()) == studentDetailsDTO.getComplaintID()) {
                    %>
                    <td  class="row-td-backgroud-select" align="center">
                        <select name="userProcessUp">
                            <%
                                Connection cnn = null;
                                Statement st = null;
                                ResultSet rs = null;
                                String sql = "select userID,fullname from tbl_user where departmentID=3 and [status]=1";
                                cnn = dbconnect.Connect();
                                try {
                                    st = cnn.createStatement();
                                    rs = st.executeQuery(sql);
                                    while (rs.next()) {
                                        int userID = rs.getInt("userID");
                                        String userName = rs.getString("fullname");
                                        if (studentDetailsDTO.getUserProcess().equalsIgnoreCase(userName)) {
                            %>
                            <option selected value="<%=userID%>"><%=userName%></option>
                            <%
                            } else {
                            %>
                            <option value="<%=userID%>"><%=userName%></option>
                            <%
                                        }
                                    }
                                } catch (Exception ex) {

                                } finally {
                                    try {
                                        rs.close();
                                        st.close();
                                        cnn.close();
                                    } catch (Exception ex) {

                                    }
                                }
                            %>
                        </select>
                    </td>
                    <%
                            } else {
                                out.println("<td style='height:30px' align=\"center\">" + studentDetailsDTO.getUserProcess()
                                        + "</td>");
                                out.println("<td style='height:30px' align=\"center\">" + studentDetailsDTO.getDateSend()
                                        + "</td>");
                                out.println("<td style='height:30px' align=\"center\">" + studentDetailsDTO.getStatus()
                                        + "</td>");
                            }
                        } else {
                            out.println("<td style='height:30px' align=\"center\">" + studentDetailsDTO.getUserProcess()
                                    + "</td>");
                            out.println("<td style='height:30px' align=\"center\">" + studentDetailsDTO.getDateSend()
                                    + "</td>");
                            out.println("<td style='height:30px' align=\"center\">" + studentDetailsDTO.getStatus()
                                    + "</td>");
                        }
                    %>

                    <%
                        if (request.getParameter("cID") != null) {
                            if (Integer.parseInt(request.getParameter("cID").toString().trim()) == studentDetailsDTO.getComplaintID()) {
                                out.println("<td style='height:30px' align=\"center\">" + studentDetailsDTO.getDateSend()
                                        + "</td>");
                                out.println("<td style='height:30px' align=\"center\">" + studentDetailsDTO.getStatus()
                                        + "</td>");
                    %>
                    <td align='center' style="height:30px;width: 40px;">
                        <input title="Update" type="submit" style="background: url('../img/edit2.png');width: 23px;height: 23px;" name="update" onclick="BASIC_SelectItem('update',<%=studentDetailsDTO.getComplaintID()%>)" class="button_img" height="20px" value="" />
                    </td>
                    <td align='center' style="height:30px;width: 40px;"><a href="?options=ManagerComplaint"><img src="../img/back.png" width="23px" height="20px" /></a></td>
                            <%
                            } else {

                            %>
                    <td align='center' style="height:30px;width: 40px;">
                        <%                            if (!studentDetailsDTO.getStatus().equalsIgnoreCase("Processed")) {
                        %>
                        <a  title="?options=ManagerComplaint<%=inputdateFrom%><%=inputdateTo%><%=statusN%>&pageNumber=<%=pageSelected%>&cID=<%=studentDetailsDTO.getComplaintID()%>" href="?options=ManagerComplaint<%=statusN%>&pageNumber=<%=pageSelected%>&cID=<%=studentDetailsDTO.getComplaintID()%>"><img src="../img/edit.png" width="23px" height="23px" /></a>
                            <%
                                }
                            %>
                    </td>
                    <td align='center' style="height:30px;width: 40px;">

                        <a href="?options=complaintDetails&cID=<%=studentDetailsDTO.getComplaintID()%>"><img src="../img/preview.png" width="23px" height="23px" /></a>
                    </td>
                    <%
                        }
                    } else {
                    %>
                    <td align='center' style="height:30px;width: 40px;">
                        <%
                            if (!studentDetailsDTO.getStatus().equalsIgnoreCase("Processed")) {
                        %>
                        <a href="?options=ManagerComplaint<%=inputdateFrom%><%=inputdateTo%><%=statusN%>&pageNumber=<%=pageSelected%>&cID=<%=studentDetailsDTO.getComplaintID()%>"><img src="../img/edit.png" width="23px" height="23px" /></a>
                            <%
                                }
                            %>
                    </td>
                    <td align='center' style="height:30px;width: 40px;">

                        <a href="?options=complaintDetails&cID=<%=studentDetailsDTO.getComplaintID()%>"><img src="../img/preview.png" width="23px" height="23px" /></a>
                    </td>
                    <%
                        }
                    %>
                    <%
                        //out.println("<td style='height:30px' align=\"center\"><a href=\"?options=manageruser&id=" + studentDetailsDTO.getId() + "\" title=\"Delete User\"><img src=\"../img/delete.png\" width=\"20px\" height=\"20px\"></a></td>");
                    } else {
                        out.println("<td  " + color + " align=\"center\">" + studentDetailsDTO.getTitle()
                                + "</td>");
                        out.println("<td  " + color + " align=\"center\">" + studentDetailsDTO.getUserSend()
                                + "</td>");
                        if (request.getParameter("cID") != null) {
                            if (Integer.parseInt(request.getParameter("cID").toString().trim()) == studentDetailsDTO.getComplaintID()) {
                    %>
                    <td  class="row-td-backgroud-select" style="background: #e7f5fe;height:30px" align="center">
                        <select name="userProcessUp">
                            <%
                                Connection cnn = null;
                                Statement st = null;
                                ResultSet rs = null;
                                String sql = "select userID,fullname from tbl_user where departmentID=3 and [status]=1";
                                cnn = dbconnect.Connect();
                                try {
                                    st = cnn.createStatement();
                                    rs = st.executeQuery(sql);
                                    while (rs.next()) {
                                        int userID = rs.getInt("userID");
                                        String userName = rs.getString("fullname");
                                        if (studentDetailsDTO.getUserProcess().equalsIgnoreCase(userName)) {
                            %>
                            <option selected value="<%=userID%>"><%=userName%></option>
                            <%
                            } else {
                            %>
                            <option value="<%=userID%>"><%=userName%></option>
                            <%
                                        }
                                    }
                                } catch (Exception ex) {

                                } finally {
                                    try {
                                        rs.close();
                                        st.close();
                                        cnn.close();
                                    } catch (Exception ex) {

                                    }
                                }
                            %>
                        </select>
                    </td>
                    <%
                            } else {
                                out.println("<td  " + color + " align=\"center\">" + studentDetailsDTO.getUserProcess()
                                        + "</td>");
                                out.println("<td  " + color + " align=\"center\">" + studentDetailsDTO.getDateSend()
                                        + "</td>");
                                out.println("<td  " + color + " align=\"center\">" + studentDetailsDTO.getStatus()
                                        + "</td>");
                            }
                        } else {
                            out.println("<td  " + color + " align=\"center\">" + studentDetailsDTO.getUserProcess()
                                    + "</td>");
                            out.println("<td  " + color + " align=\"center\">" + studentDetailsDTO.getDateSend()
                                    + "</td>");
                            out.println("<td  " + color + " align=\"center\">" + studentDetailsDTO.getStatus()
                                    + "</td>");
                        }
                    %>

                    <%
                        if (request.getParameter("cID") != null) {
                            if (Integer.parseInt(request.getParameter("cID").toString().trim()) == studentDetailsDTO.getComplaintID()) {
                                out.println("<td  " + color + " align=\"center\">" + studentDetailsDTO.getDateSend()
                                        + "</td>");
                                out.println("<td  " + color + " align=\"center\">" + studentDetailsDTO.getStatus()
                                        + "</td>");
                    %>
                    <td align='center' style="background: #e7f5fe;height:30px;width: 40px;">

                        <input title="Update" type="submit" style="background: url('../img/edit2.png');width: 23px;height: 23px;" name="update" onclick="BASIC_SelectItem('update',<%=studentDetailsDTO.getComplaintID()%>)" class="button_img" height="20px" value="" />
                    </td>
                    <td align='center' style="background: #e7f5fe;height:30px;width: 40px;"><a href="?options=ManagerComplaint"><img src="../img/back.png" width="23px" height="20px" /></a></td>
                            <%
                            } else {
                            %>
                    <td align='center' style="background: #e7f5fe;height:30px;width: 40px;">
                        <%
                            if (!studentDetailsDTO.getStatus().equalsIgnoreCase("Processed")) {
                        %>
                        <a href="?options=ManagerComplaint<%=inputdateFrom%><%=inputdateTo%><%=statusN%>&pageNumber=<%=pageSelected%>&cID=<%=studentDetailsDTO.getComplaintID()%>" title="?options=ManagerComplaint<%=statusN%>&pageNumber=<%=pageSelected%>&cID=<%=studentDetailsDTO.getComplaintID()%>"><img src="../img/edit.png" width="23px" height="23px" /></a>
                            <%
                                }
                            %>
                    </td>
                    <td align='center' style="background: #e7f5fe;height:30px;width: 40px;">

                        <a href="?options=complaintDetails&cID=<%=studentDetailsDTO.getComplaintID()%>"><img src="../img/preview.png" width="23px" height="23px" /></a>
                    </td>
                    <%
                        }
                    } else {
                    %>
                    <td align='center' style="background: #e7f5fe;height:30px;width: 40px;">
                        <%
                            if (!studentDetailsDTO.getStatus().equalsIgnoreCase("Processed")) {
                        %>
                        <a href="?options=ManagerComplaint<%=inputdateFrom%><%=inputdateTo%><%=statusN%>&pageNumber=<%=pageSelected%>&cID=<%=studentDetailsDTO.getComplaintID()%>"><img src="../img/edit.png" width="23px" height="23px" /></a>
                            <%
                                }
                            %>
                    </td>
                    <td align='center' style="background: #e7f5fe;height:30px;width: 40px;">

                        <a href="?options=complaintDetails&cID=<%=studentDetailsDTO.getComplaintID()%>"><img src="../img/preview.png" width="23px" height="23px" /></a>
                    </td>
                    <%
                        }
                    %>
                    <%
                            //out.println("<td " + color + " align=\"center\"><a href=\"?options=manageruser&id=" + studentDetailsDTO.getId() + "\" title=\"Delete User\"><img src=\"../img/delete.png\" width=\"20px\" height=\"20px\"></a></td>");
                        }

                    %>  
                </tr>  
                <%                }
                %>  

                <tr>
                    <td colspan="4" align="center">
                        <input type="hidden" name="ID" id="ID"   />
                        <input type="hidden" name="act" id="act"   />
                    </td>

                </tr>
                <tr>
                    <td colspan="4" align="center">
                        <div id='content' >
                        </div>
                    </td>
                </tr>
            </table> 
        </form>
   
