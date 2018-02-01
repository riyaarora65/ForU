<%-- 
    Document   : dltans
    Created on : 26 Apr, 2017, 5:38:40 PM
    Author     : Riya Arora
--%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="pr1.Jdbcpro"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            Connection con=Jdbcpro.getConnection();
            int aid=Integer.parseInt(request.getParameter("aid"));
            String sql1="Delete from answers where aid="+aid;
            String sql2="Delete from vote where ansid="+aid;
            String sql3="Delete from comments where ansid="+aid;
            PreparedStatement p1=con.prepareStatement(sql1);
            PreparedStatement p2=con.prepareStatement(sql2);
            PreparedStatement p3=con.prepareStatement(sql3);
            p1.executeUpdate();
            p2.executeUpdate();
            p3.executeUpdate();
            p1.close();p2.close();p3.close();
            con.close();
            response.sendRedirect("Youpage.jsp");
            %>
    </body>
</html>
