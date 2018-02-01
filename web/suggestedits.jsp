<%-- 
    Document   : suggestedits
    Created on : 25 Feb, 2017, 5:45:35 PM
    Author     : Riya Arora
--%>

<%@page import="pr1.NAction"%>
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
            int qid=Integer.parseInt(request.getParameter("qid"));
            int pid=Integer.parseInt(request.getParameter("uid"));
            int did=Integer.parseInt(request.getParameter("did"));
            int uid=(Integer)session.getAttribute("uid");
            String src=request.getParameter("src");
            String sql="Insert into notifications(receiverid,type,senderid,info) values(?,?,?,?)";
            Connection con=Jdbcpro.getConnection();
            PreparedStatement p=con.prepareStatement(sql);
            p.setInt(1,pid);
            p.setInt(2,NAction.suggestedits);
            p.setInt(3,uid);
            p.setInt(4,qid);
            Jdbcpro.insert(p);
            p.close();
            Jdbcpro.closeConnection(con);
            response.sendRedirect(src+"?qid="+qid+"&did="+did);
                    
            %>
           
    </body>
     
</html>