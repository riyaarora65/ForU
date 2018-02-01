<%-- 
    Document   : searchuser
    Created on : 4 Feb, 2017, 11:53:41 AM
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
    </head>
    <body style="background:url(resource/M.jpg) repeat;">
        
        <jsp:include page="header.jsp" />
        <h1>Search Results</h1>
        <%
            String name=request.getParameter("txtfield");
            String image="resource/blue.jpg";
            
            String sql="Select p.name,p.education,c.cname,p.pid,p.img from profile p,city c where p.name like '%"+name+"%' and c.cid=p.city";
            Connection con=Jdbcpro.getConnection();
            ResultSet rs=Jdbcpro.get(con,sql);
            while(rs.next())
            {
                image="resource/"+rs.getString(5);
                %>
                
                <a href="checkuser.jsp?uid=<%=rs.getInt(4)%>&src=searchuser.jsp">
                    <div style="width:25%;padding:5px;overflow:auto;margin-top:3px;">
                        <div style="width:15%;float:left;padding:5px;">
                            <img style="width:100px;height:100px;" src="<%=image%>">
                        </div>    
                        <div style="float:left;margin-left:50px;padding:5px;">
                              <div style="font-size:15px;margin-left:5px;"> <%=rs.getString(1)%>  </div>
                              <div style="font-size:15px;margin-left:10px;"> <%=rs.getString(2)%>  </div>
                               <div style="font-size:15px;margin-left:10px;"> <%=rs.getString(3)%>  </div>
                        </div>
                        </div></a>
                <%
            }
            String sql1="Select did,dname from domain where dname like '%"+name+"%'";
            ResultSet rs1=Jdbcpro.get(con,sql1);
            while(rs1.next())
            {
            %>
            <a href="dinfo.jsp?did=<%=rs1.getInt(1)%>">
                    <div style="width:25%;padding:5px;overflow:auto;margin-top:3px;">
                        <div style="width:15%;float:left;padding:5px;">
                             <img style="width:100px;height:100px;" src="<%=image%>">
                </div>
                 <div style="float:left;margin-left:50px;padding:5px;">
                      <div style="font-size:20px;margin-left:5px;"> <%=rs1.getString(2)%>  </div>
                 </div>
                    </div>
            </a>
                 <%}
              String[] arr=name.split(" ");
              for(int i=0;i<arr.length;i++)
              {
                  String sql2="Select ques,qid,did from querry where ques like '%"+arr[i]+"%'";
                  ResultSet rs2=Jdbcpro.get(con,sql2);
                  while(rs2.next())
                  {%>
                  <a href="answers.jsp?qid=<%=rs2.getInt(2)%>&did=<%=rs2.getInt(3)%>">
                        <div style="width:25%;padding:5px;overflow:auto;margin-top:3px;">
                                   <div style="font-size:20px;margin-left:5px;"> <%=rs2.getString(1)%>  </div>
                        </div>
                  </a>
                <%  }
              }
              Jdbcpro.closeConnection(con);
                 %>
                        
                   
            
    </body>
</html>
