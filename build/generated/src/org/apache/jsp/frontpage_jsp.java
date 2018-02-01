package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class frontpage_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("        <title>ForU</title>\n");
      out.write("        <style type=\"text/css\">\n");
      out.write(".c1{\n");
      out.write("background:url(resource/lll.jpg) no-repeat;\n");
      out.write("padding:15%;\n");
      out.write("text-align:justify;\n");
      out.write("font-weight:bold;\n");
      out.write("font-size:60px;\n");
      out.write("color:white;\n");
      out.write("}\n");
      out.write(".c2{\n");
      out.write("font-style:italic;\n");
      out.write("font-size:25px;\n");
      out.write("}\n");
      out.write(".c3{\n");
      out.write("font-size:50px;\n");
      out.write("text-decoration:none;\n");
      out.write("color:darkgoldenrod;\n");
      out.write("}\n");
      out.write("</style>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <div class=c1>\n");
      out.write("    <div>\n");
      out.write("    Join the new revolution....!!!\n");
      out.write("\t</div>\n");
      out.write("\t<div class=c2>\n");
      out.write("\tA new world of disscussion and interaction.We value your passion of writing.Have expertize in any domain then show your skills to everyone.Give expert advice to needy or if you have any kind of querry then feel \n");
      out.write("\tfree to ask a question.we have experts in different domains to give you the correct guidance.\n");
      out.write("\t</div>\n");
      out.write("\t<div class=c2>\n");
      out.write("\tExcited!!!..\n");
      out.write("\t</div>\n");
      out.write("\t<div class=c2>\n");
      out.write("\tGet Started now..</div>\n");
      out.write("\t<div class=c3>\n");
      out.write("\t<br><center>\n");
      out.write("            <a href=\"login.jsp\" class=c3> Login </a> |<a href=\"profilepage.jsp\" class=c3> Sign Up </a></center>\n");
      out.write("</div>\n");
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
