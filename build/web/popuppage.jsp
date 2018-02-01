<%-- 
    Document   : popuppage
    Created on : 26 Apr, 2017, 6:02:38 PM
    Author     : Riya Arora
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script>
            var ansid=0;
        </script>
    </head>
    <body>
        <%
            int ansid=Integer.parseInt("<script>document.writeln(ansid)</script>");
            out.print("Are you sure you want to delete this answer");
            out.print(ansid);
            %>
            <form action="dltans.jsp" method="post">
            <br/><br/>
            <input type="submit" name="btn" value="Yes">
            <input type="submit" name="btn" value="No">
            </form>
            
    </body>
</html>
