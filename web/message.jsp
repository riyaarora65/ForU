<%-- 
    Document   : sendmessage
    Created on : 14 Feb, 2017, 11:47:46 AM
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
            String image1="resource/send.jpg";
            String image2="resource/r7.jpg";
            String name="";
            int receiverid=Integer.parseInt(request.getParameter("receiverid"));
            Connection con=Jdbcpro.getConnection();
            String sql="Select name from profile where pid="+receiverid;
            ResultSet rs=Jdbcpro.get(con,sql);
            while(rs.next())
            {
                name=rs.getString(1);
            }
            %>
            <div style="width:70%;margin-top:15px;">
                <div style="width:25%;margin-left: 10px;">
                <div style="float:left;"><img style="width:70px;height:70px;" src="<%=image2%>"></div>
                 <div style="float:left;font-weight: bold;font-size: 22px;margin-top: 18px;"><%=name%></div>
                </div>
                <div style="width:25%;margin-left: 10px;">
                    <br/>

                    <div style="float:left;">
                        <textarea class="textareas" rows= "10" cols="40" name="txtmsg" placeholder="Enter your message Here"></textarea>
                    </div>
               <div style="float:left;">  <a href="sendmessage.jsp?receiverid=<%=receiverid%>"><img style="height:70px;width:70px;" src="<%=image1%>"></a></div>
                </div>
            </div>
    </body>
    <% Jdbcpro.closeConnection(con);%>
</html>
