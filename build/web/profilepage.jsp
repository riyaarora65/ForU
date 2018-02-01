<%-- 
    Document   : profilepage
    Created on : 23 Jan, 2017, 11:43:19 AM
    Author     : Riya Arora
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="pr1.Jdbcpro"%>
<%@page import="java.sql.*;"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SignUp Page</title>
        <link rel="stylesheet" href="profilepagecss.css">
    </head>
    <body>
         <%
            String city="";
             Connection con=Jdbcpro.getConnection();
            String sql="Select * from city";
            ResultSet rs=Jdbcpro.get(con,sql);
            while(rs.next())
            {
                city=city+"<option value="+rs.getInt(1)+">"+rs.getString(2)+"</option>";
            }
            
        
        %>
        <form action="registeruser.jsp" method="post">
            <center><h1 class=c4>SignUp Page</h1></center>
         <fieldset style="width:40%;border:5px solid #660000;">
             <legend style="text-align:center;color:darkred;font-size:40px;">Profile Information</legend>
    <table  cellpadding="3" >
	  
	  <tr>
              <td class=c1> Name:</td>
          </tr>
          <tr>
		<td> <input  class=c2 type=text name=txtname size=70> </td>
	  </tr>
	  <tr>
		  <td class=c1> City:</td>
          </tr>
          <tr>       
                  <td> <select  class=c2 name="cityname">
                          <%=city%>
                      </select>
	  </tr>
          <tr>
			<td class=c1> Education: </td>
          </tr>
          <tr>                 
			<td > <input class=c2 type=text name=txtedu size=70>
			</td>
          </tr>
          <tr>
			 <td class=c1>Email:</td>
          </tr>
          <tr>                 
			 <td> <input  class=c2 type=text name=mail size=70> </td>
          </tr>
          <tr>
			 <td class=c1>Password:</td>
          </tr>
          <tr>                
			 <td><input  class=c2 type=password name=pass size=70></td>
          </tr>
          <tr>
              <td align="right">
              <input class=c3 type=submit name=Button value="Register Me"></td>
          </tr>
    </table>
             </fieldset>
        </form>
                      <%Jdbcpro.closeConnection(con);%>
    </body>
</html>
