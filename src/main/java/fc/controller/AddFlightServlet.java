/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fc.controller;

import java.util.HashMap;
import java.util.Map;
import java.util.Random;

/**
 *
 * @author el181
 */

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import fc.model.*;
import fc.model.dao.*;

//Creates a link to this servlet for flgihtAdd_management.jsp page to use
@WebServlet(name = "AddFlightServelt", urlPatterns = {"/AddFlightServlet"})

public class AddFlightServlet extends HttpServlet{
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        Map<String,String> errors; //Map for storing error messages
        errors = new HashMap<String,String>();
        HttpSession session = request.getSession(); //Gets the current http session
        
        
           String airline = request.getParameter("airline");
            String origin = request.getParameter("origin");
            String destination= request.getParameter("destination");
            
            String departure_time= request.getParameter("departureTime");
            if (!validate(timePattern,departure_time)){ 
            errors.put("DtimeError", "Time must be hh:mm am/pm format");
        }
            String departure_date= request.getParameter("departureDate");
            if (!validate(datePattern,departure_date)){ 
            errors.put("DdateError", "Date must be DD-MM-YYYY format");
        }
            String arrival_time= request.getParameter("arrivalTime");
            if (!validate(timePattern,arrival_time)){ 
            errors.put("AtimeError", "Time must be hh:mm am/pm format");
        }
            String arrival_date= request.getParameter("arrivalDate");
            if (!validate(datePattern,arrival_date)){ 
            errors.put("AdateError", "Date must be DD-MM-YYYY format");
        }
            String status= request.getParameter("status");
            
            String price= request.getParameter("price");
            if (!validate(numPattern,price)){ 
            errors.put("PriceError", "The price should be a number");
        }
            String available_seats= request.getParameter("seats");
            if (!validate(numPattern,price)){ 
            errors.put("AvaSeatsError", "The number of seats should be a number");
        }
            int key = 10000 +(new Random()).nextInt(9999);
            String ID = "" + key;

        
        if (errors.isEmpty()) {
            
            response.sendRedirect("flightAddSuccess.jsp");
                MongoDBManager_Flights db = new MongoDBManager_Flights();   
                Flight flight = new Flight(ID,airline,origin,destination,departure_time,departure_date,arrival_time,arrival_date,status,price,available_seats);
                db.add(flight);
            
        }
        else { //put errors in request scope and forward them back to register.jsp to display error messages
            request.setAttribute("errors", errors);
            request.getRequestDispatcher("flightAdd_management.jsp").forward(request, response);
        }
    }
    
    //regex for validating input from register.jsp form
    private final String timePattern = "[0-2][0-3][:][0-5][0-9][aApP][mM]";
    private final String datePattern = "([0-9]{2})-([0-9]{2})-([0-9]{4})";
    private final String numPattern = "[0-9]*";
 
    public boolean validate(String patternString, String input){ //return false if input does not match pattern
        Pattern pattern = Pattern.compile(patternString); //Interprets regex pattern
        Matcher match = pattern.matcher(input); //Sets up a matcher for comparing regex pattern to input
        return match.matches();
    }
}