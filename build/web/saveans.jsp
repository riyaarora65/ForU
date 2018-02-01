<%-- 
    Document   : saveans
    Created on : 11 Feb, 2017, 11:36:32 AM
    Author     : Riya Arora
--%>

<%@page import="java.sql.ResultSet"%>
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
            int aid=Integer.parseInt(request.getParameter("aid"));
            String ans=request.getParameter("txtarea");
            String src = request.getParameter("src");
            int qid=0,did=0;
            String sql="Update answers set date=?, ans=?,written=? where aid=?";
            Connection con=Jdbcpro.getConnection();
            PreparedStatement p=con.prepareStatement(sql);
            p.setDate(1,new java.sql.Date(new java.util.Date().getTime()));
            p.setString(2,ans);
            p.setInt(3, aid);
            p.setInt(4,NAction.UPDATED);
            p.executeUpdate();
  
            String sql1="Select quesid,domainid from answers";
            ResultSet rs=Jdbcpro.get(con,sql1);
            while(rs.next())
            {
                qid=rs.getInt(1);
                did=rs.getInt(2);
            }
             if(src.equals("answers.jsp"))
       {
              
            %>
               <jsp:forward page="answers.jsp">
            <jsp:param name="qid" value="<%=qid%>"/>
            <jsp:param name="qid" value="<%=did%>"/>
             </jsp:forward>
                 <%}
               else
       {
               %>
               <jsp:forward page="<%=src%>"/>
               <%}
                Jdbcpro.closeConnection(con);
               %>
    </body>
</html>
