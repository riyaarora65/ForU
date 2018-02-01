<%-- 
    Document   : header
    Created on : 7 Feb, 2017, 11:35:36 AM
    Author     : Riya Arora
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
          <style type="text/css">
            .m1
            {
                padding:10px;
                background-color:#660000;
                color:bisque;
                float:left;
                width:23.5%;
                font-size:20px;
                font-weight:bold;
            }
            .m2
            {
                text-decoration:none;
                color:bisque;
            }
           
            
        </style>
    </head>
    <body>
        
            <div style="overflow:auto;width:100%;">
                <div style="float:left;font-size:50px;font-weight:bold;color:#660000;font-family:serif;">ForU</div>
                <div style="float:right;">
                    <form action="searchuser.jsp">
                          <div style="float:left;"><input style="background-color:bisque;" type="text" name="txtfield" size="50"></div>
                          <div style="float:left;"><input style="padding:2px;" type="submit" value="Search" name="btn"></div>
                     </form>
                </div>
            </div>
        
        <div>
                            <div style="font-size:30px;font-style: italic;color:#990000;margin-left:10px;">The important thing is not to stop Questioning...</div>
        </div>
       
        <div style="width:100%;height:42px;border:5px solid  #996633;">
            <div class="m1"><a class=m2 href="Home.jsp">Read</a> </div>
            <div class="m1"><a class=m2 href="domains.jsp">Answer</a></div>
            <div class="m1"><a class="m2" href="noti.jsp" >Notifications</a></div>
            <div class="m1"><a class="m2" href="Youpage.jsp">You</a></div>
        </div>
    </body>
</html>
