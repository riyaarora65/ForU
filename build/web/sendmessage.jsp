<%-- 
    Document   : sendmessage
    Created on : 14 Feb, 2017, 11:47:46 AM
    Author     : Riya Arora
--%>

<%@page import="pr1.Jdbcpro"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            {
            int receiverid=Integer.parseInt(request.getParameter("receiverid"));
            int senderid=(Integer)session.getAttribute("uid");
            String message=request.getParameter("txtmsg");
            if(senderid != receiverid)
             {
                String sql="Insert into message(senderid,receiverid,msg) values(?,?,?)";
                Connection con=Jdbcpro.getConnection();
                PreparedStatement p=con.prepareStatement(sql);
                p.setInt(1,senderid);
                p.setInt(2,receiverid);
                p.setString(3,message);
                Jdbcpro.insert(p);
                con.close();
             }
            }
            %>
    </body>
</html>
