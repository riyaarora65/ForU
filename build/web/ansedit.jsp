<%-- 
    Document   : ansedit
    Created on : 11 Feb, 2017, 11:25:55 AM
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
            int aid=Integer.parseInt(request.getParameter("aid"));
            String src=request.getParameter("src");
            String ques="",ans="";
            Connection con=Jdbcpro.getConnection();
            String sql="Select q.ques,a.ans from querry q, answers a where q.qid=a.quesid and aid="+aid;
            ResultSet rs=Jdbcpro.get(con,sql);
            while(rs.next())
            {
                ques=rs.getString(1);
                ans=rs.getString(2);
            }
            %>
        <form action="saveans.jsp">
            <div>
                <h1 style="margin-top:8px;"class="ques_ans"><%=ques%></h1>
                <div><textarea  style="margin-top:8px;"class="textareas" rows="13" cols="67" name="txtarea"><%=ans%></textarea></div>
                <div align="right" style="width:46.5%;margin-top:5px; "><input class="buttons" type="submit" name="btn" value="Save"></div>
            </div>
                <input type="hidden" name="aid" value="<%=aid%>">
                <input type="hidden" name="src" value="<%=src%>">
        </form>
    </body>
</html>
