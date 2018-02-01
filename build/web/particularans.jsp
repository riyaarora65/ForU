<%-- 
    Document   : particularans
    Created on : 30 Jan, 2017, 6:21:08 PM
    Author     : Riya Arora
--%>

<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="pr1.Jdbcpro"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="forucss.css">
        <title>JSP Page</title>
    </head>
    
    <body>
        <jsp:include page="header.jsp" />
        <%
            String ques="";
            String ans="";
            String src="";
            int userid=0;
           int ansid=Integer.parseInt(request.getParameter("aid"));
           
           String comment="";
           src=request.getParameter("src");
           
           Connection con=Jdbcpro.getConnection();
           String sql="Select q.ques,a.ans from querry q,answers a where q.qid=a.quesid and a.aid="+ansid;
           ResultSet rs=Jdbcpro.get(con,sql);
           while(rs.next())
           {
              ques=rs.getString(1);
              ans=rs.getString(2);
           }
           String sql1="Select a.uid,comment c,p.name from answers a,comments c,profile p where a.aid="+ansid+" and c.ansid="+ansid+" and p.pid=c.userid";
                ResultSet rs1=Jdbcpro.get(con,sql1);%>
                <div>
                    <div class="ques_ans"><b><%=ques%></b></div>
                  <div class="ques_ans"><%=ans%></div>
                <%
           while(rs1.next())
           {
              
              userid=rs1.getInt(1);
              comment=rs1.getString(2);
              String name=rs1.getString(3);
        %>
        <form action="postcomment.jsp" method="post">
        <div class="profileinfo" style="margin-left: 10px;"><b><%=name%></b></div>
                  <div style="margin-left: 10px;"><%=comment%></div>
                  <%}%>
                  <div style="margin-left: 10px;">Write your comment here.</div>
                  <div style="margin-left: 10px;"><input class="textareas" type="text" name="comment" size="36" ></div>
                  <div align="right" style="width:28%;margin-top:5px;"><input class="buttons" type="submit" value="Post" name="postbtn"></div>
                            
                                <input type="hidden" name="personid" value="<%=userid%>"> 
                                <input type="hidden" name="ansid" value="<%=ansid%>">
        </form>
            <%
          String sql10="Select sum(upvote),sum(downvote) from vote where ansid="+ansid;
          ResultSet rs3=Jdbcpro.get(con, sql10);
          while(rs3.next())
          {%>
          <div style="float:left;width: 25%;margin-left:10px;"><h3>Upvotes:<%=rs3.getInt(1)%></h3></div>
          <div style="float:left;margin-left:10px;"><h3>Downvotes:<%=rs3.getInt(2)%></h3></div>
              
          <%}
                                %>
     
                </div>
           <%
           rs.close();
           rs1.close();
           String sql2="Update answers set view=view+1 where aid="+ansid+" and uid <>"+userid;
           PreparedStatement p=con.prepareStatement(sql2);
           p.executeUpdate();
           p.close();
           String sql3="Select view from answers where aid="+ansid;
           ResultSet rs2=Jdbcpro.get(con,sql3);
           if(rs2.next())
           {
               if(rs2.getInt(1)> 100)
           {
               String sql4="Insert into notifications(receiverid,type,info) values(?,?,?)";
                 PreparedStatement p1=con.prepareStatement(sql4);
                 p1.setInt(1,userid);
                 p1.setInt(2, 11);
                 p1.setInt(3,ansid);
                 Jdbcpro.insert(p1);
           }
               else if(rs2.getInt(1)>500)
               {
                   String sql5="Insert into notifications(receiverid,type,info) values(?,?,?)";
                 PreparedStatement p2=con.prepareStatement(sql5);
                 p2.setInt(1,userid);
                 p2.setInt(2, 12);
                 p2.setInt(3,ansid);
                 Jdbcpro.insert(p2);
               }
               else if(rs2.getInt(1)>1000)
               {
                    String sql6="Insert into notifications(receiverid,type,info) values(?,?,?)";
                 PreparedStatement p3=con.prepareStatement(sql6);
                 p3.setInt(1,userid);
                 p3.setInt(2, 13);
                 p3.setInt(3,ansid);
                 Jdbcpro.insert(p3);
               }
               else if(rs2.getInt(1)>10000)
               {
                   String sql7="Insert into notifications(receiverid,type,info) values(?,?,?)";
                 PreparedStatement p4=con.prepareStatement(sql7);
                 p4.setInt(1,userid);
                 p4.setInt(2, 14);
                 p4.setInt(3,ansid);
                 Jdbcpro.insert(p4);
               }
           }
           if(src.equals("noti.jsp"))
           {
               int nid=Integer.parseInt(request.getParameter("nid"));
               String sql8="Update notifications set status='R' where nid="+nid;
                 PreparedStatement p5=con.prepareStatement(sql8);
                 p5.executeUpdate();
           }
        %>
             
              <%
             
              Jdbcpro.closeConnection(con);
              
              %>
    </body>
</html>
