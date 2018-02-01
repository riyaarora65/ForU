<%-- 
    Document   : dinfo.jsp
    Created on : 22 Feb, 2017, 8:02:13 PM
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
        <jsp:include page="header.jsp" />
        <%
            int did=Integer.parseInt(request.getParameter("did"));
            String dname="",dinfo="",ques="",ans="";
            String image="resource/blue.jpg";
            int qid;
               Connection con=Jdbcpro.getConnection();
            String sql="Select dname,dinfo from domain where did="+did;
            ResultSet rs=Jdbcpro.get(con,sql);
            while(rs.next())
            {
                dname=rs.getString(1);
                dinfo=rs.getString(2);%>
                <div>
                    <img style="height:250px;width:250px;float:left;margin-top:75px;border: solid 2px #663333;" src="<%=image%>">
                  <center>  <h1 style="font-size:50px;color:#660000;font-family:sans-serif; ">  <%=dname%>  </h1> </center>
                    <div style="margin-top:50px;font-size: 30px;text-align:justify;width:77%;margin-left:300px; ">
                        <%=dinfo%>
                    </div>
                  <div style="margin-left:300px;"> <hr> </div>
                      <div style="margin-left:300px;"> <hr></div>  
            <%
            }
            String sql1="Select count(*) from querry where did="+did;
            String sql2="Select count(*) from userdomain where domainid="+did;
            ResultSet rs1=Jdbcpro.get(con,sql1);
            if(rs1.next())
            {
                %>
                <div style="margin-left:100px;font-size:20px;float:left;"> <b> Total Questions:<%=rs1.getInt(1)%> </b> </div>
           <% }
            ResultSet rs2=Jdbcpro.get(con,sql2);
            if(rs2.next())
            {%>
            <div style="margin-left:100px;font-size:20px;float:left;"><b> Total Followers: <%=rs2.getInt(1)%> </b></div>
            <%}
            %>
              <div style="margin-left:300px;margin-top:40px;"> <hr></div>
              <div style="margin-left:300px;"> <hr></div>
              <%
            String sql3="Select q.ques,q.qid,a.ans from querry q,answers a where did="+did+" and a.quesid=q.qid";
            ResultSet rs3=Jdbcpro.get(con,sql3);
            while(rs3.next())
            {
                ques=rs3.getString(1);
                qid=rs3.getInt(2);
                ans=rs3.getString(3);
                if(ans != null)
                {
            %>
              <h1 class="ques_ans" style="margin-left:300px;"><%=ques%></h1>
              <%
                }
                 String sql4="select ans,aid,uid,date,written from answers where quesid="+qid+" and domainid="+did; 
                 ResultSet rs4=Jdbcpro.get(con,sql4);
                 while(rs4.next())
                 {
                     ans=rs4.getString(1);
                    
              %>
                 <div class="ques_ans" style="margin-left:310px;"><%=ans%></div>
              <%
                     
                 }
            }
               Jdbcpro.closeConnection(con);
                 %>
                </div>
    </body>
</html>
