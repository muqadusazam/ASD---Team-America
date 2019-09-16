/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fc.test;

/**
 *
 * @author Liam
 */

import org.openqa.selenium.By;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.firefox.FirefoxDriver;
import io.github.bonigarcia.wdm.WebDriverManager;
import org.junit.Assert;
import org.openqa.selenium.support.ui.Select;

public class RescheduleFeature {
    WebDriver driver;
    private String page = "http://localhost:8080/ASD---Team-America"; //https://arsproject.herokuapp.com/
    
    private void initiateInstance() throws Throwable {
        Class<? extends WebDriver> driverClass = FirefoxDriver.class;
        WebDriverManager.getInstance(driverClass).setup();
        driver = driverClass.newInstance();
    }
    
    //Sets starting page to reschedule.jsp
    @Given("^I am on reschedule page$")
    public void i_am_on_reschedule_page() throws Throwable{
        initiateInstance();
        driver.get(page + "/reschedule.jsp");
        driver.navigate().to(driver.getCurrentUrl());
        Assert.assertEquals("Flight Center/account/reschedule", driver.getTitle());
        System.out.println("Given statement executed successfully!");
    }

    //Successful reschedule
    @When("^I select a valid Flight$")
    public void select_new_flight() throws Throwable {
        Select dropdown = new Select(driver.findElement(By.id("newFlight")));
        dropdown.selectByValue("5");
        driver.findElement(By.id("rescheduleBtn")).click();
    }
    
    @Then("^I should stay on the reschedule page$")
    public void i_should_stay_on_reschedule_page() throws Throwable {
        System.out.println("Reschedule successful!");
        Assert.assertEquals("Flight Center/account/reschedule", driver.getTitle());
    }
    
    //Unsuccessful reschedule
    @When("^I select a invalid Flight$")
    public void select_invalid_flight() throws Throwable {
        Select dropdown = new Select(driver.findElement(By.id("newFlight")));
        dropdown.selectByValue("3");
        driver.findElement(By.id("rescheduleBtn")).click();
    }
    
    @Then("^I should stay on reschedule page$")
    public void i_should_stay_on_register_page() throws Throwable {
        System.out.println("Reschedule unsuccessful!");
        Assert.assertEquals("Flight Center/account/reschedule", driver.getTitle());
    }
    
}
