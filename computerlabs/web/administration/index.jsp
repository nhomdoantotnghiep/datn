<%-- 
    Document   : index
    Created on : Apr 14, 2014, 1:31:18 PM
    Author     : User
--%>
<%@include file="checkLogin.jsp" %>
<%    //administrations logout
    String op = "";
    String ops = "";
    if (request.getParameter("option") != null) {
        op = request.getParameter("option");
        if (op.equalsIgnoreCase("logout")) {
            session.removeAttribute("useradmin");
            response.sendRedirect("/computerlabs/?option=login");
            return;
        }
    }
    if(request.getParameter("options") != null){
        ops = request.getParameter("options");
    }
    String bgNotSelect = "bg-title2";
    String txtNotSelect = "text-title";
    String bgSelected = "bg-title";
    String txtSelected = "text-title-chil";
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Administration Page</title>
        <link href="css/pageadmin.css" rel="stylesheet" type="text/css" />
        <link href="css/csspaging.css" rel="stylesheet" type="text/css" />
        <link rel="stylesheet" href="css/contentcss.css" type="text/css"/>
    </head>
    <body>
        <div class="main">
            <div class="main-eml">
                <table class="main-top">
                    <tr>
                        <td></td>
                        <td valign="middle"  style="width: 200px;height: 31px;"><a href="#" class="link-admin">Welcome to: <%=session.getAttribute("useradmin") == null ? "" : session.getAttribute("useradmin")%></a></td>
                        <td style="width: 36px;height: 31px;"><a href="#"><img src="../img/info.png" width="36px" height="31px" /></a></td>
                        <td style="width: 36px;height: 31px;"><a href="#"><img src="../img/changepwd.png" width="36px" height="31px" /></a></td>
                        <td style="width: 33px;height: 31px;"><a href="?option=logout"><img src="../img/close.png" width="33px" height="31px" onclick="return confirm('Administration Logout?');" /></a></td>
                    </tr>
                </table>
                <div class="main-content">
                    <div class="main-content-left">
                        <table class="logo">
                            <tr>
                                <td rowspan="2" style="width: 47px;height: 72px"><img src="../img/logoadmin.png" width="47px" height="72px" /></td>
                                <td align="center"><span style="font-size: 22px;color: white;">Management</span></td>
                            </tr>
                            <tr>
                                <td align="center" valign="top"><span style="font-size: 22px;color: white;">Computer Labs</span></td>
                            </tr>
                        </table>
                        <table class="left-menu">
                            <tr>
                                <td valign="top" class="bg-title-td">
                                    <div class="bg-title2 ">
                                        <div class="text-title">Report Infomation</div>               
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td valign="top" class="bg-title-td">
                                    <div class="<%=ops.equalsIgnoreCase("ManagerSchedule") || ops.equalsIgnoreCase("CreateSchedule") || ops.equalsIgnoreCase("scheDetails")? bgSelected : bgNotSelect %>">
                                        <a class="<%=ops.equalsIgnoreCase("ManagerSchedule") || ops.equalsIgnoreCase("CreateSchedule") || ops.equalsIgnoreCase("scheDetails") ? txtSelected : txtNotSelect %>" href="?options=ManagerSchedule">Manager Schedule Work</a>
                                    </div>
                                </td>
                            </tr>
                            
                            
                            <tr>
                                <td valign="top" class="bg-title-td">
                                    <div class="<%=ops.equalsIgnoreCase("manageruser") || ops.equalsIgnoreCase("CreateUser") || ops.equalsIgnoreCase("userDetails")? bgSelected : bgNotSelect %>">
                                        <a href="?options=manageruser" class="<%=ops.equalsIgnoreCase("manageruser") || ops.equalsIgnoreCase("CreateUser") || ops.equalsIgnoreCase("userDetails")? txtSelected : txtNotSelect %>">Manager User</a>               
                                    </div>
                                </td>
                            </tr>
                            

                            
                            <tr>
                                <td valign="top" class="bg-title-td">
                                    <div class="<%=ops.equalsIgnoreCase("ManagerTypeAccessory") ? bgSelected : bgNotSelect %>">
                                        <a href="?options=ManagerTypeAccessory" class="<%=ops.equalsIgnoreCase("ManagerTypeAccessory") ? txtSelected : txtNotSelect %>">Manager Type Accessory</a>             
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td valign="top" class="bg-title-td">
                                    <div class="<%=ops.equalsIgnoreCase("ManagerAccessory") ? bgSelected : bgNotSelect %>">
                                         <a href="?options=ManagerAccessory" class="<%=ops.equalsIgnoreCase("ManagerAccessory")? txtSelected : txtNotSelect %>">Manager Accessory</a>              
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td valign="top" class="bg-title-td">
                                    <div class="<%=ops.equalsIgnoreCase("ManagerCategoryDevice") ? bgSelected : bgNotSelect %>">
                                        <a href="?options=ManagerCategoryDevice" class="<%=ops.equalsIgnoreCase("ManagerCategoryDevice") ? txtSelected : txtNotSelect %>">Manager Category Device</a>              
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td valign="top" class="bg-title-td">
                                    <div class="<%=ops.equalsIgnoreCase("ManagerDevice") || ops.equalsIgnoreCase("CreateDevice") || ops.equalsIgnoreCase("DeviceInfo")? bgSelected : bgNotSelect %>">
                                       <a href="?options=ManagerDevice" class="<%=ops.equalsIgnoreCase("ManagerDevice") || ops.equalsIgnoreCase("CreateDevice") || ops.equalsIgnoreCase("DeviceInfo")? txtSelected : txtNotSelect %>">Manager Device</a>               
                                    </div>
                                </td>
                            </tr>
                            
                            <tr>
                                <td valign="top" class="bg-title-td">
                                    <div class="<%=ops.equalsIgnoreCase("ManagerClasses") ? bgSelected : bgNotSelect %>">
                                        <a href="?options=ManagerClasses" class="<%=ops.equalsIgnoreCase("ManagerClasses") ? txtSelected : txtNotSelect %>"> Manager Class</a>           
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td valign="top" class="bg-title-td">
                                    <div class="<%=ops.equalsIgnoreCase("ManagerLab") ? bgSelected : bgNotSelect %>">
                                        <a href="?options=ManagerLab" class="<%=ops.equalsIgnoreCase("ManagerLab")? txtSelected : txtNotSelect %>">Manager Labs Room</a>            
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td valign="top" class="bg-title-td">
                                    <div class="<%=ops.equalsIgnoreCase("ManagerComplaint") || ops.equalsIgnoreCase("complaintDetails") ? bgSelected : bgNotSelect %>">
                                        <a href="?options=ManagerComplaint" class="<%=ops.equalsIgnoreCase("ManagerComplaint") || ops.equalsIgnoreCase("complaintDetails")? txtSelected : txtNotSelect %>">Manager Complaint</a>            
                                    </div>
                                </td>
                            </tr>
                            
                            <tr>
                                <td valign="top" class="bg-title-td">
                                    <div class="<%=ops.equalsIgnoreCase("ManagerShift") ? bgSelected : bgNotSelect %>">
                                         <a href="?options=ManagerShift" class="<%=ops.equalsIgnoreCase("ManagerShift") ? txtSelected : txtNotSelect %>">Manager Shift Name</a>              
                                    </div>
                                </td>
                            </tr>
                        </table>

                    </div>
                    <div class="main-content-right">
                        <table class="main-content-right" valign="top">
                            <tr>
                                <td align="center" valign="top" >
                                    <div class="khung-user">
                                        <%

                                            String title = "Home Page";
                                            if (request.getParameter("options") != null) {
                                                String opt = request.getParameter("options");
                                                if (opt.equalsIgnoreCase("manageruser")) {
                                                    title = "Manager User";
                                                } else if (opt.equalsIgnoreCase("CreateUser")) {
                                                    title = "Admin Create User";
                                                } else if (opt.equalsIgnoreCase("userDetails")) {
                                                    title = "User Details";
                                                } else if (opt.equalsIgnoreCase("search")) {
                                                    title = "Search";
                                                } else if (opt.equalsIgnoreCase("ManagerSchedule")) {
                                                    title = "Manager Schedule";
                                                } else if (opt.equalsIgnoreCase("CreateSchedule")) {
                                                    title = "Create Schedule";
                                                } else if (opt.equalsIgnoreCase("scheDetails")) {
                                                    title = "Schedule Details";
                                                } else if (opt.equalsIgnoreCase("ManagerShift")) {
                                                    title = "Manager Shift Name";
                                                } else if (opt.equalsIgnoreCase("ManagerCategoryDevice")) {
                                                    title = "Manager Category Device";
                                                } else if (opt.equalsIgnoreCase("ManagerTypeAccessory")) {
                                                    title = "Manager Type Accessory";
                                                } else if (opt.equalsIgnoreCase("ManagerClasses")) {
                                                    title = "Manager Class";
                                                } else if (opt.equalsIgnoreCase("ManagerLab")) {
                                                    title = "Manager Labs Room";
                                                } else if (opt.equalsIgnoreCase("ManagerAccessory")) {
                                                    title = "Manager Accessory";
                                                } else if (opt.equalsIgnoreCase("ManagerDevice")) {
                                                    title = "Manager Device";
                                                } else if (opt.equalsIgnoreCase("CreateDevice")) {
                                                    title = "Create Device";
                                                } else if (opt.equalsIgnoreCase("DeviceInfo")) {
                                                    title = "Device Infomation";
                                                } else if (opt.equalsIgnoreCase("ManagerComplaint")) {
                                                    title = "Manager Complaint";
                                                } else if (opt.equalsIgnoreCase("complaintDetails")) {
                                                    title = "Complaint Infomation";
                                                }else if (opt.equalsIgnoreCase("ManagerWorkingShift")) {
                                                    title = "Manager Working Shift";
                                                } else {
                                                    title = "Home Page";
                                                }
                                            }
                                        %>
                                        <div class="title"><%=title%></div>
                                        <div class="content-main">
                                            <jsp:include page="body.jsp"/>
                                        </div>
                                    </div>
                                </td>
                            </tr>

                        </table>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
