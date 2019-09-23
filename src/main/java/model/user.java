package model;

import java.io.Serializable;

public class user  implements Serializable{

    private String first_name;
    private String last_name;
    private String email;
    private String password;
    private String passport_number;
    private String DOB;

    public user() {
    }

    public user(String first_name, String last_name, String email, String password, String passport_number, String DOB) {
        this.first_name = first_name;
        this.last_name = last_name;
        this.email = email;
        this.password = password;
        this.passport_number = passport_number;
        this.DOB = DOB;
    }

    public boolean match(String email){
        return this.email.equalsIgnoreCase(email.trim());
    }
    
    public String getPassport_number() {
        return passport_number;
    }

    public void setPassport_number(String passport_number) {
        this.passport_number = passport_number;
    }
    public String getName() {
        return first_name + last_name;
    }

    public void setFirstName(String first_name) {
        this.first_name = first_name;
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
    
    public String getDOB(){
        return DOB;
    }
    
    public void setDOB(String DOB){
        this.DOB = DOB;
    }

}
