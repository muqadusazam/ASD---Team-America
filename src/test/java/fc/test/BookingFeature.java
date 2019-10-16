/*
 * Test booking.jsp using selenium and cucumber acceptance testing (input from BookingFeature.feature
 * Run RunTest.java (right click file > Test File) to see if acceptance testing is working
 */
package fc.test;

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
    
    //Navigate to flights ticket page
    @Then("^I go on the \"([^\"]*)\" page on URL \"([^\"]*)\"$")
    public void i_go_to_flights_page(String arg1, String arg2) throws Throwable{
        driver.get("https://arsproject.herokuapp.com/flights.jsp");
        driver.navigate().to(driver.getCurrentUrl());
    }
    
    //Click the cancel button for a ticket
    @When("^I select a valid Flight$")
    public void i_click_cancel_button_of_ticket() throws Throwable{
        driver.findElement(By.id("flightID1013")).click();
    }
    
    //Successful cancellation after accepting confirmation
    @Then("^I should see cancelTicketConfirm page when I accept confirmation$")
    public void i_should_see_cancelTicketConfirm_page_when_i_accept_confirmation() throws Throwable {
       
        String expectedMessage = "Your ticket has been successfully booked.";
        String message = driver.findElement(By.xpath("//div[contains(@class,'text text-success')]")).getText();
        Assert.assertTrue("Your ticket has been successfully booked.", message.contains(expectedMessage));
        System.out.println("Rebooking successful!");
    }

}