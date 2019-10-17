package fc.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "ViewBookingServlet", urlPatterns = {"/ViewBookingServlet"})
public class ViewBookingServlet extends HttpServlet{
    
        @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Map<String,String> errors = new HashMap<String,String>(); 
        
    String searchOrigin = request.getParameter("departure");
    String searchDestination = request.getParameter("destination");

        if(!validate(inputPattern, searchOrigin)){
            errors.put("Err", "Departure cannot contain numbers or special characters");
        }
        if(!validate(inputPattern, searchDestination)){
            errors.put("Err", "Destination cannot contain numbers or special characters");
        }
        if(!validate(inputPattern, searchOrigin) && !validate(inputPattern, searchDestination)){
            errors.put("Err", "Both departure and destination cannot contain numbers or special characters");
        }
    if (errors.isEmpty()) { //redirect to next page if no error is detected in errors map
            //response.sendRedirect("booking_History_Results.jsp");
            request.setAttribute("departure", searchOrigin);
            request.setAttribute("destination", searchDestination);
            request.getRequestDispatcher("booking_History_Results.jsp").forward(request, response);  
        }
        else { //put errors in request scope and forward them back to register.jsp to display error messages
            request.setAttribute("errors", errors);
            request.getRequestDispatcher("booking_history.jsp").forward(request, response); // staying back on login jsp page
        }
    }
    
    private String inputPattern = "[a-zA-Z]*"; //Only allow characters a-z, A-Z and one use of a dash '-'
    public boolean validate(String patternString, String input){ //return false if input does not match pattern
    Pattern pattern = Pattern.compile(patternString); //Interprets regex pattern
    Matcher match = pattern.matcher(input); //Sets up a matcher for comparing regex pattern to input
    return match.matches();
    }
}
