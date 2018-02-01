<%-- 
    Document   : answers
    Created on : 25 Jan, 2017, 11:30:03 AM
    Author     : Riya Arora
--%>

<%@page import="java.sql.Connection"%>
<%@page import="pr1.Action"%>
<%@page import="pr1.NAction"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="pr1.Jdbcpro"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="answerscss.css">
        <link rel="stylesheet" href="forucss.css">
    </head>
    <body>
               <jsp:include page="header.jsp"/>  
        <form action="submitans.jsp">
        <%
            
            int questionid=(Integer.parseInt(request.getParameter("qid")));
            int domainid=(Integer.parseInt(request.getParameter("did")));
              int userid=(Integer)(session.getAttribute("uid"));
            String ans="",name="",edu="",cname="",cedu="",qname="";
            String domain="",comment="",date="";
            String image="resource/r7.jpg";
            int uid,personid=0,written;
            int aid=0;
           Connection con=Jdbcpro.getConnection();
           
            String sql1="Select q.ques, d.dname,p.name,q.userid from querry q, domain d,profile p where q.qid = "+ questionid + "  and q.did=d.did and p.pid=q.userid";
            ResultSet rs=Jdbcpro.get(con,sql1);
            out.print("<h1 class=c5><center>ANSWERS FEED</center></h1>");
                while(rs.next())
                {
                    domain=rs.getString(2);
                    qname=rs.getString(3);
                    int quid=rs.getInt(4);
        %>
                <a class="hyperlinks" href="dinfo.jsp?did=<%=domainid%>"><fieldset class=c1><%=domain%></fieldset></a>
                    <h2 class=ques_ans><u> Question</u></h2>
                    <div style="margin-left:16px;"> <%=qname%> asked this Question</div>
                    <div class="ques_ans" style="margin-left:8px;"><b><%=rs.getString(1)%></b></div>
                    
                    <div style="margin-left:17px;float:left;width:10%;">
                        <a class="hyperlinks" href="followques.jsp?qid=<%=questionid%>"> Follow Question </a> </div>
                        
                    
                   <%String sql="Select ans from draft where uid="+userid+" and qid="+questionid;
                    ResultSet rs4=Jdbcpro.get(con,sql);
                   if(rs4.next())
                   {%>   
                   <div style="float:left;text-align:center;width:12%;" > <a class="hyperlinks" href="displaydraft.jsp?qid=<%=questionid%>&did=<%=domainid%>">Open Draft</a></div>
                   
                   <%}%>
                   <div style="float:left;width:2%;text-align: center;float:left;"  class="Options1">...
                                    <div class="t1"></div>
                                    <div class="Inner1">
                                        <div style="width:100%;float:right;text-align:right;padding:3px;"><a href="answers.jsp?qid=<%=questionid%>&did=<%=domainid%>">X</a> </div>
                                        <a href="actions.jsp?qid=<%=questionid%>&action=<%=Action.ANSLATER%>&src=answers.jsp&did=<%=domainid%>">Answer later<br/></a>
                                        <a href="actions.jsp?action=<%=Action.ANONY%>&qid=<%=questionid%>">Go Anonymous<br/></a>
                                        <a href="suggestedits.jsp?qid=<%=questionid%>&uid=<%=quid%>&src=answers.jsp&did=<%=domainid%>"> Suggest Edits<br/></a>
                                        Merge Questions<br/>
                                        Report<br/>
                                         <a href="reqans.jsp?qid=<%=questionid%>&did=<%=domainid%>"> Request Answer<br/></a>
                                    </div>
                                    
                                </div>
                                    <br/>
                                    
                   <%
                   out.print("<div style=\"margin-left:15px;margin-top:5px;font-size:18px;\">Can you answer this question?</div>");  
                   out.print("<br/><textarea class=c3 rows=8 cols=30 name=\"txtcontent\"></textarea>");    
                   out.print("<div style=\"width:21%;\" align=\"right\"><input class=c4 type=submit value=\"Submit\" name=\"btn\"></div>");
                    out.print("<div style=\"width:15%;\" align=\"right\"><input class=c4 type=submit value=\"Save as draft\" name=\"btn\"></div>");
                }
                %>
                 <input type="hidden" name="qid" value="<%=questionid%>"> 
                          <input type="hidden" name="did" value="<%=domainid%>">
                           </form>
                <%
                String sql2="select ans,aid,uid,date,written from answers where quesid="+questionid+" and domainid="+domainid+" and uid <>"+userid; 
                ResultSet rs1=Jdbcpro.get(con,sql2);
                out.print("<h2 class=ques_ans><u> Previously written Answers...</u></h2>");
                while(rs1.next())
                {
                    ans=rs1.getString(1);
                    aid=rs1.getInt(2);
                    uid=rs1.getInt(3);
                    date=rs1.getString(4);
                    written=rs1.getInt(5);
                        
                     String sql4="Select pid,name,education,img from profile where pid="+uid;
                 ResultSet rs3=Jdbcpro.get(con,sql4);
                 while(rs3.next())
                 {
                     name=rs3.getString(2);
                     edu=rs3.getString(3);
                     personid=rs3.getInt(1);
                     image="resource/"+rs3.getString(4);
        %>
                    <div style="width:100%;height:400px;">
                       <div style="width:20%;float:left;margin-top: 5px;">
                           <div>      <img style="width:70px;height:70px;margin-left:25px;margin-top:5px;" src="<%=image%>"></div>
                         <div style="font-weight:bold;font-size:18px;margin-left:30px;margin-top:5px;">
                         <a style="font-weight:bold;font-size:20px;color:#333333;text-decoration:none;"  href="checkuser.jsp?uid=<%=personid%>&src=answers.jsp">
                             <%
                             if(written == NAction.WRITTEN)
                             {%>
                             <%=name%>,completed <%=edu%> written on <%=date%>
                             <%
                             }
                             else if(written == NAction.UPDATED)
                             {%>
                             <%=name%>,completed <%=edu%> Last Updated  on <%=date%>
                             <%}%>
                         </a>
                         </div>
                        </div>
                     <div  style="width:80%;float:left;margin-left:10px;">
                           <%
                       }
                  if(ans.length()>300)
                         { 
                     %>  
                         <div style="width:60%;margin-left:10px;margin-top:5px;" class="ques_ans">
                              <%=ans.substring(0,300)%>.....
                             <a style="text-decoration:none" href="particularans.jsp?aid=<%=aid%>&src=answers.jsp">read more</a>
                         </div><br/>
                          <%
                         }
                         else
                         { %>
                         <div style="width:60%;margin-left:10px;margin-top:5px;" class="ques_ans">
                             <%=ans%></div>
                             <%
                         }
                     String sql10="Select count(*) from blocklist where blockid="+userid+" and userid="+uid;
                     ResultSet rs10=Jdbcpro.get(con,sql10);
               
                         
                     if(rs10.next())
                     {
                         if(rs10.getInt(1) == 0)
                         {%>
                              <div class="voting"  style="width:20%;float:left;margin-left:20px;">
                        
                        <%
                         String sql="Select count(upvote)from vote where ansid="+aid+" and userid="+userid+" and upvote=1";
                         
                         ResultSet rs8=Jdbcpro.get(con,sql);
                         if(rs8.next())
                         {
                             if(rs8.getInt(1)== 1)
                             {
                         %>
                                  <a class="voting" href="vote.jsp?src=answers.jsp&aid=<%=aid%>&vote=<%=NAction.DLTUPVOTE%>&qid=<%=questionid%>&did=<%=domainid%>&personid=<%=personid%>">Upvoted </a>
                            <% }
                             
                             else
                             {
                            %>
                              <a class="voting" href="vote.jsp?src=answers.jsp&aid=<%=aid%>&vote=<%=NAction.UPVOTE%>&qid=<%=questionid%>&did=<%=domainid%>&personid=<%=personid%>">Upvote </a>
                      <%   }
                         }
                         String sql5= "select sum(upvote) from vote where ansid="+aid;
                    
                         ResultSet rs2=Jdbcpro.get(con,sql5);
                         if(rs2.next())
                         {
                           %>
                                  <%=rs2.getInt(1)%> 
                                  <%
                         }
                          String sql8="Select count(downvote) from vote where userid="+userid+" and ansid="+aid+" and downvote=1";
                         ResultSet rs6=Jdbcpro.get(con,sql8);
                             if(rs6.next())
                             {
                                  if(rs6.getInt(1) == 1)
                                  {%>
                                    <a class="voting" href="vote.jsp?src=answers.jsp&aid=<%=aid%>&vote=<%=NAction.DLTDOWNVOTE%>&qid=<%=questionid%>&did=<%=domainid%>&personid=<%=personid%>">Downvoted</a>
                                    <%
                             }
                             else
                             {%>
                                            <a class="voting" href="vote.jsp?src=answers.jsp&aid=<%=aid%>&vote=<%=NAction.DOWNVOTE%>&qid=<%=questionid%>&did=<%=domainid%>&personid=<%=personid%>">Downvote</a>
                                    <%
                             }
                             }
                                  String sql3= "select sum(downvote) from vote where ansid="+aid;
                    
                              ResultSet rs5=Jdbcpro.get(con,sql3);
                         if(rs5.next())
                         {
                            
                           %>
                           
                                    <%= rs5.getInt(1)%>
                                    <%}%>
                             
                            
                           </div>
                           <form action="postcomment.jsp">
                               <div style="float:left;width:20%;text-align: center;"  class="Comment"> Comment
                                <div class="CommentInner">
                            <%
                            String sql9="Select c.comment,p.name,p.education  from comments c,profile p where c.ansid="+aid+" and p.pid=c.userid";
                            ResultSet rs4=Jdbcpro.get(con,sql9);
                            while(rs4.next())
                            {
                               comment=rs4.getString(1); 
                                cname=rs4.getString(2);
                                cedu=rs4.getString(3);
                                    %>
                                   
                                    <div style="font-weight:bold;font-size:15px;margin-left:20px;"><%=cname%>,completed<%=cedu%></div>
                                    
                                    <div style="font-size:15px;margin-left:25px;"><%=comment%></div>
                                    <%}%>
                                    <div>Write your comment here...</div>        
                            <div><input type="text" name="comment" size="50" ></div>
                            <div><input type="submit" value="Post" name="postbtn"></div>
                            
                                <input type="hidden" name="personid" value="<%=personid%>"> 
                                <input type="hidden" name="ansid" value="<%=aid%>">
                                </div>
                            </div>
                           </form>
                               
                        </div>
                           
                               
                           
                                 
                  <% 
                }
                     }
                }
                Jdbcpro.closeConnection(con);
            %>
            
            
    </body>
</html>
