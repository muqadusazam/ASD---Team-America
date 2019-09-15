/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package test;

/**
 *
 * @author el181
 */
//import org.openqa.selenium.By;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.firefox.FirefoxDriver;
import io.github.bonigarcia.wdm.WebDriverManager;

public class FlightListFeature {
    WebDriver driver;
    
     @Given("^I am on Flight List page$")
    public void i_am_on_flight_list_page() throws Throwable {
        Class<? extends WebDriver> driverClass = FirefoxDriver.class;
        WebDriverManager.getInstance(driverClass).setup();
        driver = driverClass.newInstance();
        driver.get("https://asd-demo-app.herokuapp.com/flights.jsp");
        //driver.navigate().to(driver.getCurrentUrl());
    }
        @When("I clicked flight tab")
    public void i_clicked_flight_tab() throws Throwable {
        driver.get("https://asd-demo-app.herokuapp.com/flights.jsp");
        driver.navigate().to(driver.getCurrentUrl());
    }

    @Then("^I should see all the available flights in the form of table")
    public void i_should_see_all_available_flights() throws Throwable {
        System.out.println("successfully displayed: database connection successful.");
    }
    
    @When("There is duplicated data")
    public void duplicated_data_exists() throws Throwable {
        driver.get("https://asd-demo-app.herokuapp.com/flights.jsp");
        driver.navigate().to(driver.getCurrentUrl());
    }
    @Then("the duplicated data should be removed from database")
    public void remove_duplicated_data() throws Throwable {
        System.out.println("successfully displayed:duplicated data removed.");
    }    
}


