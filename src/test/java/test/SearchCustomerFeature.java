/*
 * Test register.jsp using selenium and cucumber acceptance testing (input from RegisterFeature.feature
 * Run RunTest.java (right click file > Test File) to see if acceptance testing is working
 */
package test;

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
import org.junit.Assert;

public class SearchCustomerFeature {

    WebDriver driver;

    //Login to flight centre
    @Given("^I log in \"([^\"]*)\" and \"([^\"]*)\"$")
    public void i_log_in_as(String arg1, String arg2) throws Throwable {
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

    //Navigate to user management page
    @Then("^I go to User Management page")
    public void i_go_to_User_Management_page() throws Throwable {
        driver.get("https://arsproject.herokuapp.com/user_management.jsp");
        driver.navigate().to(driver.getCurrentUrl());
        System.out.println("Then statement executed successfully!");
    }

    //Searching for william in user_management
    @When("^I fill in \"([^\"]*)\"$")
    public void i_fill_in(String arg1) throws Throwable {
        driver.findElement(By.id("inputSearch")).sendKeys(arg1);
        driver.findElement(By.id("searchBtn")).click();
    }

    //Valid Search Result
    @Then("^I should see user management page with user William$")
    public void i_should_see_user_management_page_with_user_William() throws Throwable {
        Assert.assertTrue(driver.getPageSource().contains("William"));
        System.out.println("Search found! Valid search result.");
    }
    //Invalid search 
    @Then("^I should see error message for invalid search result")
    public void i_should_see_error_message_for_invalid_search_result() throws Throwable {
        Assert.assertTrue("Invalid search input!", driver.getPageSource().contains("Invalid search input!"));
        System.out.println("Search not found! Invalid search result!");
    }

}
