<%-- 
    Document   : unblockrequest
    Created on : 7 Feb, 2017, 12:08:07 PM
    Author     : Riya Arora
--%>

<%@page import="pr1.NAction"%>
<%@page import="java.sql.ResultSet"%>
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
            int receiverid=Integer.parseInt(request.getParameter("pid"));
           
            int senderid=(Integer)session.getAttribute("uid");
            Connection con=Jdbcpro.getConnection();
            String sql="Select numreq from reqblock where senderid="+senderid+" and receiverid="+receiverid;
            ResultSet rs=Jdbcpro.get(con,sql);
            if(rs.next())
            {
                if(rs.getInt(1) <=2)
                {

               String sql1="Insert into notifications(senderid,receiverid,type) values(?,?,?)";
                  PreparedStatement p=con.prepareStatement(sql1);
                   p.setInt(1,senderid);
                  p.setInt(2,receiverid);
                  p.setInt(3,NAction.UNBLOCK);
                  Jdbcpro.insert(p);
                
                String sql3="Update reqblock set numreq=numreq+1 where senderid="+senderid+" and receiverid="+receiverid; 
                PreparedStatement p2=con.prepareStatement(sql3);
                p2.executeUpdate();
                }
            }
            else
            {
                 String sql1="Insert into notifications(senderid,receiverid,type) values(?,?,?)";
               PreparedStatement p=con.prepareStatement(sql1);
                p.setInt(1,senderid);
               p.setInt(2,receiverid);
               p.setInt(3,NAction.UNBLOCK);
               Jdbcpro.insert(p);
            String sql2="Insert into reqblock(senderid,receiverid,numreq) values(?,?,?)";
               PreparedStatement p1=con.prepareStatement(sql2);
               p1.setInt(1,senderid);
               p1.setInt(2,receiverid);;
               p1.setInt(3,1);
               Jdbcpro.insert(p1);
            
            }
            Jdbcpro.closeConnection(con);
            response.sendRedirect("Home.jsp");
            %>
         
    </body>
</html>
