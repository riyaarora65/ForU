<%-- 
    Document   : vote
    Created on : 26 Jan, 2017, 11:28:55 AM
    Author     : Riya Arora
--%>

<%@page import="java.sql.Connection"%>
<%@page import="pr1.NAction"%>
<%@page import="pr1.Jdbcpro"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
       int aid=Integer.parseInt(request.getParameter("aid"));
       int vote=Integer.parseInt(request.getParameter("vote"));
       int qid=Integer.parseInt(request.getParameter("qid"));
       int did=Integer.parseInt(request.getParameter("did"));
       int userid=(Integer)session.getAttribute("uid");
       int personid=Integer.parseInt(request.getParameter("personid"));
       String src = request.getParameter("src");
       
       if(vote == NAction.UPVOTE)
       {
           String sql="insert into vote(userid,upvote,quesid,ansid) values(?,?,?,?)";
           try
           {
           Connection con=Jdbcpro.getConnection();
           PreparedStatement p=con.prepareStatement(sql);
           p.setInt(1,userid);
           p.setInt(2,1);
           p.setInt(3,qid);
           p.setInt(4,aid);
           Jdbcpro.insert(p);
            Jdbcpro.closeConnection(con);
           }
           catch(Exception e)
           {
               out.print(e);
           }
       }
       else if(vote == NAction.DOWNVOTE)
       {
            String sql="insert into vote(userid,downvote,quesid,ansid) values(?,?,?,?)";
           try
           {
           Connection con=Jdbcpro.getConnection();
           PreparedStatement p=con.prepareStatement(sql);
           p.setInt(1,userid);
           p.setInt(2,1);
           p.setInt(3,qid);
           p.setInt(4,aid);
           Jdbcpro.insert(p);
           Jdbcpro.closeConnection(con);
           }
           catch(Exception e)
           {
               out.print(e);
           }
       }
       else if(vote == NAction.DLTUPVOTE)
       {
           String sql="Delete from vote where ansid="+aid+" and userid="+userid+" and upvote="+1;
           try
           {
           Connection con=Jdbcpro.getConnection();
           PreparedStatement p=con.prepareStatement(sql);
           p.executeUpdate();
            Jdbcpro.closeConnection(con);
           }
            catch(Exception e)
           {
               out.print(e);
           }
       }
       else if(vote == NAction.DLTDOWNVOTE)
       {
           String sql="Delete from vote where ansid="+aid+" and userid="+userid+" and downvote="+1;
           try
           {
           Connection con=Jdbcpro.getConnection();
           PreparedStatement p=con.prepareStatement(sql);
           p.executeUpdate();
            Jdbcpro.closeConnection(con);
           }
            catch(Exception e)
           {
               out.print(e);
           }
       }
       String sql1="Insert into notifications(senderid,receiverid,type,info) values(?,?,?,?)";
       Connection conn=Jdbcpro.getConnection();
           PreparedStatement p1=conn.prepareStatement(sql1);
           p1.setInt(1,userid);
           p1.setInt(2,personid);
           p1.setInt(3,vote);
           p1.setInt(4,aid);
        Jdbcpro.insert(p1);
           Jdbcpro.closeConnection(conn);
       if(src.equals("answers.jsp"))
       {
            response.sendRedirect(src+"?qid="+qid+"&did="+did);       
       }
       else if(src.equals("profile.jsp"))
       {
          response.sendRedirect(src+"?uid="+personid+"&src=vote.jsp");
        }
               else
       {
              response.sendRedirect(src);
               
        }
        %>
    </body>
            
</html>
