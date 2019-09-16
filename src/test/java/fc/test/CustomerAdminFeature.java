/*
 * Test register.jsp using selenium and cucumber acceptance testing (input from RegisterFeature.feature
 * Run RunTest.java (right click file > Test File) to see if acceptance testing is working
 */
package fc.test;

/**
 *
 * @author william
 */
import org.openqa.selenium.By;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.firefox.FirefoxDriver;
import io.github.bonigarcia.wdm.WebDriverManager;

public class CustomerAdminFeature {
    
    WebDriver driver;
    
    //Sets starting page to register.jsp
    @Given("^I am on Add Customer page$")
    public void i_am_on_Add_Customer_page() throws Throwable{
        Class<? extends WebDriver> driverClass = FirefoxDriver.class;
        WebDriverManager.getInstance(driverClass).setup();
        driver = driverClass.newInstance();
        driver.get("https://arsproject.herokuapp.com/userAdd_management.jsp");
        driver.navigate().to(driver.getCurrentUrl());
        System.out.println("Given statement executed successfully!");
    }
    
    //Fill in register.jsp form using input from RegisterFeature.feature
    @When("^I fill in \"([^\"]*)\" and \"([^\"]*)\" and \"([^\"]*)\" "
            + "and \"([^\"]*)\" and \"([^\"]*)\" and \"([^\"]*)\"$")
    public void i_fill_in(String arg1, String arg2, String arg3, 
            String arg4, String arg5, String arg6) throws Throwable{
        //driver.get("https://arsproject.herokuapp.com/register.jsp");
        //driver.navigate().to(driver.getCurrentUrl());
        driver.findElement(By.id("inputFirstName")).sendKeys(arg1);
        driver.findElement(By.id("inputLastName")).sendKeys(arg2);
        driver.findElement(By.id("inputEmail")).sendKeys(arg3);
        driver.findElement(By.id("inputPassword")).sendKeys(arg4);
        driver.findElement(By.id("inputPassport")).sendKeys(arg5);
        driver.findElement(By.id("inputDOB")).sendKeys(arg6);
        driver.findElement(By.id("registerButton")).click();
    }
    
    //Successful registration
    @Then("^I should see user_management page$")
    public void i_should_see_user_management_page() throws Throwable {
        System.out.println("Registration successful!");
        driver.get("https://arsproject.herokuapp.com/user_management.jsp");
        driver.navigate().to(driver.getCurrentUrl());
    }
    
    //Unsuccessful registration
    @Then("^I should stay on userAdd_management page$")
    public void i_should_stay_on_userAdd_management_page() throws Throwable {
        System.out.println("Registration unsuccessful! See error messages in test log.");
    }
    
}
