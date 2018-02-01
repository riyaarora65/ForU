<%-- 
    Document   : submitans
    Created on : 25 Jan, 2017, 6:06:08 PM
    Author     : Riya Arora
--%>
<%@page import="pr1.NAction"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="pr1.Jdbcpro"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String action=request.getParameter("btn");
            Connection conn=Jdbcpro.getConnection();
              String answer=request.getParameter("txtcontent");
        int qid=Integer.parseInt(request.getParameter("qid"));
        int did=Integer.parseInt(request.getParameter("did"));
        int uid=(Integer)session.getAttribute("uid");
       
            if(action.equals("Submit"))
            {
      
        String sql="Insert into answers (ans,domainid,quesid,uid,date,written) values(?,?,?,?,?,?)";
        
        PreparedStatement p=conn.prepareStatement(sql);
        p.setString(1,answer);
        p.setInt(2,did);
        p.setInt(3,qid);
        p.setInt(4,uid);
        p.setDate(5,new java.sql.Date(new java.util.Date().getTime()));
        p.setInt(6,NAction.WRITTEN);
        Jdbcpro.insert(p);
        p.close();
         String sql1="Select qf.userid,max(a.aid) from quesfollow qf,answers a where qf.quesid="+qid;
        ResultSet rs=Jdbcpro.get(conn,sql1);
        while(rs.next())
        {
            String sql2="Insert into notifications(senderid,receiverid,type,info) values(?,?,?,?)";
            PreparedStatement p1=conn.prepareStatement(sql2);
            p1.setInt(1, uid);
            p1.setInt(2,rs.getInt(1));
            p1.setInt(3,NAction.FQUESANS);
            p1.setInt(4,rs.getInt(2));
            Jdbcpro.insert(p1);
            p1.close();
        }
        String sql3="Select q.userid,max(a.aid) from querry q,answers a where q.qid="+qid;
        ResultSet rs1=Jdbcpro.get(conn,sql3);
        while(rs1.next())
        {
             String sql4="Insert into notifications(senderid,receiverid,type,info) values(?,?,?,?)";
             PreparedStatement p2=conn.prepareStatement(sql4);
                p2.setInt(1,uid);
                p2.setInt(2,rs1.getInt(1));
                p2.setInt(3,NAction.ANSWER);
                p2.setInt(4,rs1.getInt(2));
                Jdbcpro.insert(p2);
                p2.close();
        }
            
            rs.close();
            rs1.close();
            }
              else
            {
                String sql1="Select qid,uid from draft where qid="+qid+" and uid="+uid;
                ResultSet rs=Jdbcpro.get(conn,sql1);
                if(rs.next())
                {
                    String sql2="Update draft set ans=? where qid=? and uid=?";
                    PreparedStatement p=conn.prepareStatement(sql2);
                    p.setString(1,answer);
                    p.setInt(2,qid);
                    p.setInt(3,uid);
                    p.executeUpdate();
                    p.close();
                }
                else
                {
                String sql="Insert into draft(qid,uid,domainid,ans) values(?,?,?,?)";
                PreparedStatement p=conn.prepareStatement(sql);
                p.setInt(1,qid);
                p.setInt(2,uid);
                p.setInt(3,did);
                p.setString(4,answer);
                Jdbcpro.insert(p);
                p.close();
                }
            }
    
       
       response.sendRedirect("answers.jsp?qid="+qid+"&did="+did);
          
        Jdbcpro.closeConnection(conn);
        %>
    </body>
</html>