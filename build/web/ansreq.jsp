<%-- 
    Document   : ansreq
    Created on : 25 Jul, 2017, 2:12:12 PM
    Author     : Riya Arora
--%>

<%@page import="java.sql.ResultSet"%>
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
            int uid=(Integer)session.getAttribute("uid");
            String name="";
            String ques="";
            String sql="Select q.ques,p.name from profile p,querry q,ansreq ar where ar.reqid="+uid+" and ar.userid=p.pid and q.qid=ar.qid";
            Connection con=Jdbcpro.getConnection();
            ResultSet rs=Jdbcpro.get(con,sql);
            if(!rs.next())
            {
                out.print("No new answer requests");
            }
                while(rs.next())
                {
                name=rs.getString(2);
                ques=rs.getString(1);
            
            
            %>
            <div>
                <%=name%> requested you to answer this Question
                <%=ques%>
            </div>
                <%
            }
                
                
            rs.close();
            Jdbcpro.closeConnection(con);
                %>
    </body>
</html>
