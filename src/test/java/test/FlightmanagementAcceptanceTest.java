package test;
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author el181
 */

import org.openqa.selenium.By;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.firefox.FirefoxDriver;
import io.github.bonigarcia.wdm.WebDriverManager;

public class FlightmanagementAcceptanceTest {
     
    WebDriver driver;
    
    //Login to Flight Centre
    @Given("^I log in as \"([^\"]*)\" and \"([^\"]*)\"$")
    public void i_log_in_as(String arg1, String arg2) throws Throwable{
        Class<? extends WebDriver> driverClass = FirefoxDriver.class;
        WebDriverManager.getInstance(driverClass).setup();
        driver = driverClass.newInstance();
        driver.get("https://arsproject.herokuapp.com/login.jsp");
        driver.navigate().to(driver.getCurrentUrl());
        driver.findElement(By.id("Email")).sendKeys(arg1);
        driver.findElement(By.id("Password")).sendKeys(arg2);
        driver.findElement(By.id("BtnLogin")).click();
        System.out.println("Given statement (login as \"user@two.com\") successful!");
    }
    
    //Navigate to flight management ticket page
    @Given("^I am on the flights management page$")
    public void I_am_on_the_flights_management() throws Throwable{
        driver.get("https://arsproject.herokuapp.com/flight_management.jsp");
        driver.navigate().to(driver.getCurrentUrl());
    }
    
    //Click the Add flight button
    @When("^I click the Add flight button$")
    public void i_click_add_flight_button() throws Throwable{
        driver.findElement(By.id("addFlight")).click();
    }
    
//    //Successful cancellation after accepting confirmation
//    @Then("^I should be loaded to Addflight page$")
//    public void I_should_be_loaded_to_Addflight_pagen() throws Throwable {
//        driver.switchTo().alert().accept();
//        System.out.println("Cancellation successful!");
//    }
//    
//    //Unsuccessful cancellation after dismissing confirmation
//    @Then("^I should stay on cancel ticket page when I dismiss confirmation$")
//    public void i_should_stay_on_cancel_ticket_page_when_i_dismiss_confirmation() throws Throwable {
//        driver.switchTo().alert().dismiss();
//        System.out.println("Cancellation unsuccessful.");
//    }
//    
}
