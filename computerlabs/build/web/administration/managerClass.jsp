
<%@page import="classes.classClass"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="computerlabs.dbconnect"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<%@page import="java.util.List"%>  




<link rel="stylesheet" href="../css/cssvalidate/validationEngine.jquery.css" type="text/css"/> 
<link rel="stylesheet" href="../css/cssvalidate/template.css" type="text/css"/> 
<script src="../js/jsvalidate/jquery-1.8.2.min.js" type="text/javascript"></script> 
<script src="../js/jsvalidate/languages/jquery.validationEngine-en.js" type="text/javascript" charset="utf-8"></script> 
<script src="../js/jsvalidate/jquery.validationEngine.js" type="text/javascript" charset="utf-8"></script> 
<script type="text/javascript">
    $(document).ready(function() {
        //called when key is pressed in textbox
        $("#typeNameUp1").keypress(function(e)
        {
            $("#error").hide();
            $("#autoSuggestionsList").hide();
            //if the letter is not digit then display error and don't type anything
            if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57) && (e.which < 65 || e.which > 90) && (e.which < 97 || e.which > 122))
            {
                //display error message
                $("#error").html("No Special Characters.Only number & alphabets").show();
                return false;
            }
        });
    });
    function lookup(txtName, ID) {
        if (txtName.length < 1) {
            $('#autoSuggestionsList').hide();
        } else {
            $.post("../checkNameEditClass", {name: "" + txtName + "", tID: "" + ID + ""}, function(data) {
                $('#autoSuggestionsList').html(data).show();
            });
        }
    }

</script>

<%----%>
<script type="text/javascript">
    $(document).ready(function() {
        //called when key is pressed in textbox
        $("#namecreate1").keypress(function(e)
        {
            $("#error").hide();
            $("#autoSuggestionsList").hide();
            //if the letter is not digit then display error and don't type anything
            if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57) && (e.which < 65 || e.which > 90) && (e.which < 97 || e.which > 122))
            {
                //display error message
                $("#error").html("No Special Characters.Only number & alphabets").show();
                return false;
            }
        });
    });
    function lookupCreate(txtuser) {
        if (txtuser.length < 1) {
            $('#autoSuggestionsList').hide();
        } else {
            $.post("../checkClassNameCreate", {namecreate: "" + txtuser + ""}, function(data) {
                $('#autoSuggestionsList').html(data).show();
            });
        }
    }


    function BASIC_SelectItem(act, id)
    {
        var getID = id;
        var getACT = act;
        if (act == 'delete') {
            if (confirm("Delete this class?") == true) {
                document.ajaxform.ID.value = getID;
                document.ajaxform.act.value = getACT;
                myDelete();
            } else {
                window.location.href = "?options=ManagerClasses";
            }
        } else {
            document.ajaxform.ID.value = getID;
            document.ajaxform.act.value = getACT;
            mySubmit();
        }
    }


