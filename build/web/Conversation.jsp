<%-- 
    Document   : Conversation.jsp
    Created on : 16 Feb, 2017, 12:49:17 PM
    Author     : Riya Arora
--%>

<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="pr1.Jdbcpro"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
             <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>JSP Page</title>
             <link rel="stylesheet" href="forucss.css">
    </head>
  <body>
      <form action="sendmessage.jsp">
      <%
            String image="resource/r7.jpg";
            int id=(Integer)session.getAttribute("uid");
            int pid=Integer.parseInt(request.getParameter("pid"));
            String message="",name="";
            String sql1="Select name from profile where pid="+pid;
             Connection con=Jdbcpro.getConnection();
            ResultSet rs1=Jdbcpro.get(con,sql1);
             while(rs1.next())
             {
                 name=rs1.getString(1);
             }%>
    <div style="width:50%;border:2px solid #660000;overflow:auto;height:70%;">
	    <div style="height:12%;margin-left:5px;margin-top:5px;overflow:auto;">
	       <div style="float:left;"><img style="height:70px;width:70px;margin-top:3px;"  src="<%=image%>"></div>
	        <div style="float:left;font-size: 25px;font-weight:bold;margin-top:15px;margin-left:10px;"><%=name%></div>
	     </div>
             <div style="width:80%;margin-top:10px;margin-left:6px;overflow:auto;">     
              <%
            String sql="select msg,senderid from message where (receiverid="+pid+" and senderid="+id+") or (senderid="+pid+" and receiverid="+id+") order by mid";
            ResultSet rs=Jdbcpro.get(con,sql);
            while(rs.next())
            {
                if((rs.getInt(2)) == id)
                {  
                     
                  message=rs.getString(1);
        %>
		   
                    <div style="text-align:right;border:2px solid darkred;width:90%;border-radius:10px;">
                        <div style="font-size:20px;font-style: italic;text-align: right;margin-right:10px;"> <b>  <%=message%> </b> </div>
                    </div>
                    <br/>
                     <%}
                else
                {
                    message=rs.getString(1);
                    %>
                    <div style="text-align: left;border:2px solid darkred;width:90%;border-radius:10px; ">
                        <div style="font-size:20px;font-style: italic;text-align: left;margin-left:10px;"> <b>   <%=message%> </b> </div>
                    </div> 
                    <br/>
		
                     <%   }
             
            }
            %>
            </div>
		<div>
		    <div style="float:left;margin-left:6px;margin-top:5px;">
                        <input class="textareas" style="height:8%;" type=text name=txtmsg size=42px;></div>
			<div>
           
                          <input style="float:left;margin-top:8px;margin-left:3px;" type="submit" name="btn" value="Send">
                            </div>  
                            
                        </div>
           </div>
      </form>
            <% Jdbcpro.closeConnection(con);%>
  </body>