<%-- 
    Document   : reqans
    Created on : 7 Mar, 2017, 11:16:02 PM
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
         <link rel="stylesheet" href="forucss.css">
    </head>
    <body>
             <jsp:include page="header.jsp"/>  
        <%
            String name="";
            String image="";
            int uid1=0,uid2=0;
            int userid=(Integer)(session.getAttribute("uid"));
            int qid=Integer.parseInt(request.getParameter("qid"));
            int did=Integer.parseInt(request.getParameter("did"));
             Connection con=Jdbcpro.getConnection();
            String sql1="Select q.userid,b.blockid from querry q,blocklist b where q.qid="+qid+" and b.userid="+userid;
            ResultSet rs1=Jdbcpro.get(con, sql1);
            while(rs1.next())
            {
                uid1=rs1.getInt(1);
                uid2=rs1.getInt(2);
            }
            String sql="select p.name,p.img,p.pid from profile p,answers a where p.pid=a.uid and a.domainid="+did+" and p.pid<>"+userid+" and p.pid<>"+uid1+" and p.pid<>"+uid2;
           
            ResultSet rs=Jdbcpro.get(con,sql);
            
            while(rs.next())
            {
             name=rs.getString(1);  
             image="resource/"+rs.getString(2);
              int   pid=rs.getInt(3);
            %>
            <div><img style="height:100px;width:100px;margin-top:15px;" src="<%=image%>"></div>
            <div><a class="hyperlinks" href="reqansinsert.jsp?qid=<%=qid%>&did=<%=did%>&reqid=<%=pid%>"><%=name%></a></div>
            <%
               Jdbcpro.closeConnection(con);
            }
           
            %>
    </body>
</html>
