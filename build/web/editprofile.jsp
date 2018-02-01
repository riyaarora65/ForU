<%-- 
    Document   : editprofile
    Created on : 28 Feb, 2017, 8:22:48 PM
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
    </head>
    <body>
        <%
            int cityid=6;
            int rcityid;
                 int uid=(Integer)session.getAttribute("uid");
                  String image="resource/r7.jpg";
                  String name="",edu="",city="",status="";
                  String email="",pass="";
                  Connection con=Jdbcpro.getConnection();
            ResultSet rs1=Jdbcpro.get(con,"Select * from city");
            while(rs1.next())
            {
                rcityid=rs1.getInt(1);
                if(cityid==rcityid)
                    city=city+"<option selected value="+rcityid+">"+rs1.getString(2)+"</option>";
                else
                    city=city+"<option value="+rcityid+">"+rs1.getString(2)+"</option>";
            }
            
             String sql="Select p.name,p.education,p.status,p.email,p.password from profile p where p.pid="+uid;
              ResultSet rs=Jdbcpro.get(con,sql);
            while(rs.next())
            {
                name=rs.getString(1);
                edu=rs.getString(2);
                status=rs.getString(3);
                email=rs.getString(4);
                pass=rs.getString(5);
            %>
            <form action="saveprofile.jsp">
            <div>Name:</div>
            <div><input type="text" name="t1" value="<%=name%>"></div>
            <div>Education:</div>
            <div><input type="text" name="t2" value="<%=edu%>"></div>
            <div>City:</div>
            <div><select name="cityname">
                          <%=city%>
                      </select></div>
            <div>Status:</div>
            <div><input type="text" name="t4" value="<%=status%>"></div>
            <div>Email</div>
            <div><input type="text" name="t5" value="<%=email%>"></div>
            <div>Password:</div>
            <div><input type="text" name="t6" value="<%=pass%>"></div>
            <div>Change profile picture:</div>
            <div> <img  style="height:150px;width:150px;" src="resource/r7.jpg"></div>
            <div><input type="submit" name="btn" value="Save Changes"></div>
            </form>
            <%}
             Jdbcpro.closeConnection(con);
            %>
    </body>
</html>
