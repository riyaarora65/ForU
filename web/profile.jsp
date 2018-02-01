<%-- 
    Document   : followerspofile
    Created on : 3 Feb, 2017, 12:19:29 PM
    Author     : Riya Arora
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="pr1.Jdbcpro,pr1.NAction"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="forucss.css">
        <link rel="stylesheet" href="youpagecss.css">
    </head>
    <body>
               <jsp:include page="header.jsp"/>  
        <%
            String name="",edu="",city="",ans="",ques="";
            String image="";
            int ansid,qid,did;
            String src1=request.getParameter("src");
            int personid=Integer.parseInt(request.getParameter("uid"));
            Connection con=Jdbcpro.getConnection();
            int uid=(Integer)session.getAttribute("uid");
           String sql="Select p.name,p.education,c.cname,p.status,p.img from city c, profile p where p.pid="+personid+" and c.cid=p.city";
            ResultSet rs=Jdbcpro.get(con,sql);
            while(rs.next())
            {
                name=rs.getString(1);
                edu=rs.getString(2);
                city=rs.getString(3);
                String status=rs.getString(4);
                image="resource/"+rs.getString(5);
            %>
            <div class="c1">
                <div class="c2">
                    <div class="c3">
                        <img  style="height:300px;width:300px;" src="<%=image%>">
                    </div>
                    <div>
                        <div class="profileinfo" style="font-size:23px;font-style:italic; "><b><%=status%></b></div>
                        <div class="profileinfo"><%=name%></div>
                        <div class="profileinfo"><%=edu%></div>
                        <div class="profileinfo">Lives in <%=city%></div>
                    </div>
                        <%
            }
                        String sql15="select count(*) from following where userid="+uid + " and followid="+personid;
                               ResultSet rs14=Jdbcpro.get(con,sql15);
                               if(rs14.next())
                                {
                                    if(rs14.getInt(1)==0)
                                    {%>
            <div><a class="hyperlinks" STYLE="margin-left: 15px;" href="follow.jsp?userid=<%=personid%>&status=A&src=profile.jsp">Follow</a></div>
             <% }else{ %> 
            <div><a class="hyperlinks" STYLE="margin-left: 15px;" href="follow.jsp?userid=<%=personid%>&src=profile.jsp">UnFollow</a></div>
            <%}
         }%>      
          <div style="float:left;width:20%;text-align:center;margin-left:13px;"  class="Options1">...
                                    <div class="t1"></div>
                                    <div class="Inner1">
                                        <div style="width:100%;float:right;text-align:right;padding:3px;"><a href="Home.jsp">X</a> </div>
                                        <div> <a href=""> Share<br/></a></div>
                                        <div><a class="hyperlinks" STYLE="margin-left: 15px;" href="list.jsp?action=followerslist">Followers</a></div>
                                        <div><a class="hyperlinks" STYLE="margin-left: 15px;" href="Blockuser.jsp?fid=<%=personid%>&status=B&src=Home.jsp">BLOCK</a></div>
                                   </div>   
          </div>
        </div>                    
            <h1 class="headings" style="margin-left:579px;">Recently Answered Questions</h1>
            
            
            <%
            String sql1="select a.ans,a.aid, q.ques,q.qid,a.domainid  from answers a, querry q where a.uid="+personid+" and a.quesid=q.qid order by date";
            ResultSet rs1=Jdbcpro.get(con,sql1);%>
            
           <%     
             while(rs1.next())
            {
                ans=rs1.getString(1);
                ansid=rs1.getInt(2);
                qid=rs1.getInt(4);
                did=rs1.getInt(5);
                ques=rs1.getString(3);%>
                <div class="ques_ans" style="margin-left:350px;margin-top:5px;">
                   <div class="ques_ans" style="width:80%;"><b>  <%=ques%></b> </div>
                  <%
                if(ans.length() >300)
                {
           %>
                 <div class="ques_ans" style="width:80%;">   <%=(ans.substring(0,300)+ "..........")%>
                     <a style="text-decoration:none" href="particularans.jsp?aid=<%=ansid%>&src=profile.jsp">read more</a>
                 </div>
                       <%
                }
                else
                {%>
                <div class="ques_ans" style="width:80%;"> <%=ans%> </div>
                <%}%>
                <div class="voting" style="margin-left:10px;color:bisque;margin-top:7px;float:left;">
                    <%
                 String sql3="Select count(upvote)from vote where ansid="+ansid+" and userid="+uid+" and upvote=1";
                         
                         ResultSet rs8=Jdbcpro.get(con,sql3);
                         if(rs8.next())
                         {
                             if(rs8.getInt(1)== 1)
                             {
                %>        
                       
                           <a class="voting" href="vote.jsp?src=profile.jsp&aid=<%=ansid%>&vote=<%=NAction.DLTUPVOTE%>&qid=<%=qid%>&did=<%=did%>&personid=<%=personid%>">Upvoted </a>
                         <% }
                             
                             else
                             {
                            %>
                            <a class="voting" href="vote.jsp?src=profile.jsp&aid=<%=ansid%>&vote=<%=NAction.UPVOTE%>&qid=<%=qid%>&did=<%=did%>&personid=<%=personid%>">Upvote </a>
                  <%   }
                         }
                         String sql4= "select sum(upvote) from vote where ansid="+ansid;
                    
                         ResultSet rs4=Jdbcpro.get(con,sql4);
                         if(rs4.next())
                         {
                           %> 
                            <%=rs4.getInt(1)%> 
                                  <%
                         }
                          String sql8="Select count(downvote) from vote where userid="+uid+" and ansid="+ansid+" and downvote=1";
                         ResultSet rs6=Jdbcpro.get(con,sql8);
                             if(rs6.next())
                             {
                                  if(rs6.getInt(1) == 1)
                                  {%>
                                   <a class="voting" href="vote.jsp?src=profile.jsp&aid=<%=ansid%>&vote=<%=NAction.DLTDOWNVOTE%>&qid=<%=qid%>&did=<%=did%>&personid=<%=personid%>">Downvoted</a>
                <%
                             }
                             else
                             {%>
                               <a class="voting" href="vote.jsp?src=profile.jsp&aid=<%=ansid%>&vote=<%=NAction.DOWNVOTE%>&qid=<%=qid%>&did=<%=did%>&personid=<%=personid%>">Downvote</a>
                  <%
                             }
                             }
                                  String sql5= "select sum(downvote) from vote where ansid="+ansid;
                    
                              ResultSet rs3=Jdbcpro.get(con,sql5);
                         if(rs3.next())
                         {
                           %>
                           <%=rs3.getInt(1)%>
                                    <%}%>
                </div>
                <form action="postcomment.jsp">
                    <div style="float:left;margin-top:7px;width:15%;"  class="Comment"> Comment
                                <div style="border:2px solid black;" class="CommentInner">
                                     <%
                         
                            String sql7="Select c.comment,p.name,p.education  from comments c,profile p where c.ansid="+ansid+" and p.pid=c.userid";
                            ResultSet rs7=Jdbcpro.get(con,sql7);
                            while(rs7.next())
                            {
                          String     comment=rs7.getString(1); 
                            String    cname=rs7.getString(2);
                                String cedu=rs7.getString(3);
                                    %>
                                     <div style="font-weight:bold;font-size:18px;margin-left:20px;color:#660000;margin-top:5px;"><%=cname%>,completed<%=cedu%></div>
                                    
                                    <div style="font-size:15px;margin-left:25px;text-align:left;margin-top:15px;"><%=comment%></div>
                                    <%}%>
                                    <div style="text-align:left;margin-left:5px;font-size:15px;margin-top:5px;font-style: italic;">Write your comment here....</div>        
                            <div><input type="text" name="comment" size="52" ></div>
                            <div><input type="submit" value="Post" name="postbtn"></div>
                            
                                <input type="hidden" name="personid" value="<%=uid%>"> 
                                <input type="hidden" name="ansid" value="<%=ansid%>">
                                <input type="hidden" name="src" value="profile.jsp" >
                                </div>
                            </div>
                </form>
                </div>
                                
            </div> 
          
            <%
             if(ans == "")
             {
                 out.print(name+" has not written any answers yet");
             }
            }
            if(src1.equals("noti.jsp"))
            {
                 int nid=Integer.parseInt(request.getParameter("nid"));
              String sql8="Update notifications set status='R' where nid="+nid;
              PreparedStatement p5=con.prepareStatement(sql8);
                 p5.executeUpdate();   
            }
             Jdbcpro.closeConnection(con);
             %>
             
    </body>
</html>
