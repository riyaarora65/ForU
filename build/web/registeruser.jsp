<%-- 
    Document   : frontpage
    Created on : 31 Jan, 2017, 6:57:22 PM
    Author     : Riya Arora
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="pr1.profile"%>
<%@page import="pr1.Jdbcpro"%>
<%@page import="java.sql.PreparedStatement"%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> Page</title>
    </head>
    <body>
        
      
              <jsp:useBean id="s1" class="pr1.profile" scope="session">
                <jsp:setProperty  name="s1" property="*"/>
            </jsp:useBean>
        <%s1.insert();%>
          <%  response.sendRedirect("login.jsp");%>
    </body>
</html>
