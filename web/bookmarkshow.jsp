<%-- 
    Document   : bookmarkshow
    Created on : 26 Feb, 2017, 6:55:24 PM
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
            int uid=(Integer)session.getAttribute("uid");
            Connection con=Jdbcpro.getConnection();
            String sql="Select q.ques,b.qid from bookmark b,querry q where q.qid=b.qid and b.uid="+uid;
            ResultSet rs=Jdbcpro.get(con,sql);
            while(rs.next())
            {
                out.print(rs.getString(1));
               %>
               <div>
                   <div></div>
               </div>               
            <%}
            con.close();
            %>
    </body>
</html>
