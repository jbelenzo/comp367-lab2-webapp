package ca.belenzo;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.time.LocalTime;

public class WelcomeServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Set response content type
        response.setContentType("text/html");

        // Get the current time
        LocalTime currentTime = LocalTime.now();

        // Determine whether it's morning or afternoon
        String greeting;
        if (currentTime.isBefore(LocalTime.NOON)) {
            greeting = "Good morning, Jasper, Welcome to COMP367";
        } else {
            greeting = "Good afternoon, Jasper, Welcome to COMP367";
        }

        // Print the greeting
        PrintWriter out = response.getWriter();
        out.println("<html><body>");
        out.println("<h1>" + greeting + "</h1>");
        out.println("</body></html>");
    }
}
