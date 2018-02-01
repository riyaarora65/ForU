<%-- 
    Document   : You
    Created on : 28 Jan, 2017, 11:44:00 AM
    Author     : Riya Arora
--%>

<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="pr1.Jdbcpro,pr1.NAction"%>
<%@page import="javax.script.ScriptEngineManager,javax.script.ScriptEngine" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="youpagecss.css"> 
        <link rel="stylesheet" href="forucss.css">   
        <style type="text/css">
            .m1
            {
                padding:10px;
                background-color:#FF3333;
                color:bisque;
                float:left;
                width:18.5%;
                font-size:20px;
                font-weight:bold;
            }
            .m2
            {
                text-decoration:none;
                color:bisque;
            }
            .k1
            {
                padding:10px;
                background-color:brown;
                color:bisque;
                float:left;
                width:18.5%;
                font-size:20px;
                font-weight:bold;
            }
            .k2
            {
                text-decoration:none;
                color:bisque;
            }

        </style>
        <script>
            function winOpen(int ansid)
            {
                window.open("popuppage.jsp?ansid,"_blank","scrollbars=1,resizeable=1,height=300,width=450");
            }
            
        </script>
    </head>
    <body>
        <jsp:include page="header.jsp"/>  
        <%
            String name = "", status = "";
            String edu = "";
            String city = "";
            String ans = "", cname = "", cedu = "", comment = "";
            int aid, qid, did;
            String ques = "";
            String image = "";
            int uid = (Integer) session.getAttribute("uid");
            Connection con=Jdbcpro.getConnection();
            String sql = "Select p.name,p.education,c.cname,p.status,p.img from city c, profile p where p.pid=" + uid + " and c.cid=p.city";

            ResultSet rs = Jdbcpro.get(con,sql);
            while (rs.next()) {
                name = rs.getString(1);
                edu = rs.getString(2);
                city = rs.getString(3);
                status = rs.getString(4);
                image = "resource/" + rs.getString(5);

                
        %>
        <div class="c1">
            <div class="c2">
                <div class="c3">
                    <img  style="height:300px;width:300px;" src="<%=image%>">
                    <div ><a style="margin-left:4px;font-weight:bold;font-size:22px;" class="hyperlinks" href="imageuploader.jsp">Upload Profile Picture</a></div>
                </div>
                <div>
                    <br/>
                    <div class="profileinfo"><%=name%></div>
                    <div class="profileinfo"><%=edu%></div>
                    <div class="profileinfo">"<%=status%>"</div>
                    <div class="profileinfo">Lives in <%=city%></div>
                    <%
                            }%>

                </div>

            </div>

            <h1 class="headings" style=" margin-right:10px;">Recently Answered Questions</h1>
            <%
                String sql1 = "select a.ans,a.aid, q.ques,q.qid,a.domainid  from answers a, querry q where a.uid=" + uid + " and a.quesid=q.qid";
                ResultSet rs1 = Jdbcpro.get(con,sql1);%>

            <%

                while (rs1.next()) {
                    ans = rs1.getString(1);
                    aid = rs1.getInt(2);
                    qid = rs1.getInt(4);
                    ques = rs1.getString(3);
                    did = rs1.getInt(5);
            %>

            <div class="ques_ans" style="float:left; margin-left:10px;margin-top: 5px;">


                <b>   <%=ques%> </b><br>
                <%
                if(ans.length()>300)
                {%>
               <%=ans.substring(0,300)%>....<a style="text-decoration:none" href="particularans.jsp?aid=<%=aid%>&src=Youpage.jsp.jsp">read more</a><br/><br>
               <% }
                else
                {%>
                   <%=ans%>
                   <%}%>
                

                <div class="voting" style="margin-left:3px;color:bisque;float:left">
                    <%String sql2 = "select sum(upvote) from vote where ansid=" + aid;

                        ResultSet rs8 = Jdbcpro.get(con,sql2);
                        while (rs8.next()) {
                    %>
                    Upvotes <%=rs8.getInt(1)%>
                    <%
                        }
                        String sql9 = "Select sum(downvote) from vote where ansid=" + aid;
                        ResultSet rs9 = Jdbcpro.get(con,sql9);
                        while (rs9.next()) {
                    %>
                    Downvotes <%=rs9.getInt(1)%>  
                    <%}%>
                </div>
                <div style="float:left;width:20%;text-align:center;" class="voting">
                    <a class="voting"  href="ansedit.jsp?aid=<%=aid%>&src=Youpage.jsp"> Edit</a>
                </div>
                <div style="float:left;width:20%;text-align:center;" class="voting">
                    <a class="voting" href="" onclick="winOpen(ansid)">Delete</a> 
                </div>
                <form action="postcomment.jsp">
                    <div style="float:left;width:25%;text-align: center;"  class="Comment"> Comment
                        <div style="border:2px solid black;" class="CommentInner">
                            <%

                                String sql7 = "Select c.comment,p.name,p.education  from comments c,profile p where c.ansid=" + aid + " and p.pid=c.userid";
                                ResultSet rs7 = Jdbcpro.get(con,sql7);
                                while (rs7.next()) {
                                    comment = rs7.getString(1);
                                    cname = rs7.getString(2);
                                    cedu = rs7.getString(3);
                            %>
                            <div style="font-weight:bold;font-size:18px;margin-left:20px;"><%=cname%>,completed<%=cedu%></div>

                            <div style="font-size:15px;text-align:left;margin-left:5px;margin-top:15px;"><%=comment%></div>
                            <%}%>
                            <div style="text-align:left;margin-left:5px;font-size:15px;margin-top:5px;font-style: italic;">Write your comment here....</div>        
                            <div><input type="text" name="comment" size="52" ></div>
                            <div><input type="submit" value="Post" name="postbtn"></div>

                            <input type="hidden" name="personid" value="<%=uid%>"> 
                            <input type="hidden" name="ansid" value="<%=aid%>">
                        </div>
                    </div>
                </form>

            </div>   

            <%
                }
                Jdbcpro.closeConnection(con);
            %>  

        </div>
        <div style="width:100%;height:42px;border:5px solid #996633;">
            <div class="k1"><a class="k2" href="bookmarkshow.jsp">Bookmarks</a> </div>
            <div class="k1"><a class="k2" href="messageshow.jsp">Messages</a></div>
            <div class="k1"><a class="k2" href="list.jsp?action=followerslist">Followers</a></div>
            <div class="k1"><a class="k2" href="settingspage.jsp">Settings</a></div>
            <div class="k1"><a class="k2" href="postques.jsp">Ask</a></div>
        </div>
    </body>
</html>

