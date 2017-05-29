# Appium up & running with Robot Framework

#https://git.heyday.net.nz/heyday/automation

Appium is a client/server architecture.
Client is used to run the test cases.
Server is used to run the Appium Server.
The mobile devices or the emulators are required to run the tests against the app which we are testing.

## Client Setup
### 1. Python:

Required for Robot Framework. Nothing to be done, python is present by default on OSX.
---install pip
### 2. Robot Framework:
Robot Framework is a generic test automation framework for writing test cases.

	pip install robotframework
	pip install --upgrade robotframework

For more details for installing Robot Framework, please refer <https://github.com/robotframework/robotframework/blob/master/INSTALL.rst>

### 3. Appium Library for Robot Framework:
Appium Library is a app testing library for Robot Framework.

	pip install robotframework-appiumlibrary

Details on Appium related keywords in Robot framework is available at <http://jollychang.github.io/robotframework-appiumlibrary/doc/AppiumLibrary.html>

## Server Setup
### 1. Appium Server
Appium is an open source test automation framework for use with native, hybrid and mobile web. Appium is the selenium for mobile apps.
For more details, please go to the website <http://appium.io>

For installation, follow the below steps.

	> brew install node      # get node.js

	> npm install -g appium  # get appium

	> npm update -g appium  # update appium

	> npm install wd         # get appium client

	> appium &               # start appium

To check if the appium service has started, check with the below command & the socket needs to be in Listening mode.

--- Install Appium UI


	netstat -an | grep 4723

### 2. Java JDK
Install the latest java idk. Google for ‘java idk download’ & install the latest jdk. This is a prerequisite for installing Android SDK.

Download link at the time of writing: <http://www.oracle.com/technetwork/java/javase/downloads/index-jsp-138363.html<=>

### 3. Android SDK
Install the latest Android SDK from <http://developer.android.com/sdk/index.html>

After installing the SDK, you need to set ANDROID_HOME to be our Android SDK path and add the tools and platform-tools folders to your PATH variable.

You need to add the below 2 lines in your ~/.bash_profile file and restart the terminal.

Just make sure you add the correct path of Android SDK. In my case the path is /usr/local/opt/android-sdk/

	export ANDROID_HOME=/usr/local/opt/android-sdk
	export PATH=${PATH}:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools

### 4. IOS setup
 If you have iOS 10.x/Xcode 8.x, then you need to have appium 1.6.x installed. This version of appium has support for Apple’s new XCUITest framework. You can google more on the framework or details are available at <https://discuss.appium.io/t/appium-1-6-0-released/12661>

#### 4.1. Required versions:

	iOS – 10.x

	Xcode – 8.x

	Appium – 1.6.x

The above versions will use the XCUITest framework by default.

Unlike Android apps, you cannot start testing or automating any Enterprise app, i.e. if you want to open Twitter or Facebook iOS app through appium, then that’s not possible. The .ipa file needs to be signed with a Development provisioning profile or cert. So, if you want to be  automate say a any ios app, then you would need an id with valid Development provisioning profile & authenticated against valid apple id.

More details on the signing process for the iOS apps can be found here.
<https://gigaom.com/2015/02/07/how-ios-developers-use-code-signing-to-get-their-apps-on-iphones/>

#### 4.2.Setting up appium-xcuitest-driver
Some of the external dependencies required for appium to work.

	> brew install ideviceinstaller
	> brew install carthage
	> npm install -g ios-deploy
	> npm install -g deviceconsole
	> gem install xcpretty
	> brew install libimobiledevice --HEAD
All the above commands should get installed without errors. If there are errors, try executing with sudo.
Run the below command to check if all the appium dependencies are installed properly.

	appium-doctor
If appium-doctor is not installed, you can install it using the command

	npm install -g appium

More detail of this driver is available at <https://github.com/appium/appium-xcuitest-driver>
#### 4.3. Setting up Webdriver Agent.


Below is a snapshot taken from <https://github.com/facebook/WebDriverAgent>
WebDriverAgent is a WebDriver server implementation for iOS that can be used to remote control iOS devices. It allows you to launch & kill applications, tap & scroll views or confirm view presence on a screen. This makes it a perfect tool for application end-to-end testing or general purpose device automation. It works by linking XCTest.framework and calling Apple’s API to execute commands directly on a device. WebDriverAgent is developed and used at Facebook for end-to-end testing and is successfully adopted by Appium.

	> cd /usr/local/lib/node_modules/appium/node_modules/appium-xcuitest-driver/WebDriverAgent/

	> ./Scripts/bootstrap.sh

	> open -a Xcode WebDriverAgent.xcodeproj
	**This might fail if you dont have write premission on the file, give write premission using chmod**

	> Click on WebDriverAgentLib & sign with your Development Provisioning profile or for now use your personal profile.

	> Click on WebDriverAgentRunner & sign in using your profile.
	**You might see an error in Provisioning Profile & Signing Certificate. Ignore it till you make changes in the next step.**

	> Click on Build Settings & change the Product Bundle Identifier from it’s default to any other name.

	> Now go back to General, the errors you had in the previous step should not be there.

	>Now clicking on both WebDriverAgentLib & WebDriverAgentRunner, you need to build it once & check if everything is working fine. The build should succeed in both the cases.

	> Click on IntegrationApp & sign in using your profile & change the name of the Bundle Identifier from it’s default.

	> With all the steps completed, if you make a build on any of the simulators, then the app should open in the simulator.


## Device Setup
### Android
The prerequisite is to enable Developer options & enable USB debugging in your Android phone.
Run the below command to check the mobile devices connected.

	 adb devices
Run the below command to check the app packages installed in the mobile device

	adb shell pm list packages -f
Check if appium server is up & running

	netstat -an | grep 4723

### IOS
Make sure ios simulator is running from xcode

## Sample Robot Framework Test case

Check the demo for Android : <https://git.heyday.net.nz/heyday/automation/blob/master/tests/demo-android.txt>

Check the demo for IOS : <https://git.heyday.net.nz/heyday/automation/blob/master/tests/demo-ios.txt>

## How to run the test case?

	pybot tests/demo-android.txt

## Results

Log file, reports and output files are generated under root directory.

	log.html
	output.xml
	report.html

