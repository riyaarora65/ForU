<%-- 
    Document   : Validate
    Created on : 27 Jan, 2017, 12:04:15 PM
    Author     : Riya Arora
--%>

<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="pr1.Jdbcpro"%>
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
            String u=request.getParameter("username");
            String pass=request.getParameter("password");
            String sql="Select * from profile where email=? and password=?";
            Connection con=Jdbcpro.getConnection();
            PreparedStatement p=con.prepareStatement(sql);
            p.setString(1,u);
            p.setString(2,pass);
            
            ResultSet rs=p.executeQuery();
            if(rs.next())
            {
               session.setAttribute("uid",rs.getInt(1));
               response.sendRedirect("Home.jsp");
            }
            else
            {
                response.sendRedirect("login.jsp?msg=Invalid Username or Password");
               
            }
            p.close();
            con.close();
            %>
    </body>
</html>