</script>
<script type="text/javascript">
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
        var className = "";
        className = document.ajaxform.className.value;
        if (xmlHttpRe) {

            xmlHttpRe.open("GET", "../showClass?pageNumber=" + getText + strStatus + "&className" + className, true);// chú ý
            xmlHttpRe.onreadystatechange = handleResponse;
            xmlHttpRe.send(null);
        }
    }
    function goPage(status)
    {
        var c_value = "";
        c_value = document.ajaxform.go.value;
        new setXMLHttpRe();
        var getText = c_value;  //Used to prevent caching during ajax call
        var strStatus = "&status=" + status;
        if (xmlHttpRe) {

            xmlHttpRe.open("GET", "../showClass?pageNumber=" + c_value + strStatus, true);// chú ý
            xmlHttpRe.onreadystatechange = handleResponse;
            xmlHttpRe.send(null);
        }
    }
    function Search()
    {
        var v_typeName = "";
        var v_status = "";
        v_typeName = document.ajaxform.className.value;
        v_status = document.ajaxform.status.value;
        new setXMLHttpRe();
        if (xmlHttpRe) {

            xmlHttpRe.open("GET", "../showClass?className=" + v_typeName + "&status=" + v_status, true);// chú ý
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
                alert("Can not connect Server");
            }
        }
    }

    function myDelete() {

        

        var form = $('#ajaxform');
        
        console.log("---4---");
        $('#ajaxform').submit(function(e) {
            e.preventDefault();
            $.ajax({
                type: 'post',
                url: '../processClasses',
                data: form.serialize(),
                success: function(data) {
                    var result = data;
                    $('#content').show().html(result).fadeOut(4000, function() {
                        window.location.href = "?options=ManagerClasses";
                    });
                }
            });

            //return false;
        }); 


    }
    function mySubmit() {

        var vali = jQuery("#ajaxform").validationEngine('validate');

        var form = $('#ajaxform');
        if (vali === true) {
            console.log("---4---");
            $('#ajaxform').submit(function(e) {
                e.preventDefault();
                $.ajax({
                    type: 'post',
                    url: '../processClasses',
                    data: form.serialize(),
                    success: function(data) {
                        var result = data;
                        $('#content').show().html(result).fadeOut(4000, function() {
                            window.location.href = "?options=ManagerClasses";
                        });
                    }
                });

                //return false;
            }); 
        } else {

        }

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
    List list = (List) session.getAttribute("studentDetails");
%>  

<%
    List pageNumbers = (List) session.getAttribute("pages");
%>  

<form name="ajaxform" id="ajaxform" method="post">
    <table cellpadding="1px" cellspacing="1px" border="0"  width="850px" align="center">  
        <tr >

            <td colspan="4" style="height: 30px" >
                <input id="className" value="<%=request.getParameter("className") == null ? "" : request.getParameter("className")%>" name="className" type="text" placeholder="Search by Class Name"  />
                <select name="status">
                    <%
                        if (request.getAttribute("statusSelected") != null) {
                            if (Integer.parseInt(request.getAttribute("statusSelected").toString().trim()) == 0) {
                    %>
                    <option value="2">Status ALL</option>
                    <option selected="selected" value="0">Hide</option>
                    <option value="1">Show</option>
                    <%
                    } else if (Integer.parseInt(request.getAttribute("statusSelected").toString().trim()) == 1) {
                    %>
                    <option value="2">Status ALL</option>
                    <option  value="0">Hide</option>
                    <option selected="selected" value="1">Show</option>
                    <%
                    } else {
                    %>
                    <option selected="selected" value="2">Status ALL</option>
                    <option  value="0">Hide</option>
                    <option  value="1">Show</option>
                    <%
                        }
                    } else {
                    %>
                    <option value="2">Status ALL</option>
                    <option value="0">Hide</option>
                    <option value="1">Show</option>
                    <%
                        }
                    %>
                </select>
                <input type="button" class="button_example" onclick="Search(<%=pageSelected%>);" value="Search"/>
                <a href="?options=ManagerClasses&actCreate=Create" class="button_example">Create Classes</a>
            </td>
        </tr>  
    </table>
    <table cellpadding="1px" cellspacing="1px" border="0" id="fcuk" width="850px" align="center"> 

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
                                    <li class="active" onclick="javascript:show(1,<%=request.getAttribute("statusSelected") == null ? 2 : request.getAttribute("statusSelected")%>);">
                                        First
                                    </li>
                                    <%                                    } else {
                                    %>
                                    <li class="active-max" onclick="javascript:show(1,<%=request.getAttribute("statusSelected") == null ? 2 : request.getAttribute("statusSelected")%>);">
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
                                    <li class="active-max" onclick="javascript:show(<%=pageNumbers.size()%>,<%=request.getAttribute("statusSelected") == null ? 2 : request.getAttribute("statusSelected")%>);">
                                        Last
                                    </li>
                                    <%
                                    } else {
                                    %>
                                    <li class="active" onclick="javascript:show(<%=pageNumbers.size()%>,<%=request.getAttribute("statusSelected") == null ? 2 : request.getAttribute("statusSelected")%>);">
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
                                    <li class="actived" onclick="javascript:show(<%=pageNumbers.get(i)%>,<%=request.getAttribute("statusSelected") == null ? 2 : request.getAttribute("statusSelected")%>);">
                                        <%=pageNumbers.get(i)%>
                                    </li>
                                    <%
                                    } else {
                                    %>
                                    <li class="active" onclick="javascript:show(<%=pageNumbers.get(i)%>,<%=request.getAttribute("statusSelected") == null ? 2 : request.getAttribute("statusSelected")%>);">
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
                                    <li class="active-max" onclick="javascript:show(<%=nextpage%>,<%=request.getAttribute("statusSelected") == null ? 2 : request.getAttribute("statusSelected")%>);">
                                        Next
                                    </li>

                                    <%
                                    } else {

                                    %>
                                    <li class="active" onclick="javascript:show(<%=(nextpage + 1)%>,<%=request.getAttribute("statusSelected") == null ? 2 : request.getAttribute("statusSelected")%>);">
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
                                    <li class="active-max" onclick="javascript:show(<%=previous%>,<%=request.getAttribute("statusSelected") == null ? 2 : request.getAttribute("statusSelected")%>);">
                                        Previous
                                    </li>

                                    <%
                                    } else {

                                    %>
                                    <li class="active" onclick="javascript:show(<%=(previous - 1)%>,<%=request.getAttribute("statusSelected") == null ? 2 : request.getAttribute("statusSelected")%>);">
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
                            <input type="text" class="" name="go" id="go" size="3" value="" /><input type="button" value="Go" onclick= "goPage(<%=request.getAttribute("statusSelected") == null ? 2 : request.getAttribute("statusSelected")%>);" />
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
            <td class="td-show" width="80px" align="center">ID</td>
            <td class="td-show" width="450px" align="center">Type name</td>
            <td class="td-show" width="100px" align="center">Status</td>
            <td class="td-show" width="220px" align="center" colspan="2" >Action</td>
        </tr>  
        <%
            String color = "style='background: #e7f5fe;height:30px'";
            String ClassN = "";
            String statusN = "";
            if (request.getAttribute("statusSelected") != null) {
                statusN = "&status=" + request.getAttribute("statusSelected");
            }
            if (request.getParameter("className") != null) {
                ClassN = "&className=" + request.getParameter("className");
            }
            for (int i = 0; i < list.size(); i++) {
        %>  
        <tr>  
            <%
                classClass studentDetailsDTO = (classClass) list
                        .get(i);
                if (i % 2 == 0) {
                    out.println("<td style='height:30px' align=\"center\">" + studentDetailsDTO.getTypeID()
                            + "</td>");
                    if (request.getParameter("tID") != null) {
                        if (Integer.parseInt(request.getParameter("tID").toString().trim()) == studentDetailsDTO.getTypeID()) {
            %>
            <td class="row-td-backgroud-select" align="center">

                <input name="typeNameUp" id="typeNameUp" onkeyup="lookup(this.value,<%=studentDetailsDTO.getTypeID()%>);" class="validate[required,minSize[3]] text-input" value="<%=studentDetailsDTO.getTypeName()%>" type="text"/>
                <div style="width: 50px;">
                    <div style="display: none;" id="autoSuggestionsList"></div>
                    <div style="display: none;" id="error"></div>

                </div>
            </td>
            <td  class="row-td-backgroud-select" align="center">
                <select name="statusUp">
                    <%
                        if (studentDetailsDTO.getStatus() == 1) {
                    %>
                    <option value="1">Show</option>
                    <option value="0">Hide</option>
                    <%
                    } else {
                    %>
                    <option value="1">Show</option>
                    <option value="0" selected="selected">Hide</option>
                    <%
                        }
                    %>
                </select>
            </td>
            <%
            } else {
            %>
            <td style="height:30px" align="center"><%=studentDetailsDTO.getTypeName()%></td>
            <td style="height:30px" align="center">
                <%
                    if (studentDetailsDTO.getStatus() == 1) {
                        out.println("Show");
                    } else {
                        out.println("Hide");

                    }
                %>
            </td>
            <%
                }
            } else {
            %>

            <td style="height:30px" align="center"><%=studentDetailsDTO.getTypeName()%></td>
            <td style="height:30px" align="center">
                <%
                    if (studentDetailsDTO.getStatus() == 1) {
                        out.println("Show");
                    } else {
                        out.println("Hide");

                    }
                %>
            </td>
            <%
                }
            %>

            <%
                if (request.getParameter("tID") != null) {
                    if (Integer.parseInt(request.getParameter("tID").toString().trim()) == studentDetailsDTO.getTypeID()) {
            %>
            <td align='center' style="height:30px;width: 40px;">
                <input title="Update" type="submit" style="background: url('../img/edit2.png');width: 23px;height: 23px;" name="update" onclick="BASIC_SelectItem('update',<%=studentDetailsDTO.getTypeID()%>)" class="button_img" height="20px" value="" />
            </td>
            <td align='center' style="height:30px;width: 40px;"><a href="?options=ManagerClasses"><img src="../img/back.png" width="23px" height="20px" /></a></td>
                    <%
                    } else {
                    %>
            <td align='center' style="height:30px;width: 40px;">
                <a href="?options=ManagerClasses<%=ClassN%><%=statusN%>&pageNumber=<%=pageSelected%>&tID=<%=studentDetailsDTO.getTypeID()%>"><img src="../img/edit.png" width="23px" height="23px" /></a>
            </td>
            <td align='center' style="height:30px;width: 40px;">
                <input title="Delete" type="submit"  name="delete" style="background: url('../img/delete.png');width: 23px;height: 23px;" onclick="BASIC_SelectItem('delete',<%=studentDetailsDTO.getTypeID()%>)" class="button_img" height="20px" value="" /></td>
                <%
                    }
                } else {
                %>
            <td align='center' style="height:30px;width: 40px;">
                <a href="?options=ManagerClasses<%=ClassN%><%=statusN%>&pageNumber=<%=pageSelected%>&tID=<%=studentDetailsDTO.getTypeID()%>"><img src="../img/edit.png" width="23px" height="23px" /></a>
            </td>
            <td align='center' style="height:30px;width: 40px;"><input title="Delete" type="submit"  name="delete" style="background: url('../img/delete.png');width: 23px;height: 23px;" onclick="BASIC_SelectItem('delete',<%=studentDetailsDTO.getTypeID()%>)" class="button_img" height="20px" value="" /></td>
                <%
                    }
                %>
                <%
                    //out.println("<td style='height:30px' align=\"center\"><a href=\"?options=manageruser&id=" + studentDetailsDTO.getId() + "\" title=\"Delete User\"><img src=\"../img/delete.png\" width=\"20px\" height=\"20px\"></a></td>");
                } else {
                    out.println("<td " + color + " align=\"center\">" + studentDetailsDTO.getTypeID()
                            + "</td>");
                    if (request.getParameter("tID") != null) {
                        if (Integer.parseInt(request.getParameter("tID").toString().trim()) == studentDetailsDTO.getTypeID()) {
                %>
            <td style="height:30px" align="center"  class="row-td-backgroud-select">

                <input name="typeNameUp" id="typeNameUp" onkeyup="lookup(this.value,<%=studentDetailsDTO.getTypeID()%>);" class="validate[required,minSize[3]] text-input" value="<%=studentDetailsDTO.getTypeName()%>" type="text"/>
                <div style="width: 50px;">
                    <div style="display: none;" id="autoSuggestionsList"></div>
                    <div style="display: none;" id="error"></div>

                </div>
            </td>
            <td  class="row-td-backgroud-select" align="center">
                <select name="statusUp">
                    <%
                        if (studentDetailsDTO.getStatus() == 1) {
                    %>
                    <option value="1">Show</option>
                    <option value="0">Hide</option>
                    <%
                    } else {
                    %>
                    <option value="1">Show</option>
                    <option value="0" selected="selected">Hide</option>
                    <%
                        }
                    %>
                </select>
            </td>
            <%
            } else {
            %>
            <td style="height:30px" class="row-td-backgroud" align="center"><%=studentDetailsDTO.getTypeName()%></td>
            <td style="height:30px"  class="row-td-backgroud" align="center">
                <%
                    if (studentDetailsDTO.getStatus() == 1) {
                        out.println("Show");
                    } else {
                        out.println("Hide");

                    }
                %>
            </td>
            <%
                }
            } else {
            %>

            <td style="height:30px" class="row-td-backgroud" align="center"><%=studentDetailsDTO.getTypeName()%></td>
            <td style="height:30px" class="row-td-backgroud" align="center">
                <%
                    if (studentDetailsDTO.getStatus() == 1) {
                        out.println("Show");
                    } else {
                        out.println("Hide");

                    }
                %>
            </td>
            <%
                }
            %>


            <%
                if (request.getParameter("tID") != null) {
                    if (Integer.parseInt(request.getParameter("tID").toString().trim()) == studentDetailsDTO.getTypeID()) {
            %>
            <td align='center' style="height:30px;background: #e7f5fe;width: 40px;">
                <input title="Update" type="submit" style="background: url('../img/edit2.png');width: 23px;height: 23px;" name="update" onclick="BASIC_SelectItem('update',<%=studentDetailsDTO.getTypeID()%>)" class="button_img" height="20px" value="" />
            </td>
            <td align='center' style="height:30px;background: #e7f5fe;width: 40px;"><a href="?options=ManagerClasses"><img src="../img/back.png" width="23px" height="20px" /></a></td>
                    <%
                    } else {
                    %>
            <td align='center' style="height:30px;background: #e7f5fe;width: 40px;">
                <a href="?options=ManagerClasses<%=ClassN%><%=statusN%>&pageNumber=<%=pageSelected%>&tID=<%=studentDetailsDTO.getTypeID()%>"><img src="../img/edit.png" width="23px" height="23px" /></a>
            </td>
            <td align='center' style="height:30px;background: #e7f5fe;width: 40px;"><input title="Delete" type="submit"  name="delete" style="background: url('../img/delete.png');width: 23px;height: 23px;" onclick="BASIC_SelectItem('delete',<%=studentDetailsDTO.getTypeID()%>)" class="button_img" height="20px" value="" /></td>
                <%
                    }
                } else {
                %>
            <td align='center' style="height:30px;background: #e7f5fe;width: 40px;">
                <a href="?options=ManagerClasses<%=ClassN%><%=statusN%>&pageNumber=<%=pageSelected%>&tID=<%=studentDetailsDTO.getTypeID()%>"><img src="../img/edit.png" width="23px" height="23px" /></a>
            </td>
            <td align='center' style="height:30px;background: #e7f5fe;width: 40px;"><input title="Delete" type="submit"  name="delete" style="background: url('../img/delete.png');width: 23px;height: 23px;" onclick="BASIC_SelectItem('delete',<%=studentDetailsDTO.getTypeID()%>)" class="button_img" height="20px" value="" /></td>
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
                <table>
                    <tr>
                        <td>
                            <%
                                String visibly = "";
                                if (request.getParameter("actCreate") == null) {
                                    visibly = "display:none;";
                                }
                            %>
                            <div class="site-input-div" style="<%=visibly%>">
                                <div class="site-input-left"><img src="../img/category.png"/></div>
                                <div class="site-input-rigth">
                                    <input placeholder="Please enter name..." id="namecreate" onkeyup="lookupCreate(this.value);" style="  width:395px; height:26px; border:0px solid #d1d1d1;-moz-border-radius: 5px;
                                           -webkit-border-radius: 5px;" name="namecreate" type="text" class="validate[required,minSize[3]] text-input"  />
                                </div>   
                            </div>
                        </td>
                        <td>
                            <!--<div style="width: 30px;<%=visibly%>" >
                                <div style="display: none;" id="autoSuggestionsList"></div>
                                <div style="display: none;" id="error"></div>

                            </div>-->
                        </td>
                        <td>
                            <select name="statusCreate" style="width: 120px;height: 26px;<%=visibly%>">
                                <option value="1">Show</option>
                                <option value="0">Hide</option>
                            </select>
                        </td>
                        <td>
                            <input style="<%=visibly%>" title="Create" type="submit"  name="create" onclick="BASIC_SelectItem('create', 0)" class="button_example" height="20px" value="Create" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div style="<%=visibly%>" >
                                <div style="display: none;" id="autoSuggestionsList"></div>
                                <div style="display: none;" id="error"></div>

                            </div>
                        </td>
                        <td>
                            
                        </td>
                        <td>
                            
                        </td>
                        <td>
                            
                        </td>
                    </tr>
                </table>
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


