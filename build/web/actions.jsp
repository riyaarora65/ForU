<%-- 
    Document   : bookmarkques
    Created on : 26 Feb, 2017, 6:29:30 PM
    Author     : Riya Arora
--%>

<%@page import="pr1.Action"%>
<%@page import="pr1.Jdbcpro"%>
<%@page import="java.sql.PreparedStatement"%>
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
            int action=Integer.parseInt(request.getParameter("action"));
            int uid=(Integer)session.getAttribute("uid");
         
            Connection con=Jdbcpro.getConnection();
            if(action == Action.BOOKMARK)
            {
                String src=request.getParameter("src"); 
            int qid=Integer.parseInt(request.getParameter("qid"));
            
            
            String sql="Insert into bookmark(uid,qid) values(?,?)";
            
            PreparedStatement p=con.prepareStatement(sql);
            p.setInt(1,uid);
            p.setInt(2,qid);
            Jdbcpro.insert(p);
            p.close();
            Jdbcpro.closeConnection(con);
            response.sendRedirect(src);
            }
            else if(action == Action.ANSLATER)
            {
            
                  String src=request.getParameter("src"); 
                int did=Integer.parseInt(request.getParameter("did"));
                int qid=Integer.parseInt(request.getParameter("qid"));
              //  String sql1="Select count(*) from anslater where qid="+qid+" and "
                String sql="Insert into anslater(did,qid,uid) values(?,?,?)";
                PreparedStatement p=con.prepareStatement(sql);
                p.setInt(1,did);
                p.setInt(2,qid);
                p.setInt(3, uid);
                Jdbcpro.insert(p);
                if(src.equals("answers.jsp"))
                {  
                    response.sendRedirect(src+"?qid="+qid+"&did="+did);
                }
           else
                {
                  response.sendRedirect(src);
                }
            }
            else if(action == Action.ANONY)
            {
                int qid=Integer.parseInt(request.getParameter("qid"));
                String sql="Update answers set anony=? where quesid=? and uid=?";
                PreparedStatement p=con.prepareStatement(sql);
                p.
                        
            }
                
             %>
            
    </body>
</html>
