<%-- 
    Document   : createuser.jsp
    Created on : Apr 17, 2014, 9:50:50 PM
    Author     : User
--%>

<%@page import="reporting.CusConvertUtil"%>
<%@page import="computerlabs.checkAdminHOD"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page import="computerlabs.dbconnect"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

       <%@include file="checkLogin.jsp" %>

        <link rel="stylesheet" href="../css/cssvalidate/validationEngine.jquery.css" type="text/css"/> 
        <link rel="stylesheet" href="../css/cssvalidate/template.css" type="text/css"/> 
        <script src="../js/jsvalidate/jquery-1.8.2.min.js" type="text/javascript"></script> 
        <script src="../js/jsvalidate/languages/jquery.validationEngine-en.js" type="text/javascript" charset="utf-8"></script> 
        <script src="../js/jsvalidate/jquery.validationEngine.js" type="text/javascript" charset="utf-8"></script> 
        <script>
            jQuery(document).ready(function() {
                // binds form submission and fields to the validation engine 
                jQuery("#ajaxform").validationEngine();
            });</script>
         <script>
            function BASIC_SelectItem()
            {
                //var isOK = true;
                /*if (document.ajaxform.chk.checked)
                {
                    isOK = true;
                }*/
                document.ajaxform.rsCheckbox.value = 'checked';
                /*if (isOK == true) {
                    document.ajaxform.rsCheckbox.value = 'checked';
                }
                else {
                    document.ajaxform.rsCheckbox.value = 'nochecked';
                }*/
            }


        </script>

        
        
            <%--check username--%>
            
        <form id="ajaxform" name="ajaxform" action='../createuser' method='post'>
            <%
                    Connection cnn1 = null;
                    Statement st1 = null;
                    ResultSet rs1 = null;
                    
                    int userID = 0;
                    String userName = "";
                    String password = "";
                    String fullName = "";
                    String address = "";
                    String email = "";
                    int gender = -1;
                    int departmentID = 0;
                    int dd = -1;
                    int dm = -1;
                    int dy = -1;
                    //String birthday = "";
                    if (session.getAttribute("userID") != null) {
                        userID = Integer.parseInt(session.getAttribute("userID").toString());
                    }
                    String sql = "select * from tbl_user where userID = " + userID;
                    cnn1 = dbconnect.Connect();
                    try {
                        st1 = cnn1.createStatement();
                        rs1 = st1.executeQuery(sql);
                        if (rs1.next()) {
                            userName = rs1.getString("userName");
                            password = rs1.getString("password");
                            fullName = rs1.getString("fullName");
                            address = rs1.getString("address");
                            email = rs1.getString("email");
                            gender = rs1.getInt("gender");
                            departmentID = rs1.getInt("departmentID");
                            Date birthdaydb = rs1.getDate("birthday");
                            if(birthdaydb != null){
                                dd = CusConvertUtil.getDateByDate(birthdaydb);
                                dm = CusConvertUtil.getMonthByDate(birthdaydb);
                                dy = CusConvertUtil.getYearByDate(birthdaydb);
                            }
                        }
                    } catch (Exception ex) {

                    } finally {
                        try {
                            rs1.close();
                            st1.close();
                            cnn1.close();
                        } catch (Exception ex) {

                        }
                    }
                %>
            <table width="500px" border="0" align="center" cellpadding="7px" cellspacing="0">
                <tr>
                    <td align="center"><div id='content'></div></td>
                </tr>
                <tr>
                    <td>
                        <div class="site-input-div">
                            <div class="site-input-left"><img src="../img/user.png"/></div>
                            <div class="site-input-rigth">
                                <div style="width:395px; height:28px; border:0px solid #d1d1d1;-moz-border-radius: 5px;-webkit-border-radius: 5px; display: table;text-align: center;">
                                    <span style="display: table-cell;vertical-align: middle;text-align: left;"><%=userName %></span>
                                    <input type="hidden" value="<%=userID%>" name="userIDU"/>
                                    <input type="hidden" value="<%=userName%>" name="txtuser"/>
                                </div>
                                
                            </div>   
                        </div>
                    </td>
                    <td align="left">
                    </td>
                </tr>
                <tr>

                    <td colspan="2">
                        <div class="site-input-div">
                            <div class="site-input-left"><img src="../img/key.png"/></div>
                            <div class="site-input-rigth">
                                <input placeholder="Please enter OLD password..." id="txtpwdold" name="txtpwdold"  style="width:395px; height:26px; border:0px solid #d1d1d1;-moz-border-radius: 5px;-webkit-border-radius: 5px;" type="password" class="validate[required,minSize[6]] text-input"  />
                            </div>
                        </div>
                    </td>

                </tr>
                <tr>
                    <td colspan="2">
                        <div class="site-input-div">
                            <div class="site-input-left"><img src="../img/key.png"/></div>
                            <div class="site-input-rigth">
                                <input placeholder="Please enter NEW password..." id="txtpwd" name="txtpwd"  style="width:395px; height:26px; border:0px solid #d1d1d1;-moz-border-radius: 5px;-webkit-border-radius: 5px;" type="password" class="validate[minSize[6]] text-input"  />
                            </div>
                        </div>
                    </td>

                </tr>
                <tr>
                    <td colspan="2">
                        <div class="site-input-div">
                            <div class="site-input-left"><img src="../img/key.png"/></div>
                            <div class="site-input-rigth">
                                <input placeholder="Please enter confirm NEW password..." id="txtpwd" name="comfirmpwd" style="  width:395px; height:26px; border:0px solid #d1d1d1;-moz-border-radius: 5px;-webkit-border-radius: 5px;" type="password" class="validate[equals[txtpwd]]"  />
                            </div>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <div class="site-input-div">
                            <div class="site-input-left"><img src="../img/user.png"/></div>
                            <div class="site-input-rigth">
                                <input placeholder="Please enter full name..." id="txtfullname" style="  width:395px; height:26px; border:0px solid #d1d1d1;-moz-border-radius: 5px;
                                       -webkit-border-radius: 5px;" name="txtfullname" type="text" class="validate[required] text-input" value="<%=userName%>" />
                            </div>
                        </div>
                    </td>
                </tr>
                <tr>

                    <td colspan="2">
                        <div class="site-input-div">
                            <div class="site-input-left"><img src="../img/mail.png"/></div>
                            <div class="site-input-rigth">
                                <input placeholder="Please enter email..." id="txtEmail" style="width:395px; height:26px; border:0px solid #d1d1d1;-moz-border-radius: 5px;
                                       -webkit-border-radius: 5px;" name="txtEmail"  type="text" class="validate[required,custom[email]] text-input" value="<%=email%>" />
                            </div>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <div class="site-input-div">
                            <div class="site-input-left"><img src="../img/google_maps.png"/></div>
                            <div class="site-input-rigth">
                                <input placeholder="Please enter address..." type="text" id="txtAddress" name="txtAddress" style="width:395px; height:26px; border:0px solid #d1d1d1;-moz-border-radius: 5px;
                                       -webkit-border-radius: 5px;" class="validate[required] text-input" value="<%=address%>"/>
                            </div>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <input id="rdoMale" name="rdoGender" type="radio"   value="0"  <%= gender == 0 ? "checked" : "" %> /> &nbsp;Male &nbsp;&nbsp;&nbsp;
                        <input id="rdoFEMale" name="rdoGender" type="radio" value="1" <%= gender == 1 ? "checked" : "" %> />&nbsp; Female
                    </td>
                </tr>
                <tr>

                    <td colspan="2">
                        <select name="month" style="width: 70px;height: 30px">
                            <%
                                for (int i = 1; i <= 12; i++) {
                                    int ri = i-1;
                            %>
                            <option value="<%=i%>" <%= dm == ri ? "selected" : "" %> ><%=i%></option>
                            <%
                                }
                            %>
                        </select>
                        <select name="day" style="width: 70px;height: 30px">
                            <%
                                for (int i = 1; i <= 31; i++) {
                            %>
                            <option value="<%=i%>" <%= dd == i ? "selected" : "" %> ><%=i%></option>
                            <%
                                }
                            %>
                        </select>
                        <select name="year" style="width: 100px;height: 30px">
                            <%
                                Calendar calen = Calendar.getInstance();
                                int year = calen.get(Calendar.YEAR) - 7;
                                for (int i = year; i >= 1900; i--) {
                            %>
                            <option value="<%=i%>" <%= dy == i ? "selected" : "" %> ><%=i%></option>
                            <%
                                }
                            %>
                        </select>

                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        
                            <%
                                Connection cnn = null;
                                Statement st = null;
                                ResultSet rs = null;
                                String dName = "";
                                String sql1 = "select * from tbl_department where departmentid = "+departmentID;
                                    
                                cnn = dbconnect.Connect();
                                try {
                                    st = cnn.createStatement();
                                    rs = st.executeQuery(sql1);
                                    if (rs.next()) {

                                        dName = rs.getString("departmentname");
                                    }
                                } catch (Exception ex) {
                                    out.print(ex.getMessage());
                                } finally {
                                    try {
                                        rs.close();
                                        st.close();
                                        cnn.close();
                                    } catch (Exception ex) {
                                        out.print(ex.getMessage());
                                    }
                                }
                            %>
                        <div style="height:28px; border:0px solid #d1d1d1;-moz-border-radius: 5px;-webkit-border-radius: 5px; display: table;text-align: center;">
                            <span style="display: table-cell;vertical-align: middle;text-align: left;">Department :<%=dName %></span>
                            
                        </div>
                    </td>
                </tr>
                <tr>

                    <td colspan="2"><input type="submit" value="Update" class="button_example"  />
                </tr>
            </table>
        </form>



        <script type="text/javascript">

            var form = $('#ajaxform');
            $('#content').hide();//chu y
            form.submit(function() {
                
                $.ajax({
                    type: form.attr('method'),
                    url: form.attr('action'),
                    data: form.serialize(),
                    success: function(data) {
                        var result = data;
                        $('#content').show().html(result).fadeOut(4000,function() {
                            
                        });   
                    }
                });

                return false;
            }); </script>
