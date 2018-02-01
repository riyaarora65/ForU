<%-- 
    Document   : logout.jsp
    Created on : 22 Mar, 2017, 10:54:14 AM
    Author     : Riya Arora
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            session.invalidate();
            response.sendRedirect("login.jsp");
            %>
    </body>
</html>
