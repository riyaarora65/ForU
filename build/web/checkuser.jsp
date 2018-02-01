<%-- 
    Document   : checkuser
    Created on : 21 Feb, 2017, 6:59:20 PM
    Author     : Riya Arora
--%>

<%@page import="pr1.NAction"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="pr1.Jdbcpro"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String src="";
            int personid=Integer.parseInt(request.getParameter("uid"));//jiski profile kholni h. 2
            src=request.getParameter("src");
            int userid=(Integer)session.getAttribute("uid");//mai hu 7
            Connection con=Jdbcpro.getConnection();
            String image="resource/r7.jpg";
           
           String sql2="select count(*) from blocklist where userid="+personid+" or userid="+userid+" and blockid="+personid+" or blockid="+userid;
           ResultSet rs2=Jdbcpro.get(con, sql2);
           while(rs2.next())
           {
           if(rs2.getInt(1)==0)
           {
           response.sendRedirect("profile.jsp?uid="+personid+"&src=checkuser.jsp");
           
            }
           else
            {
                String sql="Select userid,blockid from blocklist where userid="+userid+" and blockid="+personid;//means maine block kia h toh
            ResultSet rs=Jdbcpro.get(con,sql);
            if(rs.next())
            {
        %>
         <form action="unblockuser.jsp">
            <div>
                <h1>:-(</h1>
                <div>You cannot view the profile of this person.Kindly Unblock to proceed</div>
                <div><input type="submit" value="Unblock" name="btn"></div> 
            </div>
                <input type="hidden" name="bid" value="<%=personid%>">
            </form>
          <%  }
            String sql1="Select userid,blockid from blocklist where userid="+personid+" and blockid="+userid;//means mai block hu toh.
            ResultSet rs1=Jdbcpro.get(con,sql1);
           if(rs1.next())
            {%>
              <form action="unblockrequest.jsp">
                <div style="width:100%;margin-top:10px;">
                    <div style="width:70%;height:100%;border:2px solid red;float:left;margin-left:10px;">
                        <div><img style="width:300px;height:300px;" src="<%=image%>">
                            <h1>Oops...</h1>Something went wrong.You cannot view the profile of this person as you are blocked.</div> 
                    <div>You can send a request to user to Unblock.</div>
                    <div><input type="submit" name="btn" value="Send"></div>
                        </div>
                </div>
                <input type="hidden" name="pid" value="<%=personid%>">      
                <input type="hidden" name="type" value="<%=NAction.UNBLOCK%>">
            </form>
           <% }
            }
           }  
            if(src.equals("noti.jsp"))
            {
               int nid=Integer.parseInt(request.getParameter("nid"));
              String sql8="Update notifications set status='R' where nid="+nid;
              PreparedStatement p5=con.prepareStatement(sql8);
                 p5.executeUpdate();   
            }
            Jdbcpro.closeConnection(con);
         
            %>
    </body>
</html>
