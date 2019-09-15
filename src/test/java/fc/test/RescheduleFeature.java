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
public class RescheduleFeature {
    WebDriver driver;
    
    //Sets starting page to reschedule.jsp
    @Given("^I am on reschedule page$")
    public void i_am_on_register_page() throws Throwable{
        Class<? extends WebDriver> driverClass = FirefoxDriver.class;
        WebDriverManager.getInstance(driverClass).setup();
        driver = driverClass.newInstance();
        driver.get("https://arsproject.herokuapp.com/reschedule.jsp");
        driver.navigate().to(driver.getCurrentUrl());
        System.out.println("Given statement executed successfully!");
    }
}
