package fc.model;

import java.io.Serializable;

public class Customer implements Serializable, Comparable<Customer>{
    
    // declaring private fields for customer class
    private String id;
    private String first_name;
    private String last_name;
    private String email;
    private String password;
    private String passport;
    private String dob;
    
    public Customer() {} // Default Constructor
    
    public Customer(String id, String first_name, String last_name, String email, // Custructor which takes in String values and validate it to default values
            String password, String passport, String dob) { 
        this.id = id;
        this.first_name = first_name;
        this.last_name = last_name;
        this.email = email;
        this.password = password;
        this.passport = passport;
        this.dob = dob;
    }
    
    // returning an email by trimiming the start and end based on the input
    public boolean emailMatch(String email){ 
        return this.email.equalsIgnoreCase(email.trim());
    }
    
    // returning an passport based on the input
    public boolean passportMatch(String passport){
        return this.passport.equals(passport);
    }
    
    // returning the customer ID
    public String getID(){
        return id;
    }
    
    // returning customer's firt name
    public String getFirstName(){
        return first_name;
    }
    
    // setting customer's fist name by the given input
    public void setFirstName(String first_name){
        this.first_name = first_name;
    }
    
    // returning customer's last name
    public String getLastName(){
        return last_name;
    }
    
   // setting customer's last name by the given input
    public void setLastName(String last_name){
        this.last_name = last_name;
    }
    
    // returning customer's full name
    public String getFullName(){
        return first_name+" "+last_name;
    }
    
    // returning customer's email
    public String getEmail(){
        return email;
    }
    
    // setting customer's email by the given input
    public void setEmail(String email){
        this.email = email;
    }
    
    // returning customer's password
    public String getPassword(){
        return password;
    }
    
    // setting customer's password by the given input
    public void setPassword(String password){
        this.password = password;
    }
    
    // returning customer's passport
    public String getPassport(){
        return passport;
    }
    
    // setting customer's passport by the given input
    public void setPassport(String passport){
        this.passport = passport;
    }
    
    // returning customer's DOB
    public String getDOB(){
        return dob;
    }
    
    // setting customer's DOB by the given input
    public void setDOB(String dob){
        this.dob = dob;
    }
    
    @Override
    public int compareTo(Customer other) {
        return Integer.compare(Integer.parseInt(getID()), Integer.parseInt(other.getID()));
    }
}
