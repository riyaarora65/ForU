<%-- 
    Document   : followques
    Created on : 23 Feb, 2017, 6:48:46 PM
    Author     : Riya Arora
--%>

<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="pr1.Jdbcpro"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            int questionid=Integer.parseInt(request.getParameter("qid"));
            int uid=(Integer)session.getAttribute("uid");
            String sql="Insert into quesfollow(quesid,userid) values(?,?)";
            Connection con=Jdbcpro.getConnection();
            PreparedStatement p=con.prepareStatement(sql);
            p.setInt(1, questionid);
            p.setInt(2, uid);
            Jdbcpro.insert(p);
            p.close();
            con.close();
            %>
    </body>
</html>
