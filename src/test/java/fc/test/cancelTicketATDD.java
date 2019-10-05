/*
 * Test cancelTicket.jsp using selenium and cucumber acceptance testing (input from cancelTicketFeature.feature
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
    
    //Fill in register.jsp form using input from RegisterFeature.feature
    @When("^I click cancel button$")
    public void i_click_cancel_button(String arg1, String arg2, String arg3, 
            String arg4, String arg5, String arg6) throws Throwable{
        //driver.get("https://arsproject.herokuapp.com/register.jsp");
        //driver.navigate().to(driver.getCurrentUrl());
        
        driver.findElement(By.id("first_name")).sendKeys(arg1);
        driver.findElement(By.id("last_name")).sendKeys(arg2);
        driver.findElement(By.id("email")).sendKeys(arg3);
        driver.findElement(By.id("password")).sendKeys(arg4);
        driver.findElement(By.id("passport")).sendKeys(arg5);
        driver.findElement(By.id("dob")).sendKeys(arg6);
        driver.findElement(By.id("registerBtn")).click(); //PUT TICKET ID IN THE CANCEL BUTTON ID
    }
    
    //Successful registration
    @Then("^I should see registerSuccess page$")
    public void i_should_see_registerSuccess_page() throws Throwable {
        System.out.println("Registration successful!");
        driver.get("https://arsproject.herokuapp.com/registerSuccess.jsp");
        driver.navigate().to(driver.getCurrentUrl());
    }
    
    //Unsuccessful registration
    @Then("^I should stay on register page$")
    public void i_should_stay_on_register_page() throws Throwable {
        System.out.println("Registration unsuccessful! See error messages in test log.");
    }
    
}
