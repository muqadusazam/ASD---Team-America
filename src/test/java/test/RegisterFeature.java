/*
 * Test register.jsp using selenium and cucumber acceptance testing (input from RegisterFeature.feature
 * Run RunTest.java (right click file > Test File) to see if acceptance testing is working
 */
package test;

/**
 *
 * @author kelvin
 */
import org.openqa.selenium.By;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.firefox.FirefoxDriver;
import io.github.bonigarcia.wdm.WebDriverManager;

public class RegisterFeature {
    
    WebDriver driver;
    
    //Sets starting page to register.jsp
    @Given("^I am on register page$")
    public void i_am_on_register_page() throws Throwable{
        Class<? extends WebDriver> driverClass = FirefoxDriver.class;
        WebDriverManager.getInstance(driverClass).setup();
        driver = driverClass.newInstance();
        driver.get("https://arsproject.herokuapp.com/register.jsp");
        driver.navigate().to(driver.getCurrentUrl());
        System.out.println("Given statement executed successfully!");
    }
    
    //Fill in register.jsp form using input from RegisterFeature.feature
    @When("^I fill in with \"([^\"]*)\" and \"([^\"]*)\" and \"([^\"]*)\" "
            + "and \"([^\"]*)\" and \"([^\"]*)\" and \"([^\"]*)\"$")
    public void i_fill_in_with(String arg1, String arg2, String arg3, 
            String arg4, String arg5, String arg6) throws Throwable{
        //driver.get("https://arsproject.herokuapp.com/register.jsp");
        //driver.navigate().to(driver.getCurrentUrl());
        driver.findElement(By.id("first_name")).sendKeys(arg1);
        driver.findElement(By.id("last_name")).sendKeys(arg2);
        driver.findElement(By.id("email")).sendKeys(arg3);
        driver.findElement(By.id("password")).sendKeys(arg4);
        driver.findElement(By.id("passport")).sendKeys(arg5);
        driver.findElement(By.id("dob")).sendKeys(arg6);
        driver.findElement(By.id("registerBtn")).click();
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
