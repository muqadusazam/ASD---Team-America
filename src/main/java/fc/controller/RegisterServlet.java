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
import java.text.*;
import fc.model.*;
import fc.model.dao.*;

//Creates a link to this servlet for register.jsp page to use
@WebServlet(name = "RegisterServlet", urlPatterns = {"/RegisterServlet"})

public class RegisterServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        Map<String,String> errors = new HashMap<String,String>(); //Map for storing error messages
        HttpSession session = request.getSession(); //Gets the current http session
        
        //Gets first name input from register.jsp, validates it, if invalid input then store a relevant error message
        String firstName = request.getParameter("fName");
        if (!validate(namePattern, firstName)){ 
            errors.put("fNameErr", "First name must contain at least 1 capital letter");
        }
        
        //Gets last name input from register.jsp, validates it, if invalid input then store a relevant error message
        String lastName = request.getParameter("lName");
        if (!validate(namePattern, lastName)){
            errors.put("lNameErr", "Last name must contain at least 1 capital letter");
        }
        
        //Gets email input from register.jsp, validates it, if invalid input then store a relevant error message
        String email = request.getParameter("email");
        if (!validate(emailPattern, email)){
            errors.put("emailErr", "Incorrect email format");
        }
        
        //Gets password input from register.jsp, validates it, if invalid input then store a relevant error message
        String password = request.getParameter("password");
        if (!validate(passwordPattern, password)){
            errors.put("passwordErr", "Password must contain at least 5 letters and 1 number");
        }
        
        //Gets passport input from register.jsp, validates it, if invalid input then store a relevant error message
        String passport = request.getParameter("passport");
        if (!validate(passportPattern, passport)){
            errors.put("passportErr", "Passport number must be capitalised initials followed by 3 numbers");
        }
        
        //Gets DOB input from register.jsp, validates it, if invalid date then store a relevant error message
        String DOB = request.getParameter("DOB");
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        String dateToday = formatter.format(new Date()); //Formats today's date to the date format specified above
        if (DOB.compareTo(dateToday) >= 0){ //If DOB >= today's date, store an error message
            errors.put("DOBErr", "DOB must be before today's date");
        }
        
        if (errors.isEmpty()) {
            response.sendRedirect("registerSuccess.jsp"); //redirect to next page if no error is detected in errors map
            String key = Integer.toString(100000 + (new Random().nextInt(99999))); //Random number generator for customer ID
            MongoDBManager_Customers db = new MongoDBManager_Customers(); //Create a new collection (table) in mLab DB
            Customer customer = new Customer(key, firstName, lastName, email, password, passport, DOB);
            db.add(customer); //Add the new customer to the DB
        }
        else { //put errors in request scope and forward them back to register.jsp to display error messages
            request.setAttribute("errors", errors);
            request.getRequestDispatcher("register.jsp").forward(request, response);
        }
    }
    
    //regex for validating input from register.jsp form
    private String emailPattern = "(([a-zA-Z0-9]+)(@)([a-zA-Z0-9]+)[.]([a-zA-Z0-9]+))"; //char@char.char, in that order
    private String namePattern = "[A-Z]{1}[a-z]*"; //1 capital char, 0 or more lowercase chars
    private String passwordPattern = "[a-z]{5,}[0-9]+"; //5 or more chars, 1 or more ints
    private String passportPattern = "[A-Z]{2}[0-9]{3}"; //2 capital chars, 3 ints
    
    public boolean validate(String patternString, String input){ //return false if input does not match pattern
        Pattern pattern = Pattern.compile(patternString); //Interprets regex pattern
        Matcher match = pattern.matcher(input); //Sets up a matcher for comparing regex pattern to input
        return match.matches();
    }
}
