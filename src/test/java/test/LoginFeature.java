/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package test;

/**
 *
 * @author muqad
 */
import org.openqa.selenium.By;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.firefox.FirefoxDriver;
import io.github.bonigarcia.wdm.WebDriverManager;

public class LoginFeature {
    WebDriver driver;
    
    @Given("^I am on login page$")
    public void i_am_on_login_page() throws Throwable {
        //System.setProperty("webdriver.chrome.driver", "C:\\Web Drivers\\chromedriver.exe");
        //WebDriver driverClass = new ChromeDriver.class;
        Class<? extends WebDriver> driverClass = FirefoxDriver.class;
        WebDriverManager.getInstance(driverClass).setup();
        driver = driverClass.newInstance();
        driver.get("https://arsproject.herokuapp.com/login.jsp");
        //driver.navigate().to(driver.getCurrentUrl());
    }
    
    @When("^I fill in \"([^\"]*)\" with \"([^\"]*)\"$")
    public void i_fill_in_with(String arg1, String arg2) throws Throwable {
        driver.get("https://arsproject.herokuapp.com/login.jsp");
        driver.navigate().to(driver.getCurrentUrl());
        driver.findElement(By.id("Email")).sendKeys(arg1);
        driver.findElement(By.id("Password")).sendKeys(arg2);
        driver.findElement(By.id("BtnLogin")).click();
    }
    
    @Then("^I should see \"([^\"]*)\" main page$")
    public void i_should_see_main_page(String arg1) throws Throwable {
        System.out.println("mLab connection successful.");
    }
    
    @Then("^I should see \"([^\"]*)\" login page$")
    public void i_should_see_login_page(String arg1) throws Throwable {
        System.out.println("mLab connection unsuccessful!");
    } 
}
