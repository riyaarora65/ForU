<%-- 
    Document   : particularques
    Created on : 13 Apr, 2017, 5:40:11 PM
    Author     : Riya Arora
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="pr1.Jdbcpro"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="forucss.css">
          <link rel="stylesheet" href="domainscss.css">
    </head>
    <body>
        <%
            String src=request.getParameter("src");
            int nid=Integer.parseInt(request.getParameter("nid"));
            int qid=Integer.parseInt(request.getParameter("qid"));
            Connection con=Jdbcpro.getConnection();
            String ques="",dname="",name=""; 
            String sql="Select q.*,p.name,d.dname from querry q,profile p,domain d where q.qid="+qid+" and p.pid=q.userid and d.did=q.did";
            ResultSet rs=Jdbcpro.get(con, sql);
            while(rs.next())
            {
                ques=rs.getString(2);
                dname=rs.getString(7);
               
        %>
                <div>
                    <form action="savequesans.jsp" method="post">
                   <div><fieldset style="margin-top: 5px;margin-top: 20px;" class="c1"><%=dname%></fieldset></div>
                   
                   <div><input style="margin-top:15px;margin-left:17px;background-color:bisque;" class="ques_ans" type="text" name="txtques" value="<%=ques%>"></div>
                   <div style="width:53%;margin-top: 7px;" align="right"><input class="buttons" type="submit" name="btn" value="Save"></div>
                     <div style="margin-left:17px;">Can you answer this Question?</div>
                   <div><textarea style="margin-top: 15px;margin-left:13px;" class="textareas" rows="10" cols="50" name="txtcontent"></textarea></div>
              
               <div style="width:36%;margin-top: 5px;" align="right"><input class="buttons" type="submit" name="btn" value="Submit"></div>
               <input type="hidden" name="qid" value="<%=qid%>">
                    </form>
           <% }
            if(src.equals("noti.jsp"))
            {
                String sql1="Update notifications set status='R' where nid="+nid;
                 PreparedStatement p1=con.prepareStatement(sql1);
                 p1.executeUpdate();
            }
            con.close();
            %>
                </div>
    </body>
</html>
