package ca.belenzo;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;

public class WelcomeServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Set response content type
        response.setContentType("text/html");

        // Print "Welcome to COMP367"
        PrintWriter out = response.getWriter();
        out.println("<html><body>");
        out.println("<h1>Welcome to COMP367</h1>");
        out.println("</body></html>");
    }
}
