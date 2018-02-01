<%-- 
    Document   : login
    Created on : 27 Jan, 2017, 11:58:16 AM
    Author     : Riya Arora
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
    </head>
    <body style="background: url(resource/M.jpg) repeat;">
        <%
            
            String m=request.getParameter("msg");
            if(m == null)
            {
               m = "Please Login....";
                
            }
            out.print("<h1>"+m+"</h1>");
           %>
        <form action="Validate.jsp">
        <div style="width:300px">
            <fieldset style="width:300px;color:#660000;"> 
                   <legend style="font-size:25px;text-align:center;color:darkred;"><b>Login Page</b></legend>
                <div style="margin-left:30px;">
                    <div>   UserName :  </div>
                    <div> <input type=text name=username size="30"></div>
                </div><br/>
                <div  style="margin-left:30px;">
                            <div> Password :  </div>
                            <div> <input type=password name=password size="30"></div>
                </div>
                <br/>
                      <div style="text-align:right;margin-right:30px;"><input type="submit" name="btn" value="Login"></div>
                      <div  style="margin-left:30px;">Forget Password | Sign Up</div>
              </div>
        </fieldset>
        </form>
    </body>
</html>
