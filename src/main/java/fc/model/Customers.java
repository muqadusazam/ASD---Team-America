package fc.model;

import java.io.Serializable;
import java.util.*;

/**
 *
 * @author Liam
 */
public class Customers implements Serializable{
   
    private ArrayList<Customer> list = new ArrayList<>();

    public Customers() {
    }

    public ArrayList<Customer> getList() {
        return list;
    }

    public void addCustomer(Customer customer) {
        list.add(customer);
    }
    public void removeCustomer(Customer customer) {
        list.remove(customer);
    }

    public Customer login(String email, String password) {
        for (Customer customer : list) {
            if (customer.getEmail().equals(email) && customer.getPassword().equals(password)) {
                return customer;
            }
        }
        return null;
    }

    public Customer getCustomer(String id) {
        for (Customer customer : list) {
            if (customer.getID().equals(id)) {
                return customer;
            }
        }
        return null;
    }

    public ArrayList<Customer> getMatches(String email) {
        ArrayList<Customer> matches = new ArrayList<>();
        for (Customer customer : list) {
            if (customer.getEmail().equals(email)) {
                matches.add(customer);
            }
        }
        return matches;
    }

    public void deleteCustomer(String id) {
        Customer customer = getCustomer(id);
        if (customer != null) {
            removeCustomer(customer);
        } else {
            System.out.println("Customer Doesn't exist!");
        }
    }
}
