<%-- 
    Document   : reqansinsert.jsp
    Created on : 6 Apr, 2017, 7:26:41 PM
    Author     : Riya Arora
--%>

<%@page import="pr1.Action"%>
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
              int userid = (Integer) session.getAttribute("uid");
              int reqid=Integer.parseInt(request.getParameter("reqid"));
              int did=Integer.parseInt(request.getParameter("did"));
              int qid=Integer.parseInt(request.getParameter("qid"));
              String sql="Insert into ansreq(userid,reqid,did,qid) values(?,?,?,?)";
              Connection con=Jdbcpro.getConnection();
              PreparedStatement p=con.prepareStatement(sql);
              p.setInt(1,userid);
              p.setInt(2,reqid);
              p.setInt(3,did);
              p.setInt(4,qid);
              Jdbcpro.insert(p);
              p.close();
              String sql1="Insert into notifications(senderid,receiverid,type,info) values(?,?,?,?)";
              PreparedStatement p1=con.prepareStatement(sql1);
              p1.setInt(1,userid);
              p1.setInt(2,reqid);
              p1.setInt(3,Action.ANSREQ);
              p1.setInt(4,qid);
              Jdbcpro.insert(p1);
              p1.close();
              Jdbcpro.closeConnection(con);
             response.sendRedirect("answers.jsp?qid="+qid+"&did="+did);
            %>
    </body>
</html>
