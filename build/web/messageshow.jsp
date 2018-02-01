<%-- 
    Document   : messageshow
    Created on : 14 Feb, 2017, 12:07:29 PM
    Author     : Riya Arora
--%>

<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
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
            int id=(Integer)session.getAttribute("uid");
            String name="",message="";
            String sql1="select a.pid, a.name from profile a join (select receiverid as pid from message where senderid="+id+" group by receiverid) b where a.pid = b.pid";
            Connection con=Jdbcpro.getConnection();
            ResultSet rs1=Jdbcpro.get(con,sql1);
            while(rs1.next())
            {
             name=rs1.getString(2);
            // message=rs1.getString(1);
            
             %>
             <div style="width:25%;"><b>
                     <a href="Conversation.jsp?pid=<%=rs1.getInt(1)%>"><%=name%></a>
                 </b></div>
            
                         
             <%
            }
            String sql="select a.pid, a.name from profile a join (select senderid pid from message where receiverid="+id+" group by receiverid) b where a.pid = b.pid";
            ResultSet rs=Jdbcpro.get(con,sql);
            while(rs.next())
            {
                name=rs.getString(2);
                //message=rs.getString(1);
            
                
        %>
        
        <div style="width:25%;"><b>
                <a href="Conversation.jsp?pid=<%=rs.getInt(1)%>"><%=name%></a>
            </b></div>
       
          <%  
            }
             Jdbcpro.closeConnection(con);
            %>
            
    </body>
</html>
