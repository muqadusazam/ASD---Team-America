//This file will run all feature (acceptance) tests, not unit tests
//Need to install Cucumber plugin and load pom.xml file for tests to run

package fc.test;

/**
 *
 * @author kelvin
 */
import cucumber.api.CucumberOptions;
import cucumber.api.junit.Cucumber;
import org.junit.runner.RunWith;

@RunWith(Cucumber.class)
@CucumberOptions(plugin = {"pretty", "json:target/cucumber.json"},
                features={"features"})
public class RunTest {
}
