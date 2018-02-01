<%-- 
    Document   : Blockuser
    Created on : 3 Feb, 2017, 12:48:46 PM
    Author     : Riya Arora
--%>
<%@page import="java.sql.ResultSet"%>
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
               int blockid=Integer.parseInt(request.getParameter("fid"));// yh block hua h..
               int uid=(Integer)session.getAttribute("uid");// isne kia h block.
               String status=request.getParameter("status");
                String src=request.getParameter("src");
               Connection con=Jdbcpro.getConnection();
               if(status.equals("B"))
               {
                    String sql="Insert into blocklist(userid,blockid) values(?,?)";

                    PreparedStatement p=con.prepareStatement(sql);
                    p.setInt(1,uid);
                    p.setInt(2,blockid);
                    Jdbcpro.insert(p);
                    String sql2="Select userid,followid from following where userid="+uid+" and followid="+blockid;
                    ResultSet rs=Jdbcpro.get(con,sql2);
                    if(rs.next())
                     {
                        String sql1="Delete from following where userid="+uid+" and followid="+blockid;
                        PreparedStatement p1=con.prepareStatement(sql1);
                        p1.executeUpdate();
                     }
                        String sql3="Select userid,followid from following where userid="+blockid+" and followid="+uid;
                        ResultSet rs1=Jdbcpro.get(con,sql3);
                        if(rs1.next())
                        {
                            String sql4="Delete from following where userid="+blockid+" and followid="+uid;
                        PreparedStatement p2=con.prepareStatement(sql4);
                        p2.executeUpdate();
                        }
               }
               else if(status.equals("A"))
               {
                   String sql="Delete from blocklist where userid=? and blockid=?";
                  
                        PreparedStatement p=con.prepareStatement(sql);
                        p.setInt(1,uid);
                        p.setInt(2,blockid);
                       p.executeUpdate();
                    if(src.equals("noti.jsp"))
                    {
                        int nid=Integer.parseInt(request.getParameter("nid"));
                        String sql2="Update notifications set status=? where nid=?";
                        PreparedStatement p2=con.prepareStatement(sql2);
                        p2.setString(1,"R");
                        p2.setInt(2,nid);
                        p2.executeUpdate();
                      
                    }
                       
               }
               Jdbcpro.closeConnection(con);
               response.sendRedirect(src);
               %>
               
            
    </body>
</html>
