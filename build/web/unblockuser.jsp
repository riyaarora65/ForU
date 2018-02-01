<%-- 
    Document   : unblockuser
    Created on : 21 Feb, 2017, 7:23:35 PM
    Author     : Riya Arora
--%>

<%@page import="java.sql.Connection"%>
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
            int bid=Integer.parseInt(request.getParameter("bid"));
            int uid=(Integer)session.getAttribute("uid");
            String sql="Delete from blocklist where userid="+uid+" and blockid="+bid;
            Connection con=Jdbcpro.getConnection();
            PreparedStatement p=con.prepareStatement(sql);
            p.executeUpdate();
          %>  
          <jsp:forward page="profile.jsp">
              <jsp:param name="uid" value="<%=bid%>" />
          </jsp:forward>
    </body>
</html>
