package fc.model;

import java.io.Serializable;
import java.util.*;

/**
 *
 * @author William
 */
public class Staffs implements Serializable{
   
    private ArrayList<Staff> list = new ArrayList<>();

    public Staffs() {
    }

    public ArrayList<Staff> getList() {
        return list;
    }

    public void addStaff(Staff staff) {
        list.add(staff);
    }
    public void removeStaff(Staff staff) {
        list.remove(staff);
    }

    public Staff login(String email, String password) {
        for (Staff staff : list) {
            if (staff.getEmail().equals(email) && staff.getPassword().equals(password)) {
                return staff;
            }
        }
        return null;
    }

    public Staff getStaff(String id) {
        for (Staff staff : list) {
            if (staff.getID().equals(id)) {
                return staff;
            }
        }
        return null;
    }

    public ArrayList<Staff> getMatches(String email) {
        ArrayList<Staff> matches = new ArrayList<>();
        for (Staff staff : list) {
            if (staff.getEmail().equals(email)) {
                matches.add(staff);
            }
        }
        return matches;
    }

    public void deleteStaff(String id) {
        Staff staff = getStaff(id);
        if (staff != null) {
            removeStaff(staff);
        } else {
            System.out.println("Staff Doesn't exist!");
        }
    }
}
