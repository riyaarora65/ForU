<%-- 
    Document   : savequesans
    Created on : 14 Apr, 2017, 6:10:36 PM
    Author     : Riya Arora
--%>

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
            String btn=request.getParameter("btn");
            int qid=Integer.parseInt(request.getParameter("qid"));
            Connection con=Jdbcpro.getConnection();
            if(btn.equals("Save"))
            {
                String ques=request.getParameter("txtques");
                String sql="Update querry set ques=? where qid=?";
                PreparedStatement p=con.prepareStatement(sql);
                p.setString(1,ques);
                p.setInt(2,qid);
                p.executeUpdate();
            }
            else if(btn.equals("Submit"))
            {
                String ans=request.getParameter("txtcontent");
                String sql="Update answers set ans=? where qid=?";
                PreparedStatement p=con.prepareStatement(sql);
                p.setString(1,ans);
                p.setInt(2,qid);
                p.executeUpdate();
            }
            response.sendRedirect("Home.jsp");
            
            %>
    </body>
</html>
