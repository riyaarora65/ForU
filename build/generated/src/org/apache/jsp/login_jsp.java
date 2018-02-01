package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class login_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>JSP Page</title>\n");
      out.write("        \n");
      out.write("    </head>\n");
      out.write("    <body style=\"background: url(resource/M.jpg) repeat;\">\n");
      out.write("        ");

            
            String m=request.getParameter("msg");
            if(m == null)
            {
               m = "Please Login....";
                
            }
            out.print("<h1>"+m+"</h1>");
           
      out.write("\n");
      out.write("        <form action=\"Validate.jsp\">\n");
      out.write("        <div style=\"width:300px\">\n");
      out.write("            <fieldset style=\"width:300px;color:#660000;\"> \n");
      out.write("                   <legend style=\"font-size:25px;text-align:center;color:darkred;\"><b>Login Page</b></legend>\n");
      out.write("                <div style=\"margin-left:30px;\">\n");
      out.write("                    <div>   UserName :  </div>\n");
      out.write("                    <div> <input type=text name=username size=\"30\"></div>\n");
      out.write("                </div><br/>\n");
      out.write("                <div  style=\"margin-left:30px;\">\n");
      out.write("                            <div> Password :  </div>\n");
      out.write("                            <div> <input type=password name=password size=\"30\"></div>\n");
      out.write("                </div>\n");
      out.write("                <br/>\n");
      out.write("                      <div style=\"text-align:right;margin-right:30px;\"><input type=\"submit\" name=\"btn\" value=\"Login\"></div>\n");
      out.write("                      <div  style=\"margin-left:30px;\">Forget Password | Sign Up</div>\n");
      out.write("              </div>\n");
      out.write("        </fieldset>\n");
      out.write("        </form>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
