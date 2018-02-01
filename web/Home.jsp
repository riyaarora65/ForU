<%-- 
    Document   : Home
    Created on : 28 Jan, 2017, 11:28:10 AM
    Author     : Riya Arora
--%>

<%@page import="java.sql.Connection"%>
<%@page import="javax.script.ScriptEngineManager,javax.script.ScriptEngine" %>
<%@page import="pr1.Action"%>
<%@page import="pr1.Jdbcpro,pr1.NAction"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
      
       
            <link rel="stylesheet" href="forucss.css">
    </head>
    <body>
                <%
            int userid=(Integer)(session.getAttribute("uid"));
            String ques="",qname="";
            String ans="",date="";
            int uid,ansid,did,written;
            String name="",edu="",comment="",cname="",cedu="";
            String image="";
            int personid=0,view=0;
            String anony="";
            Connection con=Jdbcpro.getConnection();
%>
           
            <jsp:include page="header.jsp"/>    
          

            <%
            String sql1="Select ud.domainid,q.qid,q.ques,p.name,q.anony,a.ans from userdomain ud,querry q,profile p,answers a";
              sql1+=" where ud.userid="+userid+" and q.did=ud.domainid and p.pid=q.userid and a.quesid=q.qid and a.uid<>"+userid;    
            ResultSet rs= Jdbcpro.get(con,sql1);
            while(rs.next())
            {
                did=rs.getInt(1);
                ques=rs.getString(3);
                int qid = rs.getInt(2);
                 anony=rs.getString(5);%>
                 <br/><div style="width:60%;overflow:auto;margin-left:50px;border:2px solid #663333;">
                     <%
                 if(anony.equals("NO"))
                 {
            
                     qname=rs.getString(4);
                     
                   
            %>
                      
                      
                          <div style="margin-left:120px;font-weight:bold;font-size:15px;color:#333333;width:80%;margin-top:2px;">
                                <%=qname%> asked this Question.
                                
                           </div>
                                <%}%>
                          <div class="ques_ans" style=";font-weight:bold;width:80%;margin-left:110px;margin-top:.02px;">
                              <a style="text-decoration:none;color:black;" href="answers.jsp?qid=<%=qid%>&did=<%=did%>"><%=ques%></a>
                           </div>
                           
                                <%
                 
                 String sql4="Select a.*,p.pid,p.name,p.education,p.img from answers a,profile p where a.quesid="+qid+" and a.uid<>"+userid+" and p.pid=a.uid";
                 ResultSet rs1=Jdbcpro.get(con,sql4);
                 if(rs1.next())
                 {
                 ansid=rs1.getInt(1);
                 ans=rs1.getString(2);
                 uid=rs1.getInt(5);
                 date=rs1.getString(6);
                 written=rs1.getInt(7);
                 view=rs1.getInt(8);
                 if(ans != null)
                {
                      personid=rs1.getInt(10);
                     name=rs1.getString(11);
                     edu=rs1.getString(12);
                     image= "resource/" + rs1.getString(13);           %>
                     
                          
               <div style="width:10%;float:left;">
                   <a href="checkuser.jsp?uid=<%=personid%>&src=Home.jsp"><img style="width:70px;height:70px;border:2px solid #660000;" src="<%=image%>"></a> 
               </div>      
                     
                      <div style="margin-left:120px;font-weight:bold;font-size:20px;color:#333333;width:80%;">
                          <a style="font-weight:bold;font-size:20px;color:#333333;text-decoration:none;"  href="checkuser.jsp?uid=<%=personid%>&src=Home.jsp">
                   
                        <%   if(written == NAction.WRITTEN)
                             {
                          %>
                              <%=name%>
                          </a>, completed <%=edu%><br/>
                          Written on <%=date%>
                           <%
                             }
                             else if(written == NAction.UPDATED)
                             {%>
                              <%=name%>,completed <%=edu%><br/>
                             Last Updated  on <%=date%>
                             <%}%>
                      </div>
                     <div>
        
                         <%
                         if(ans.length()>300)
                         { %>
                         <div class="ques_ans" style="width:80%;margin-left:110px;"><%=ans.substring(0,300)%>....<a style="text-decoration:none" href="particularans.jsp?aid=<%=ansid%>&src=Home.jsp">read more</a></div>
                        <%
                         }
                         else
                         { %>
                         <div class="ques_ans" style="width:80%;margin-left:110px;"> <%=ans%></div>
                         
                         <%
                         }
                           String sql10="Select count(*) from blocklist where blockid="+userid+" and userid="+uid;
                     ResultSet rs10=Jdbcpro.get(con,sql10);
               
                         
                     if(rs10.next())
                     {
                         if(rs10.getInt(1) == 0)
                         {%>
                              <div class="voting" style="margin-left:120px;color:bisque;float:left;">
                        
                        <%
                         String sql="Select count(upvote)from vote where ansid="+ansid+" and userid="+userid+" and upvote=1";
                         
                         ResultSet rs8=Jdbcpro.get(con,sql);
                         if(rs8.next())
                         {
                             if(rs8.getInt(1)== 1)
                             {
                         %>
                                  <a class="voting" href="vote.jsp?src=Home.jsp&aid=<%=ansid%>&vote=<%=NAction.DLTUPVOTE%>&qid=<%=qid%>&did=<%=did%>&personid=<%=personid%>">Upvoted </a>
                            <% }
                             
                             else
                             {
                            %>
                              <a class="voting" href="vote.jsp?src=Home.jsp&aid=<%=ansid%>&vote=<%=NAction.UPVOTE%>&qid=<%=qid%>&did=<%=did%>&personid=<%=personid%>">Upvote </a>
                      <%   }
                         }
                         String sql2= "select sum(upvote) from vote where ansid="+ansid;
                    
                         ResultSet rs2=Jdbcpro.get(con,sql2);
                         if(rs2.next())
                         {
                           %>
                                  <%=rs2.getInt(1)%> 
                                  <%
                         }
                          String sql8="Select count(downvote) from vote where userid="+userid+" and ansid="+ansid+" and downvote=1";
                         ResultSet rs6=Jdbcpro.get(con,sql8);
                             if(rs6.next())
                             {
                                  if(rs6.getInt(1) == 1)
                                  {%>
                                    <a class="voting" href="vote.jsp?src=Home.jsp&aid=<%=ansid%>&vote=<%=NAction.DLTDOWNVOTE%>&qid=<%=qid%>&did=<%=did%>&personid=<%=personid%>">Downvoted</a>
                                    <%
                             }
                             else
                             {%>
                                            <a class="voting" href="vote.jsp?src=Home.jsp&aid=<%=ansid%>&vote=<%=NAction.DOWNVOTE%>&qid=<%=qid%>&did=<%=did%>&personid=<%=personid%>">Downvote</a>
                                    <%
                             }
                             }
                                  String sql3= "select sum(downvote) from vote where ansid="+ansid;
                    
                              ResultSet rs3=Jdbcpro.get(con,sql3);
                         if(rs3.next())
                         {
                           %>
                                    <%=rs3.getInt(1)%>
                                    <%}%>
                          </div>  
                            <form action="postcomment.jsp" method="post">
                            <div style="float:left;width:20%;text-align: center;color:bisque;"  class="Comment"> Comment
                                <div style="border:2px solid black;" class="CommentInner">
                                     <%
                         
                            String sql7="Select c.comment,p.name,p.education,c.userid,c.cid  from comments c,profile p where c.ansid="+ansid+" and p.pid=c.userid";
                            ResultSet rs7=Jdbcpro.get(con,sql7);
                            while(rs7.next())
                            {
                               comment=rs7.getString(1); 
                                cname=rs7.getString(2);
                                cedu=rs7.getString(3);
                                    %>
                                     <div style="font-weight:bold;font-size:18px;margin-left:10px;color:#660000;margin-top:5px;"><%=cname%>,completed  <%=cedu%></div>
                                    
                                    <div style="font-size:15px;text-align:left;margin-left:5px;margin-top:15px;"><%=comment%></div>
                                    
                                    <%
                                    if(userid == rs7.getInt(4))
                                    {%>
                                    <div align="left" style="margin-left:5px;">
                                        <input type="text" name="txt" size="50">
                                        <input type="submit" name="btn" value="Edit"></div>
                                     <div align="left" style="margin-left:5px;">   
                                      <input type="submit" name="btn" value="Delete"></div>
                                        <input type="hidden" name="cid" value="<%=rs7.getInt(5)%>">
                                   <% }
                            }%>
                                
                                    <br/>
                                    <div style="text-align:left;margin-left:5px;font-size:15px;margin-top:5px;font-style: italic;">Write your comment here....</div>        
                            <div><input type="text" name="comment" size="52" ></div>
                            <div><input type="submit" value="Post" name="btn"></div>
                            
                                <input type="hidden" name="personid" value="<%=personid%>"> 
                                <input type="hidden" name="ansid" value="<%=ansid%>">
                                   <input type="hidden" name="src" value="profile.jsp" >
                                </div>
                            </div>
                            </form>
                                <div style="float:left;width:20%;text-align: center;"  class="Options1">...
                                    <div class="t1"></div>
                                    <div class="Inner1">
                                        <div style="width:100%;float:right;text-align:right;padding:3px;"><a href="Home.jsp">X</a> </div>
                                        <a class="hyperlinks" style="font-size: 35px;" href="actions.jsp?qid=<%=qid%>&action=<%=Action.ANSLATER%>&src=Home.jsp&did=<%=did%>">Answer later<br/></a>
                                        <a class="hyperlinks" style="font-size: 35px;" href="" >Go Anonymous<br/></a>
                                        <a class="hyperlinks" style="font-size: 35px;" href="actions.jsp?qid=<%=qid%>&src=Home.jsp&action=<%=Action.BOOKMARK%>">Bookmark<br/></a>
                                        Share<br/>
                                        <a class="hyperlinks" style="font-size: 35px;" href="suggestedits.jsp?qid=<%=qid%>&uid=<%=personid%>&src=Home.jsp"> Suggest Edits<br/></a>
                                        <a class="hyperlinks" style="font-size: 35px;" href="followques.jsp?qid=<%=qid%>"> Follow Question<br/></a>
                                    </div>
                                    
                                </div>
                                </div>
                               
                     <%
                   
                         String sql9="Select count(*) from blocklist where userid="+userid+" and blockid="+uid;
                         ResultSet rs9=Jdbcpro.get(con,sql9);
                         if(rs9.next())
                             if(rs9.getInt(1) == 1)
                         {%>
                                  <div style="width:5%;margin-left:15px;"><a class="c1" href="follow.jsp?userid=<%=personid%>&status=A">UnBlock</a></div>
                               <%
                         }
                         else
                         {
                               String sql5="select count(*) from following where userid="+userid + " and followid="+uid;
                               ResultSet rs4=Jdbcpro.get(con,sql5);
                               if(rs4.next())
                                {
                                    if(rs4.getInt(1)==0)
                                    {
                     %>
                                        <div style="width:5%;margin-left:15px;"><a class="c1" href="follow.jsp?userid=<%=personid%>&status=A">Follow</a></div>
                                    <% }else{ %> 
                                        <div style="width:5%;margin-left:15px;"><a class="c1" href="follow.jsp?userid=<%=personid%>">UnFollow</a></div>
                          
                     <%
                                    }
                                }
                         }
                               %>
                               <div style="width:5%;margin-left:15px;"><a class="c1" href="message.jsp?receiverid=<%=personid%>">Message</a></div>
        
             <br/>
                      
       
               
             
                 <%
                 
                         }
          
            }
                 
                }}%>
                 </div></div>
                      
             <%
            
                 }
            
            Jdbcpro.closeConnection(con);
            
            %>
      
         
                
           
    </body>
</html>
