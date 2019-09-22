package fc.controller;

import fc.model.Customer;
import fc.model.dao.MongoDBManager_Customers;
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
 * @author kyle
 *      Implements Kelvin's RegisterServlet as conditions are identical
 */
@WebServlet(name = "ProfileEditServlet", urlPatterns = {"/ProfileEditServlet"})
public class ProfileEditServlet extends HttpServlet {
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
        Map<String,String> errors = new HashMap<String,String>(); //Map for storing error messages
        HttpSession session = request.getSession();
        
        String firstName = request.getParameter("fname");       //Gets 'fname' parameter from edit_profile form
        if (!validate(namePattern, firstName)){     //validates input, if invalid input then store a relevant error message
            errors.put("fNameErr", "First name must contain at least 1 capital letter");
        }
        
        String lastName = request.getParameter("lname");        //Gets 'lname' parameter from edit_profile form
        if (!validate(namePattern, lastName)){      //validates input, if invalid input then store a relevant error message
            errors.put("lNameErr", "Last name must contain at least 1 capital letter");
        }
        
        String email = request.getParameter("email");       //Gets 'email' parameter from edit_profile form
        if (!validate(emailPattern, email)){        //validates input, if invalid input then store a relevant error message
            errors.put("emailErr", "Incorrect email format");
        }
        
        String password = request.getParameter("password");     //Gets 'password' parameter from edit_profile form
        if (!validate(passwordPattern, password)){      //validates input, if invalid input then store a relevant error message
            errors.put("passwordErr", "Password must contain at least 5 letters and 1 number");     
        }
        
        String passport = request.getParameter("passport");     //Gets 'passport' parameter from edit_profile form
        if (!validate(passportPattern, passport)){      //validates input, if invalid input then store a relevant error message
            errors.put("passportErr", "Passport number must be capitalised initials followed by 3 numbers");
        }
        
        String DOB = request.getParameter("DOB");       //Gets 'DOB' parameter from edit_profile form 
        
        if (errors.isEmpty()) { //redirect to next page if no error is detected in errors map
            MongoDBManager_Customers db = new MongoDBManager_Customers();
            Customer customer = (Customer)session.getAttribute("customer");
            db.editCustomer(customer.getID(), firstName, lastName, email, password, passport, DOB);
            response.sendRedirect("account.jsp");
        }
        else { //put errors in request scope and forward them back to edit_profile.jsp to display error messages
            request.setAttribute("errors", errors);
            request.getRequestDispatcher("edit_profile.jsp").forward(request, response);
        }
    }

    //regex for validating input from register.jsp form
    private String emailPattern = "(([a-zA-Z0-9]+)(@)([a-zA-Z0-9]+)[.]([a-zA-Z0-9]+))"; //char@char.char, in that order
    private String namePattern = "[A-Z]{1}[a-z]*"; //1 capital char, 0 or more lowercase chars
    private String passwordPattern = "[a-z]{5,}[0-9]+"; //5 or more chars, 1 or more ints
    private String passportPattern = "[A-Z]{2}[0-9]{3}"; //2 capital chars, 3 ints
   
    public boolean validate(String pattern, String input){ //return false if input does not match pattern
        Pattern regEx = Pattern.compile(pattern);
        Matcher match = regEx.matcher(input);
        return match.matches();
    }
    
}