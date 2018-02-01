<%-- 
    Document   : Polling
    Created on : 26 Jan, 2017, 12:45:35 PM
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
        <style type="text/css">
            body{
                background: url(resource/M.jpg) repeat;
            }
            .m1
            {
                color:bisque;
                background-color:darkred;
                text-align:center;
            }
            .c2{
                color:burlywood;
                background-color:darkred;
                padding:.3%;
                
            }
            
    </style>
    </head>
    <body>
           <fieldset style="width:25%">
        <legend>Poll Questions</legend>
        <%
            Connection con=Jdbcpro.getConnection();
            String sql="select *from pollquestion";
            ResultSet rs=Jdbcpro.get(con,sql);
            while(rs.next())
            {%>
            
                
            <%out.print(rs.getString(2));%>
            <%out.print("<br>");%>
                <form action="registerpoll.jsp">
                <input class=c1 type="radio" name="Answer" value="Y">Yes
                <input class=c1 type="radio" name="Answer" value="N">No<br/>
                <input  class=c2 type="submit" value="Submit" name="btn">
                <input type="hidden" name="qid" value="<%=rs.getInt(1)%>">
                
                </form>
                </fieldset>
          <%  }
            %>
              
    </body>
</html>
