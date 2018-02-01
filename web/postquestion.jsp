<%-- 
    Document   : postquestion
    Created on : 31 Jan, 2017, 12:36:22 PM
    Author     : Riya Arora
--%>

<%@page import="java.sql.ResultSet"%>
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
            String question="";
            String action=request.getParameter("btn");
            int uid=(Integer)session.getAttribute("uid");
            String anony=request.getParameter("chk");
            
            
            
            Connection conn=Jdbcpro.getConnection();
            if(action.equals("submit"))
            {
            String ques=request.getParameter("txtques");
            String tags=request.getParameter("tags");
            int did=Integer.parseInt(request.getParameter("domain"));
                 int qid=0;
            String sql1="Select * from userdomain where domainid="+did+" and userid="+uid;
            ResultSet rs=Jdbcpro.get(conn,sql1);
           if(!rs.next())
           {
                    String sql2="Insert into userdomain(domainid,userid) values(?,?,)";
                
                    PreparedStatement p=conn.prepareStatement(sql2);
                    p.setInt(1,did);
                    p.setInt(2,uid);
                    Jdbcpro.insert(p);
                }
           if(anony.equals("yes"))
           {
               
                 String sql="Insert into querry(did,ques,userid,anony) values(?,?,?,?)";
                    PreparedStatement p=conn.prepareStatement(sql);
                    p.setInt(1,did);
                    p.setString(2,ques);
                    p.setInt(3,uid);
                    p.setString(4,anony);
                    Jdbcpro.insert(p);
           }
           else
           {
               String sql="Insert into querry(did,ques,userid) values(?,?,?)";
                    PreparedStatement p=conn.prepareStatement(sql);
                    p.setInt(1,did);
                    p.setString(2,ques);
                    p.setInt(3,uid);
                    Jdbcpro.insert(p);
            }
                    String sql4="Select max(qid) from querry";
                    ResultSet rs1=Jdbcpro.get(conn,sql4);
                    while(rs1.next())
                    {
                        qid=rs1.getInt(1);
                    }
                    
                     String str[]=tags.split(",");
                     for(int i=0;i<str.length;i++)
                     {
                         String sql3="Insert into keyword(tags,quesid,did) values(?,?,?)";
                         PreparedStatement p1=conn.prepareStatement(sql3);
                         p1.setString(1, str[i]);
                         p1.setInt(2,qid);
                         p1.setInt(3,did);
                         Jdbcpro.insert(p1);
              
                     }
            }
            else
            {
                String dname=request.getParameter("dname");
                String desc=request.getParameter("txtarea");
                String sql="Insert into domain(dname,dinfo) values(?,?)";
                PreparedStatement p=conn.prepareStatement(sql);
                p.setString(1,dname);
                p.setString(2,desc);
                Jdbcpro.insert(p);
                
            }
                     Jdbcpro.closeConnection(conn);
        response.sendRedirect("postques.jsp");            %>
           
    </body>
</html>
