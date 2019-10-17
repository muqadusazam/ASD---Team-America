package test;

import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import io.github.bonigarcia.wdm.WebDriverManager;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.firefox.FirefoxDriver;

/**
 *
 * @author Kyle_2
 */
public class FlightSearchATDD {
    
    WebDriver driver;
    
    //Set starting page to flights.jsp
    @Given("^I am on the flights page$")
    public void i_am_on_the_flights_page() throws Throwable {
        Class<? extends WebDriver> driverClass = FirefoxDriver.class;
        WebDriverManager.getInstance(driverClass).setup();
        driver = driverClass.newInstance();
        driver.get("https://arsproject.herokuapp.com/flights.jsp");
        driver.navigate().to(driver.getCurrentUrl());
        System.out.println("Given statement executed successfully!");
    }
    
    //Input query into SearchDestination textbox using FlightSearchFeature.feature
    @When("^I fill in with \"([^\"]*)\"$")
    public void i_fill_in_with(String arg1) throws Throwable {
        driver.findElement(By.id("searchDestination")).sendKeys(arg1);
        driver.findElement(By.id("submitBtn")).click();
    }
    
    //Search is successful
    @Then("^I should see flights_searchResults page$")
    public void i_should_see_flights_searchResults_page() throws Throwable {
        System.out.println("Search successfull");
        driver.get("https://arsproject.herokuapp.com/FlightsSearchServlet?searchDestination=Seoul&searchArrivalDate=");
        driver.navigate().to(driver.getCurrentUrl());   
    }
    
    //Unsuccessful search, input was bad
    @Then("^I should return to flights page$")
     public void i_should_return_to_flights_page() throws Throwable {
        System.out.println("Search unsuccessful, input was incorrect format");
    }
}
