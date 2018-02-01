<%-- 
    Document   : domains
    Created on : 24 Jan, 2017, 11:33:56 AM
    Author     : Riya Arora
--%>

<%@page import="pr1.Jdbcpro"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*;"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="domainscss.css">
            <link rel="stylesheet" href="forucss.css">
        <style type="text/css">
         .k1
            {
                padding:10px;
                background-color:brown;
                color:bisque;
                float:left;
                width:23.5%;
                font-size:20px;
                font-weight:bold;
            }
            .k2
            {
                text-decoration:none;
                color:bisque;
            }
            </style>
    </head>
    <body>
               <jsp:include page="header.jsp"/>  
        <%
            int userid=(Integer)(session.getAttribute("uid"));
            String ques="";
            String domainname="";
            Connection con=Jdbcpro.getConnection();
            out.println("<h1 class=c3><Center>QUESTIONS FEED</center></h1>");
            String sql="Select d.dname,ud.domainid from domain d, userdomain ud where d.did=ud.domainid and ud.userid="+ userid;
            ResultSet rs1=Jdbcpro.get(con,sql);
            while(rs1.next())
            {  
                String sql1="Select * from querry q where q.did="+rs1.getInt(2);
                ResultSet rs2=Jdbcpro.get(con,sql1);
                  domainname=rs1.getString(1);
                  out.println("<br>");%>
                  <a class="hyperlinks" href="dinfo.jsp?did=<%=rs1.getInt(2)%>">"<fieldset class=c1><%=domainname%></fieldset></a>
                    <br>
                    
                    <fieldset class=c2>
                        <%
                   while(rs2.next())
                {
                    
                       ques=rs2.getString(2);
                     %>
                      
                     <ul><li><a class="c4" href="answers.jsp?qid=<%=rs2.getInt(1)%>&did=<%=rs2.getInt(3)%>">
                             <% out.print(ques);%> </li></ul>
             
                     </a>  
                     <%   
                }  
                   %>
                   </fieldset>
                   <%
          }
             Jdbcpro.closeConnection(con);
        %>
        <br/>
            
          <div style="width:100%;height:42px;border:5px solid #996633;">
              <div class="k1"><a class="k2" href="domains.jsp">Recommended</a> </div>
            <div class="k1"><a class="k2" href="ansreq.jsp">Answer Request</a></div>
            <div class="k1"><a class="k2" href="anslater.jsp">Saved Question</a></div>
           <div class="k1"><a class="k2" href="showdraft.jsp">Saved Drafts</a></div>
            </div>
                 
      
          
    </body>
</html>
