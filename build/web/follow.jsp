<%-- 
    Document   : follow
    Created on : 2 Feb, 2017, 6:43:21 PM
    Author     : Riya Arora
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="pr1.Jdbcpro,pr1.NAction"%>
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
            int fid=Integer.parseInt(request.getParameter("userid"));
            String status=request.getParameter("status");
            String src=request.getParameter("src");
              if(status == null)// yh hum yha unfollow k liye dlt kr rhe h r koi status waha se pass nhi hora so null se chk kr rhe. 
            {
                String sql="Delete from following where userid="+uid+" and followid="+fid;
                String sql2="Insert into notifications(senderid,receiverid,type) values(?,?,?)";
                 Connection con=Jdbcpro.getConnection();
                    PreparedStatement p1=con.prepareStatement(sql);
                   p1.executeUpdate();
                     PreparedStatement p2=con.prepareStatement(sql2);
                     p2.setInt(1,uid);
                     p2.setInt(2,fid);
                     p2.setInt(3,NAction.UNFOLLOW);
                    p2.executeUpdate();
                   Jdbcpro.closeConnection(con);
            }
           else if(status.equals("A"))
            {
            String sql="Insert into following(userid,followid) values(?,?)";
             String sql2="Insert into notifications(senderid,receiverid,type) values(?,?,?)";
            Connection con=Jdbcpro.getConnection();
            PreparedStatement p=con.prepareStatement(sql);
            p.setInt(1,uid);
            p.setInt(2,fid);
            Jdbcpro.insert(p);
            PreparedStatement p2=con.prepareStatement(sql2);
                     p2.setInt(1,uid);
                     p2.setInt(2,fid);
                     p2.setInt(3,NAction.FOLLOW);
                     Jdbcpro.insert(p2);
                     Jdbcpro.closeConnection(con);
            }
           if(src.equals("profile.jsp"))
           {
               response.sendRedirect(src+"?uid="+fid+"&src=follow.jsp");
            }
           else
           {
               response.sendRedirect(src);
           }
           %>
           
    </body>
</html>
