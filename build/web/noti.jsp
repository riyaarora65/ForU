<%-- 
    Document   : noti
    Created on : 7 Feb, 2017, 12:24:03 PM
    Author     : Riya Arora
--%>

<%@page import="pr1.Action"%>
<%@page import="pr1.NAction"%>
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
         <jsp:include page="header.jsp"/>  
        <%
            int userid=(Integer)session.getAttribute("uid");
            String message="";
            String sendername="";
            int type=0,nid=0;
            Connection con=Jdbcpro.getConnection();
            String sql="Select n.type, p.name,n.nid,n.senderid,n.info,n.status from notifications n, profile p where n.receiverid="+userid+" and pid=n.senderid ORDER BY nid desc";
            ResultSet rs=Jdbcpro.get(con,sql);%>
            <div style="width:50%">
            
            <%
            while(rs.next())
            {
                type=rs.getInt(1);
                nid=rs.getInt(3);
                sendername=rs.getString(2);
                   switch(type)
                    {
                        case 1:
                        message=sendername+" has sent a request to unblock.<a href=\"Blockuser.jsp?fid="+rs.getInt(4)+"&status=A&src=noti.jsp&nid="+nid+"\">Unblock</a>";
                            break;
                        case NAction.FOLLOW:
                        message="<a class=\"hyperlinks\" href=\"profile.jsp?uid="+rs.getInt(4)+"&src=noti.jsp&nid="+nid+"\">"+sendername+" has followed you.</a>";
                            break;
                        case 3:
                        message="<a class=\"hyperlinks\" href=\"profile.jsp?uid="+rs.getInt(4)+"&src=noti.jsp&nid="+nid+"\">"+sendername+" has unfollowed you.</a>";
                            break;
                        case 4:
                        message="<a class=\"hyperlinks\" href=\"particularans.jsp?aid="+rs.getInt(5)+"&src=noti.jsp&nid="+nid+"\">"+sendername+" has answered your question.</a>";
                            break;
                        case 5:
                        message="<a class=\"hyperlinks\" href=\"particularans.jsp?aid="+rs.getInt(5)+"&src=noti.jsp&nid="+nid+"\">"+sendername+" has answered a question you followed.</a>"; 
                            break;
                        case 6:
                       message="<a class=\"hyperlinks\" href=\"particularans.jsp?aid="+rs.getInt(5)+"&src=noti.jsp&nid="+nid+"\">"+sendername+" commented on your answer.</a>";    
                            break;
                        case 7:
                            message="<a class=\"hyperlinks\" href=\"particularans.jsp?aid="+rs.getInt(5)+"&src=noti.jsp&nid="+nid+"\">"+sendername+" has upvoted on your answer.</a>";
                            break;
                        case 8:
                            message="<a class=\"hyperlinks\" href=\"particularans.jsp?aid="+rs.getInt(5)+"&src=noti.jsp&nid="+nid+"\">"+sendername+"has downvoted your answer.</a>";
                            break;
                        case 11:
                            message="<a class=\"hyperlinks\" href=\"particularans.jsp?aid="+rs.getInt(5)+"&src=noti.jsp&nid="+nid+"\">"+"You have crossed 100 views on your answer.</a>";
                            break;
                        case 12:
                            message="<a class=\"hyperlinks\" href=\"particularans.jsp?aid="+rs.getInt(5)+"\">"+"You have crossed 500 views on your answer.</a>";
                            break;
                        case 13:
                            message="<a class=\"hyperlinks\" href=\"particularans.jsp?aid="+rs.getInt(5)+"\">"+"You have crossed 1K views on your answer.</a>";
                            break;
                        case 14:
                            message="<a class=\"hyperlinks\" href=\"particularans.jsp?aid="+rs.getInt(5)+"\">"+"You have crossed 10K views on your answer.</a>";
                            break;
                        case 15:
                        message="<a class=\"hyperlinks\" href=\"particularques.jsp?qid="+rs.getInt(5)+"&src=noti.jsp&nid="+nid+"\">"+sendername+" marked your question as a need to add more details";
                        break;
                        case Action.ANSREQ:
                            message="<a class=\"hyperlinks\" href=\"particularques.jsp.jsp?qid="+rs.getInt(5)+"&src=noti.jsp&nid="+nid+"\">"+sendername +" requested you to answer a question.";
                         break;
                        default:
                        message="No new notifications";    
                    }
                   
        %>
        
                    <div style="border:0px solid red;width:100%;margin-top:20px;overflow:auto;">
                        <div style="font-size: 20px;font-family: serif;font-style: italic;font-weight: bold;">
                        <%
                       if(rs.getString(6).equals("U"))
                       {
                   %>
                                
                                     
                                    <div style="background-color:darksalmon;"> <img style="height:20px;width:20px;" src="resource/arrow.jpg"> <%=message%></div>
                                
                                    <%
                        }
                       else
                       {
%>         
       
                                   
     <div style="background-color:bisque;"> <img style="height:20px;width:20px;" src="resource/arrow.jpg"> <%=message%></div>
                               
            <%
                       }
                   %>
                   </div>
                   <%
            }      
  
            %>
             <div style="margin-top:8px;margin-left:13px;">
                                    <a href="notireading.jsp?status='R'"><div style="float:left;width:40%;font-size:15px;"> Mark All as Read</div></a>
                                    <a href="notireading.jsp?status='U'"><div style="float:left;width:40%;font-size:15px;">Mark All as Unread</div></a>
                                </div>
                    </div>
            </div>
    </body>
    <%Jdbcpro.closeConnection(con);%>
</html>
