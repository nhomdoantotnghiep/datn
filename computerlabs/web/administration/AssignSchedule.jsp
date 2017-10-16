<%-- 
    Document   : createuser.jsp
    Created on : Apr 17, 2014, 9:50:50 PM
    Author     : User
--%>

<%@page import="processSchedule.checkRequest"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page import="computerlabs.dbconnect"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    String dateID = "";
    int totalWS = 0;
    int did = 0;
    if(request.getParameter("dateID") != null && request.getParameter("dateID").trim().length() > 0){
        dateID = request.getParameter("dateID");
        did = Integer.parseInt(dateID);
        totalWS = checkRequest.checkExistWorkingShift(did);
    }
    
%>
<link rel="stylesheet" href="../css/cssvalidate/validationEngine.jquery.css" type="text/css"/> 
<link rel="stylesheet" href="../css/cssvalidate/template.css" type="text/css"/> 
<script src="../js/jsvalidate/jquery-1.8.2.min.js" type="text/javascript"></script> 
<script src="../js/jsvalidate/languages/jquery.validationEngine-en.js" type="text/javascript" charset="utf-8"></script> 
<script src="../js/jsvalidate/jquery.validationEngine.js" type="text/javascript" charset="utf-8"></script> 

    <%--check username--%>
<script>
    function BASIC_SelectItem()
    {
        var form = $('#ajaxform');
        var c_user = "";
        console.log("--1--"+document.ajaxform.chkUser.length);
        for (var j = 0; j < document.ajaxform.chkUser.length; j++)

        {
            if (document.ajaxform.chkUser[j].checked)
            {
                c_user += (c_user ? '/' : '') + document.ajaxform.chkUser[j].value;
            }
        }
        document.ajaxform.txtResultUser.value = c_user;
        

        if ($('input[type=checkbox]:checked').length > 3) {
            //$(this).prop('checked', false);
            //alert("Maximum Technical Staff only 3");
            
        }else{
            $('#ajaxform').submit(function(e) {
                e.preventDefault();
                $.ajax({
                    type: 'post',
                    url: '../assignSchedule',
                    data: form.serialize(),
                    success: function(data) {
                        var result = data;
                        $('#content').show().html(result).fadeOut(4000, function() {
                            window.location.href = "?options=ManagerSchedule";
                        });
                    }
                });

                //return false;
            });
        }
        
         
        
    }
    jQuery(document).ready(function() {
        $('#errChk').hide();
        $('#content').hide();
        $('input[type=checkbox]').on('change', function (e) {
            if ($('input[type=checkbox]:checked').length > 3) {
                //$(this).prop('checked', false);
                //alert("Maximum Technical Staff only 3");
                $('#errChk').show().html("Maximum Technical Staff only 3").fadeIn(4000, function() {
                    //window.location.href = "?options=ManagerSchedule";
                });
            }else{
                $('#errChk').hide().fadeOut(4000, function() {
                    //window.location.href = "?options=ManagerSchedule";
                });
            }
        });

    });

</script>


<form id='ajaxform' name='ajaxform' method='post'>
    <table width="650px" border="0" align="center" cellpadding="0" cellspacing="0"> 
        
        <tr>
            <td class="td-left" style="background:#78bbe3;">
                Technical Staff (Max: 3):
                <input name="txtResultUser" id="txtResultUser" type="hidden"  />
                <input name="dateID" id="dateID" type="hidden" value="<%=dateID %>"  />
                
            </td>
            <td style="background:#dfefff;">

                <%
                    Connection cnn = null;
                    Statement st = null;
                    ResultSet rs = null;
                    
                    String sql = "select * from tbl_user where departmentId =3 and status=1";
                    
                    cnn = dbconnect.Connect();
                    try {
                        st = cnn.createStatement();
                        rs = st.executeQuery(sql);
                        while (rs.next()) {
                            int tempuid = rs.getInt("userID");
                            int tempcheck = checkRequest.checkExistWorkingShift(did, tempuid);
                            if(tempcheck > 0){
                                %>
                                <input name="chkUser" type="checkbox" checked="checked" value="<%=rs.getInt("userID")%>"/> &nbsp;<%=rs.getString("fullname")%> <br/>
                                <%
                            }else{
                                %>
                                <input name="chkUser" type="checkbox" value="<%=rs.getInt("userID")%>"/> &nbsp;<%=rs.getString("fullname")%> <br/>
                                <%
                            }
                %>
                
                <%
                        }
                    } catch (Exception ex) {
                        out.print(ex.getMessage());
                    } finally {
                        try {
                            rs.close();
                            st.close();
                            cnn.close();

                        } catch (Exception ex) {

                        }
                    }
                %>

            </td>
        </tr>
        
        
        <tr>
            <td class="td-left"> </td>
            <td>
                <input type="submit" value="    Assign    " class="button_example" onclick="BASIC_SelectItem();" />&nbsp;&nbsp;&nbsp;&nbsp;
                <input class="button_example" value="    Reset   " type="reset"/>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <div id="errChk" style="margin: auto;margin-top: 5px;margin-bottom: 5px;" class="style-result-fail"></div>
            </td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <div id='content' ></div>
            </td>
        </tr>
        <tr>
            <td class="td-left">
               </td>
            <td>
        </tr>
    </table>
</form>




