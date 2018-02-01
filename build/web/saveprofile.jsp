<%-- 
    Document   : saveprofile.jsp
    Created on : 28 Feb, 2017, 8:42:22 PM
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
                int pid=(Integer)session.getAttribute("uid");
            String name=request.getParameter("t1");
             String edu=request.getParameter("t2");
             String city=request.getParameter("cityname");
             String status=request.getParameter("t4");
             String email=request.getParameter("t5");
             String pass=request.getParameter("t6");
            String sql="Update profile set name=?,education=?,city=?,status=?,email=?,password=? where pid="+pid;
             Connection con=Jdbcpro.getConnection();
             PreparedStatement p=con.prepareStatement(sql);
             p.setString(1, name);
             p.setString(2, edu);
             p.setString(3, city);
             p.setString(4, status);
             p.setString(5, email);
             p.setString(6, pass);
             p.executeUpdate();
             con.close();
             response.sendRedirect("Youpage.jsp");
            %>
            
    </body>
</html>
