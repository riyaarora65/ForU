<%-- 
    Document   : notireading
    Created on : 9 Feb, 2017, 12:28:42 PM
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
            
            String status=request.getParameter("status");
            String sql="Update notifications set status="+status;
            Connection con=Jdbcpro.getConnection();
            PreparedStatement p=con.prepareStatement(sql);
            p.executeUpdate();
            con.close();
            %>
            <jsp:forward page="noti.jsp" />
    </body>
</html>
