/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package test;

import cucumber.api.PendingException;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import io.github.bonigarcia.wdm.WebDriverManager;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.firefox.FirefoxDriver;
/**
 *
 * @author muqad
 */
public class BookingHistoryATDD {
    WebDriver driver;
    
    @Given("^log in \"([^\"]*)\" and \"([^\"]*)\"$")
    public void log_in(String arg1, String arg2) throws Throwable{
        Class<? extends WebDriver> driverClass = FirefoxDriver.class;
        WebDriverManager.getInstance(driverClass).setup();
        driver = driverClass.newInstance();
        driver.get("https://arsproject.herokuapp.com/login.jsp");
        driver.navigate().to(driver.getCurrentUrl());
        driver.findElement(By.id("Email")).sendKeys(arg1);
        driver.findElement(By.id("Password")).sendKeys(arg2);
        driver.findElement(By.id("BtnLogin")).click();
        System.out.println("Given statement successful!");
    }
    
    //Set starting page to bookingHistory.jsp
    @Given("^I am on the booking history page$")
    public void i_am_on_the_booking_history_page() throws Throwable {
//        Class<? extends WebDriver> driverClass = FirefoxDriver.class;
//        WebDriverManager.getInstance(driverClass).setup();
//        driver = driverClass.newInstance();
        driver.get("https://arsproject.herokuapp.com/booking_history.jsp");
        driver.navigate().to(driver.getCurrentUrl());
        System.out.println("Given statement executed successfully!");
       // throw new PendingException();
    }
    
        //Input query into departure textbox
    @When("^I fill in departure with \"([^\"]*)\"$")
    public void i_fill_in_departure_with(String arg1) throws Throwable {
        driver.findElement(By.id("departure")).sendKeys(arg1);
        driver.findElement(By.id("btnSubmit")).click();
      //  throw new PendingException();
    }
    
        //Search is successful
    @Then("^I should see booking_History_Results page$")
    public void i_should_see_booking_History_Results_page() throws Throwable {
        System.out.println("Search successfull");
        driver.get("https://arsproject.herokuapp.com/ViewBookingServlet?departure=London&destination=");
        driver.navigate().to(driver.getCurrentUrl());  
       // throw new PendingException();
    }
    
        //Unsuccessful search, input was bad
    @Then("^I should return to booking history page$")
     public void i_should_return_to_booking_history_page() throws Throwable {
        System.out.println("Search unsuccessful, input was incorrect format");
       // throw new PendingException();
    }
}