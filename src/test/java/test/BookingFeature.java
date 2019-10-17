/*
 * Test booking.jsp using selenium and cucumber acceptance testing (input from BookingFeature.feature
 * Run RunTest.java (right click file > Test File) to see if acceptance testing is working
 */
package test;

import org.openqa.selenium.By;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.firefox.FirefoxDriver;
import io.github.bonigarcia.wdm.WebDriverManager;
import org.junit.Assert;

public class BookingFeature{
    
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
    
    //Navigate to flights page
    @Then("^I go on the \"([^\"]*)\" page on URL \"([^\"]*)\"$")
    public void i_go_to_flights_page(String arg1, String arg2) throws Throwable{
        driver.get("https://arsproject.herokuapp.com/flights.jsp");
        driver.navigate().to(driver.getCurrentUrl());
    }
    
    //Click button to book specific flight 
    @When("^I select a valid Flight$")
    public void i_click_cancel_button_of_ticket() throws Throwable{
        driver.findElement(By.id("flightID1013")).click();
    }
    
    //Check if booking details is shown
    @Then("^I see my booking details$")
    public void i_see_booking_details() throws Throwable{
        Assert.assertTrue(driver.getPageSource().contains("1013"));
    }
    
    //Click submit button to add ticket
    @Then("^I click the submit button$")
    public void click_submit() throws Throwable{
        driver.findElement(By.id("submitBtn")).click();
    }
    
    //Successful confirmation of ticket booking
    @Then("^I should see a message confirming successful booking$")
    public void i_should_see_booking_confirmation() throws Throwable {
        Assert.assertTrue("Text not found!", driver.getPageSource().contains("Your ticket has been successfully booked."));
        System.out.println("Rebooking successful!");
    }
    
    //Unsuccessful confirmation of ticket booking
    @Then("^I should see a message confirming unsuccessful booking$")
    public void i_should_see_error_confirmation() throws Throwable {
        Assert.assertTrue("Text not found!", driver.getPageSource().contains("You already have this flight booked"));
        System.out.println("Rebooking successful!");
    }
}