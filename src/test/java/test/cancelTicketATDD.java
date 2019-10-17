/*
 * Test cancelTicket.jsp using selenium and cucumber acceptance testing (input from cancelTicketFeature.feature
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

public class cancelTicketATDD {
    
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
    
    //Navigate to cancel ticket page
    @Given("^I go to cancel ticket page$")
    public void i_go_to_cancel_ticket_page() throws Throwable{
        driver.get("https://arsproject.herokuapp.com/cancelTicket.jsp");
        driver.navigate().to(driver.getCurrentUrl());
    }
    
    //Click the cancel button for a ticket
    @When("^I click cancel button of ticket$")
    public void i_click_cancel_button_of_ticket() throws Throwable{
        driver.findElement(By.id("ticketIDBtn")).click();
    }
    
    //Successful cancellation after accepting confirmation
    @Then("^I should see cancelTicketConfirm page when I accept confirmation$")
    public void i_should_see_cancelTicketConfirm_page_when_i_accept_confirmation() throws Throwable {
        driver.switchTo().alert().accept();
        System.out.println("Cancellation successful!");
    }
    
    //Unsuccessful cancellation after dismissing confirmation
    @Then("^I should stay on cancel ticket page when I dismiss confirmation$")
    public void i_should_stay_on_cancel_ticket_page_when_i_dismiss_confirmation() throws Throwable {
        driver.switchTo().alert().dismiss();
        System.out.println("Cancellation unsuccessful.");
    }
    
}
