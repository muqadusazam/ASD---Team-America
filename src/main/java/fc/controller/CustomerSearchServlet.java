package fc.controller;

import fc.model.Customer;
import fc.model.dao.MongoDBManager_Customers;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServlet;

@WebServlet(name = "CustomerSearchServlet", urlPatterns = {"/CustomerSearchServlet"})
public class CustomerSearchServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        MongoDBManager_Customers customerDB = new MongoDBManager_Customers();       //Create connection to mLab
        Map<String, String> errors = new HashMap<String, String>();
        String searchCustomer = request.getParameter("search");
        String sortBy = request.getParameter("sortBy");
        if (!validate(customerPattern, searchCustomer)) {
            errors.put("searchCustomerErr", "Invalid search input!");
        }

        ArrayList<Customer> customers;
        //validate destination using pattern (only letters, no numbers, no special characters, length?
        //If error, send back error message
        //If none, continue/set attributes$$$$$$$$$$$$$$$$$$$$$$$$$$
        if (errors.isEmpty()) {
            if (searchCustomer != null && !searchCustomer.isEmpty() && customerDB.customerExist(searchCustomer)) {
                customers = customerDB.getCustomerByNameOrID(searchCustomer);
            } else {
                customers = customerDB.getCustomers();
                errors.put("noCustomerErr", "No users found!");
            }
            if (sortBy != null && sortBy.equals("name")) {
                Collections.sort(customers, new Comparator<Customer>() {
                    @Override
                    public int compare(final Customer a, final Customer b) {
                        return a.getFirstName().compareTo(b.getFirstName());
                    }
                });
            } else if (sortBy != null && sortBy.equals("email")) {
                Collections.sort(customers, new Comparator<Customer>() {
                    @Override
                    public int compare(final Customer a, final Customer b) {
                        return a.getEmail().compareTo(b.getEmail());
                    }
                });
            } else {
                Collections.sort(customers, new Comparator<Customer>() {
                    @Override
                    public int compare(final Customer a, final Customer b) {
                        return Integer.parseInt(a.getID()) - Integer.parseInt(b.getID());
                    }
                });
            }
            request.setAttribute("sortBy", sortBy);
            request.setAttribute("errors", errors);
            request.setAttribute("customers", customers);
            request.getRequestDispatcher("user_management.jsp").forward(request, response);
        } else { //put errors in request scope and forward them back to register.jsp to display error messages
            request.setAttribute("errors", errors);
            request.getRequestDispatcher("user_management.jsp").forward(request, response);
        }
    }

    //regex for validating input from flights.jsp and flights_searchResults.jsp
    private String customerPattern = "[a-zA-Z\\d@\\.]{0,20}"; //Only allow characters a-z, A-Z and one use of a dash '-'

    public boolean validate(String patternString, String input) { //return false if input does not match pattern
        Pattern pattern = Pattern.compile(patternString); //Interprets regex pattern
        Matcher match = pattern.matcher(input); //Sets up a matcher for comparing regex pattern to input
        return match.matches();
    }
}
