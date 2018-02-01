<%-- 
    Document   : settingspage
    Created on : 27 Feb, 2017, 6:42:10 PM
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
        <link rel="stylesheet" href="forucss.css">
    </head>
    <body>
           <jsp:include page="header.jsp"/> 
        <%
            String domain="";
            Connection con=Jdbcpro.getConnection();
            ResultSet rs=Jdbcpro.get(con,"Select * from domain");
            while(rs.next())
            {
                domain=domain+"<option value="+rs.getInt(1)+">"+rs.getString(2)+"</option>";
            }
            
            %>
            <form action="add_domain">
            <div>
                <div><a class="hyperlinks" href="editprofile.jsp">Edit profile</a></div>
                <div class="hyperlinks">Add Domains
                    <div><select class="textareas" name="domain_name">
                          <%=domain%>
                        </select> </div>
                        <div><input class="buttons" style="padding:.5%;margin-top:5px;margin-left: 130px;" type="submit" name="btn" value="Add" ></div>
                </div>
            </form>
                        <div><a class="hyperlinks" href="list.jsp?action=blockeduserslist">Block list</a></div>
                        <div><a class="hyperlinks" href="aboutus.jsp">About Us</a></div>
                        <div><a class="hyperlinks" href="logout.jsp">Log out</a></div>
                        <div><a class="hyperlinks" href="deleteaccount.jsp">Delete my account</a></div>
            </div>
                        <%Jdbcpro.closeConnection(con);%>
    </body>
</html>
