// AppfigurateExampleUITests.m
// AppfigurateExample Copyright© 2017-2024; Electric Bolt Limited.

@import XCTest;
#import "ExampleConfiguration.h"
@import AppfigurateLibrary;

/**
 * Appfigurate can be used to configure an iOS application undergoing UI testing.
 * To setup, you must perform the following in your UI Testing bundle:
 * 1. Link the AppfigurateLibrary static xcframework.
 * 2. Tick on your APLConfiguration subclass in target membership.
 * 3. Ensure your APLConfiguration subclass allowInvalidSignatures method returns YES for a DEBUG build.
 * 4. Optionally add a UIInterruptionMonitor to automatically dismiss the Appfigurate alert, when the configuration is applied.
 * 5. Get an instance of your APLConfiguration subclass and set properties.
 * 6. Apply the resulting configuration to XCUIApplication and launch.
 */

@interface AppfigurateExampleUITests : XCTestCase {
    ExampleConfiguration* config;
    XCUIApplication* app;
}
@end

@implementation AppfigurateExampleUITests

- (void)setUp {
    [super setUp];

    // Automatically dismiss the Appfigurate "Configuration applied" dialog.
    [self addUIInterruptionMonitorWithDescription: @"Appfigurate" handler: ^(XCUIElement *element) {
        if (element.elementType == XCUIElementTypeAlert) {
            if ([element.buttons[@"OK"] exists]) {
                [element.buttons[@"OK"] tap];
                return YES;
            } else if ([element.buttons[@"Ignore"] exists]) {
                [element.buttons[@"Ignore"] tap];
                return YES;
            }
        }
        return NO;
    }];

    config = (ExampleConfiguration*) [APLConfiguration sharedConfiguration];
    app = [XCUIApplication new];
}

- (void)tearDown {
    [super tearDown];
}

- (void)testLaunchReset {
    app.launchArguments = [config automationLaunchArgumentsReset];
    [app launch];
    
    XCUIElement* cell = [app.tables.cells elementBoundByIndex: 0];
    XCUIElement* text = [cell.staticTexts elementBoundByIndex: 1];
    XCTAssertEqualObjects(text.label, @"YES");
}

- (void)testLaunchApplyBooleanValue {
    config.boolean = NO;
    app.launchArguments = [config automationLaunchArguments];
    [app launch];

    XCUIElement* cell = [app.tables.cells elementBoundByIndex: 0];
    XCUIElement* text = [cell.staticTexts elementBoundByIndex: 1];
    XCTAssertEqualObjects(text.label, @"NO");
}

- (void)testLaunchApplyStringTextFieldValue {
    config.string_Textfield = @"thursday";
    app.launchArguments = [config automationLaunchArguments];
    [app launch];

    XCUIElement *cell = [app.tables.cells elementBoundByIndex: 1];
    XCUIElement *text = [cell.staticTexts elementBoundByIndex: 1];
    XCTAssertEqualObjects(text.label, @"thursday");
}

- (void)testLaunchAction {
    app.launchArguments = [config automationLaunchArgumentsWithAction: @"randomIntegers"];
    [app launch];

    XCUIElement* cell = [app.tables.cells elementBoundByIndex: 8];
    XCUIElement* text = [cell.staticTexts elementBoundByIndex: 1];
    // The integer_Slider field should now be equal to some random value other
    // than the default number of 500.
    XCTAssertNotEqualObjects(text.label, @"500");
}

- (void)testSendMessageToApplicationUnderTest {
    app.launchArguments = [config automationLaunchArgumentsReset];
    [app launch];

    // Invokes the APLAutomationMessageReceivedBlock callback in ObjCExample.AppDelegate class. Sets the app's dark mode value to dark.
    APLAutomationSendMessage(@"SetDarkMode", @YES, 3.0);

    // Invokes the APLAutomationMessageReceivedBlock callback in ObjCExample.AppDelegate class. Reads the app's dark mode value.
    XCTAssertTrue([APLAutomationSendMessage(@"GetDarkMode", nil, 3.0) boolValue]);
}

- (void)testApplyAndReadConfiguration {
    app.launchArguments = [config automationLaunchArgumentsWithAction: @"randomIntegers"];
    [app launch];

    // Updates this configuration by reading the configuration from the app under test.
    [config automationSendReadConfiguration];
    
    XCUIElement* cell = [app.tables.cells elementBoundByIndex: 8];
    XCUIElement* text = [cell.staticTexts elementBoundByIndex: 1];
    XCTAssertEqualObjects(text.label, ([NSString stringWithFormat: @"%ld", config.integer_Slider]));

    // Applies this configuration to the app under test.
    config.integer_Slider = 30;
    [config automationSendConfiguration];
    XCTAssertEqualObjects(text.label, @"30");
}

@end
