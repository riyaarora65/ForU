<%-- 
    Document   : displaydraft
    Created on : 10 Mar, 2017, 4:39:52 PM
    Author     : Riya Arora
--%>

<%@page import="java.sql.Connection"%>
<%@page import="pr1.Jdbcpro"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="forucss.css">
    </head>
    <body>
       
        <jsp:include page="header.jsp" />
        <%
             int uid=(Integer)session.getAttribute("uid");
            int did=Integer.parseInt(request.getParameter("did"));
            int qid=Integer.parseInt(request.getParameter("qid"));
            String ques="",ans="",dname="";
             Connection con=Jdbcpro.getConnection();
            String sql="Select dname from domain where did="+did;
            ResultSet rs=Jdbcpro.get(con,sql);
            while(rs.next())
            {
                dname=rs.getString(1);
            }
            %>
            <form action="submitans.jsp">
            <div>
            <h1  class="headings"><%=dname%></h1>
            <%
            String sql1="select d.ans,q.ques from querry q,draft d where  q.qid=d.qid and d.qid="+qid+" and d.uid="+uid;
            ResultSet rs1=Jdbcpro.get(con,sql1);
            while(rs1.next())
            {
                ques=rs1.getString(2);
                ans=rs1.getString(1);
            }  
        %>
      
        <div class="ques_ans"><b>Ques</b><%=ques%></div>
       <div style="margin-left:13px;"> <textarea  class="textareas" name="txtcontent" rows="10" cols="35">
                  <%=ans%>
           </textarea></div>
           <div style="width:26%;text-align: right;"  class="buttons">  <input class="buttons" type="submit" name="btn" value="Submit"></div>
        </div>
        
           <input type="hidden" name="qid" value="<%=qid%>"> 
                          <input type="hidden" name="did" value="<%=did%>">
                          </form>
    </body>
    <% Jdbcpro.closeConnection(con);%>
</html>
