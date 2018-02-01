<%-- 
    Document   : postques
    Created on : 31 Jan, 2017, 12:08:51 PM
    Author     : Riya Arora
--%>

<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="pr1.Jdbcpro"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style type="text/css">
            body{
                background:url(resource/M.jpg) repeat;
            }
            .c1
            {
                font-size:20px;
                padding:5px;
                text-align: left;
            }
            .c2
            {
                font-size:15px;
                text-align: left;
            }
            .c3
            {
                background-color:#FFCC99;
                padding:5px;
            }
            .c4
            {
                background-color:darkred;
                color:bisque;
                padding:4px;
            }
        </style>
    </head>
    <body>
               <jsp:include page="header.jsp"/>  
<br/>
        <form action="postquestion.jsp">
        <%
            String domain="",question="";
            String src=request.getParameter("src");
            
            String tags=request.getParameter("tags");
            String sql="Select did,dname from domain";
            Connection con=Jdbcpro.getConnection();
            ResultSet rs=Jdbcpro.get(con,sql);
            while(rs.next())
            {
                domain=domain+"<option value="+rs.getInt(1)+">"+rs.getString(2)+"</option>";
               // domain=domain+"<option value="
            }
            
            %>
            <fieldset style="width:20%;">
                <legend style="text-align:center;font-size:20px;"><b>Ask Your Question</b></legend> 
                <div class="c1"><input type="checkbox" name="chk" value="yes">Go Anonymous</div>
        <div class="c1">Select domain :</div>
        <div class="c2" > <select class="c3" name="domain"><%=domain%></select></div>
        <div class="c1">Others</div>
        <div class="c1">Domain name:</div>
        <div class="c2"><input class="c3" type="text" name="dname" size="50"></div>
        <div class="c1">Description:</div>
        <div class="c2"><textarea class="c3" rows="5" cols="35" name="txtarea"></textarea></div>
         <div style="text-align:right;"><input class=c4 type="submit" value="ADD" name="btn">
        <div class="c1" >Add Tags :</div>
        <div class="c2"><input class="c3" type="text" name="tags" size="50" placeholder="Enter tags seperated by comma">
        <div class="c1"> Your Question :</div>
        <div class="c2"><textarea class="c3" rows="3" cols="30" name="txtques"></textarea></div>
        <div style="text-align:right;"><input class=c4 type="submit" value="submit" name="btn">
            </fieldset>
        </form>
    </body>
    <% Jdbcpro.closeConnection(con);%>
</html>
