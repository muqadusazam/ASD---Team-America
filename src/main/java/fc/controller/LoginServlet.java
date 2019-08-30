/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
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

import fc.model.dao.*;
import fc.model.*;
/**
 *
 * @author Muqadus
 */
@WebServlet(name = "LoginServlet", urlPatterns = {"/LoginServlet"})
public class LoginServlet extends HttpServlet {
    
    
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Map<String,String> errors = new HashMap<String,String>();
        HttpSession session = request.getSession();
        
        
        String email = request.getParameter("email");
        if (!validate(emailPattern, email)){
            errors.put("emailErr", "Incorrect email format");
        }
        
        String password = request.getParameter("password");
        if (!validate(passwordPattern, password)){
            errors.put("passwordErr", "Password must contain at least 5 letters and 1 number");
        }
        
        MongoDBManager_Customers db = new MongoDBManager_Customers(); 
        Customer customer = db.getCustomer(email, password);
        
        if (customer != null){
            response.sendRedirect("main.jsp");
        } else{
            request.setAttribute("errors", errors);
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
//        if (errors.isEmpty()) { //redirect to next page if no error is detected in errors map
//            response.sendRedirect("main.jsp");
//        }
//        else { //put errors in request scope and forward them back to register.jsp to display error messages
//            request.setAttribute("errors", errors);
//            request.getRequestDispatcher("login.jsp").forward(request, response);
//        }
    }
    
        //regex for validating input from register.jsp form
    private String emailPattern = "([a-zA-Z0-9]+)(([._-])([a-zA-Z0-9]+))*(@)([a-z]+)(.)([a-z]{3})((([.])[a-z]{0,2})*)";   
    private String passwordPattern = "[a-z]{5,}[0-9]+"; //5 or more chars, 1 or more ints
    
    public boolean validate(String pattern, String input){ //return false if input does not match pattern
        Pattern regEx = Pattern.compile(pattern);
        Matcher match = regEx.matcher(input);
        return match.matches();
    }
}