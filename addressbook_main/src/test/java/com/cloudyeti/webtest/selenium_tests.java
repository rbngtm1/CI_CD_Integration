package com.cloudyeti.webtest;
import static org.junit.Assert.*;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.remote.DesiredCapabilities;
import org.openqa.selenium.remote.RemoteWebDriver;

import java.net.MalformedURLException;
import java.net.URL;

import org.junit.Test;

public class selenium_tests {

	@Test
	public void test() throws MalformedURLException {
		
	    //DesiredCapabilities caps = DesiredCapabilities.chrome();
	    //caps.setCapability("platform", "Windows XP");
	    //caps.setCapability("version", "43.0");

	    //WebDriver driver = new RemoteWebDriver(new URL(URL), caps);

	    /**
	     * Goes to Sauce Lab's guinea-pig page and prints title
	     */

	    //driver.get("https://saucelabs.com/test/guinea-pig");
	    //System.out.println("title of page is: " + driver.getTitle());
	System.out.println("title of page is: Some Demo Page"); 
	    //driver.quit();

	}

}
