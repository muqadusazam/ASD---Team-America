package fc.model;

import java.io.Serializable;

/**
 *
 * @author Liam
 */
public class Customer implements Serializable{
    
    private String id;
    private String first_name;
    private String last_name;
    private String email;
    private String password;
    private String dob;
    
    public Customer() {
    }
    
    public Customer(String id, String first_name, String last_name, String email,
            String password, String dob) {
        
        this.id = id;
        this.first_name = first_name;
        this.last_name = last_name;
        this.email = email;
        this.password = password;
        this.dob = dob;
        
    }
    
    public boolean match(String email){
        return this.email.equalsIgnoreCase(email.trim());
    }
    
    public String getID() {
        return id;
    }
    
    public String getFirstName() {
        return first_name;
    }
    
    public void setFirstName(String first_name) {
        this.first_name = first_name;
    }
    
    public String getLastName() {
        return last_name;
    }
    
    public void setLastName(String last_name) {
        this.last_name = last_name;
    }
    
    public String getEmail() {
        return email;
    }
    
    public void setEmail(String email) {
        this.email = email;
    }
    
    public String getPassword() {
        return password;
    }
    
    public void setPassword(String password) {
        this.password = password;
    }
    
    public String getDOB() {
        return dob;
    }
    
    public void setDOB(String dob) {
        this.dob = dob;
    }
}
