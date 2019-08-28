package fc.controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 *
 * @author kelvin
 */
@WebServlet(name = "RegisterServlet", urlPatterns = {"/RegisterServlet"})
public class RegisterServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet RegisterServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet RegisterServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Map<String,String> errors = new HashMap<String,String>();
        
      //  processRequest(request, response);
        HttpSession session = request.getSession();
        
        String firstName = request.getParameter("fname");
        if (!validate(namePattern, firstName)){
            errors.put("fNameErr", "Incorrect name format");
        }
        
        String lastName = request.getParameter("lname");
        if (!validate(namePattern, lastName)){
            errors.put("lNameErr", "Incorrect name format");
        }
        
        String email = request.getParameter("email");
        if (!validate(emailPattern, email)){
            errors.put("emailErr", "Incorrect email format");
        }
        
        String password = request.getParameter("password");
        if (!validate(passwordPattern, password)){
            errors.put("passwordErr", "Incorrect password format");
        }
        
        String passport = request.getParameter("passport");
        if (!validate(passportPattern, passport)){
            errors.put("passportErr", "Incorrect passport format");
        }
        
        String DOB = request.getParameter("DOB");
        
        if (errors.isEmpty()) {
            //redirect to next page if no error
            response.sendRedirect("user_management.jsp");
        }
        else {
            //put errors in request scope and forward them back to register.jsp
            request.setAttribute("errors", errors);
            request.getRequestDispatcher("register.jsp").forward(request, response);
        }
    }

    //regex for validating input from register.jsp form
    private String emailPattern = "([a-zA-Z0-9]+)(([._-])([a-zA-Z0-9]+))*(@)([a-z]+)(.)([a-z]{3})((([.])[a-z]{0,2})*)";   
    private String namePattern = "[A-Z]{1}[a-z]*"; //1 capital char, 0 or more lowercase chars
    private String passwordPattern = "[a-z]{5,}[0-9]+"; //5 or more chars, 1 or more ints
    private String passportPattern = "[A-Z]{2}[0-9]{3}"; //2 capital chars, 3 ints
   
    public boolean validate(String pattern, String input){ //return false if input does not match pattern
        Pattern regEx = Pattern.compile(pattern);
        Matcher match = regEx.matcher(input);
        return match.matches();
    }
    
}