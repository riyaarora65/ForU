<%-- 
    Document   : registerpoll
    Created on : 26 Jan, 2017, 12:59:45 PM
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
            String ans=request.getParameter("Answer");
            int qid=(Integer.parseInt(request.getParameter("qid")));
            if(ans.equals("Y"))
            {
                String sql="update pollanswers set ansY=ansY+1 where aid="+qid;
                Connection con=Jdbcpro.getConnection();
                 PreparedStatement p=con.prepareStatement(sql);
                 p.executeUpdate();
                 con.close();
                       
            }
            %>
    </body>
</html>
