<%-- 
    Document   : postcomment
    Created on : 8 Feb, 2017, 12:35:53 PM
    Author     : Riya Arora
--%>

<%@page import="pr1.Jdbcpro,pr1.NAction"%>
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
            String src=request.getParameter("src");
            Connection con=Jdbcpro.getConnection();
            if(btn.equals("Edit"))
            {
                String cmnt=request.getParameter("txt");
                //out.print(cmnt);
                int cid=Integer.parseInt(request.getParameter("cid"));
                String sql3="Update comments set comment=? where cid="+cid;
                PreparedStatement p=con.prepareStatement(sql3);
                p.setString(1,cmnt);
                 p.executeUpdate();
            }
            else if(btn.equals("Delete"))
            {
                int cid=Integer.parseInt(request.getParameter("cid"));
                String sql3="Delete from comments where cid="+cid;
                PreparedStatement p=con.prepareStatement(sql3);
                p.executeUpdate();
            }
            else if(btn.equals("Post"))
            {
            String comment=request.getParameter("comment");
            int userid=(Integer)session.getAttribute("uid");
            int personid=Integer.parseInt(request.getParameter("personid"));
            int ansid=Integer.parseInt(request.getParameter("ansid"));
            String sql1="Insert into comments(userid,receiverid,comment,ansid) values(?,?,?,?)";
            PreparedStatement p=con.prepareStatement(sql1);
            p.setInt(1,userid);
            p.setInt(2,personid);
            p.setString(3,comment);
            p.setInt(4,ansid);
            Jdbcpro.insert(p);
            String sql2="Insert into notifications(senderid,receiverid,type,info) values(?,?,?,?)";
            PreparedStatement p1=con.prepareStatement(sql2);
            p1.setInt(1,userid);
            p1.setInt(2,personid);
            p1.setInt(3,NAction.COMMENT);
            p1.setInt(4,ansid);
            Jdbcpro.insert(p1); 
            }
            Jdbcpro.closeConnection(con);
            response.sendRedirect(src);
            
            %>
    </body>
</html>
