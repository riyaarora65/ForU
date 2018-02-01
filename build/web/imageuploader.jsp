<%-- 
    Document   : imageuploader.jsp
    Created on : 22 Mar, 2017, 11:54:42 AM
    Author     : Riya Arora
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        Upload File : 
       <form action="upload.jsp" method="post" enctype="multipart/form-data">
           
        <input type="file" name="file_upload" />
        <input type="submit" value="Upload" />
  </FORM>
  	
    </body>
</html>
