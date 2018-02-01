<%-- 
    Document   : list
    Created on : 6 Feb, 2017, 11:51:50 AM
    Author     : Riya Arora
--%>

<%@page import="java.sql.Connection"%>
<%@page import="pr1.Jdbcpro"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
               String followername="";
               String blockedusername="";
               String action=request.getParameter("action");
               int uid=(Integer)(session.getAttribute("uid"));
               Connection con=Jdbcpro.getConnection();
               if(action.equals("followerslist"))
               {
              String sql="Select p.name,f.followid from following f,profile p where f.followid=p.pid and f.userid="+uid;
               ResultSet rs3=Jdbcpro.get(con,sql);
               while(rs3.next())
               {
                    followername=rs3.getString(1);
            %>
            <div><a href="profile.jsp?uid=<%=rs3.getInt(2)%>"><%=followername%></a></div>
             <% }
               }
               else if(action.equals("blockeduserslist"))
               {
                   String sql="Select p.name,b.blockid from blocklist b,profile p where b.blockid=p.pid and b.userid="+uid;
                    ResultSet rs=Jdbcpro.get(con,sql);
                while(rs.next())
                {
                    blockedusername=rs.getString(1);
            %>
            <div><a div class="c5" href="profile.jsp?uid=<%=rs.getInt(2)%>"><%=blockedusername%></a>
                 <a class="hyperlinks" STYLE="margin-left: 15px;" href="Blockuser.jsp?fid=<%=rs.getInt(2)%>&status=A&src=settingspage.jsp">UNBLOCK</a>
            </div>
            <% 
               }
               }
                Jdbcpro.closeConnection(con);
            %>
    </body>
</html>
