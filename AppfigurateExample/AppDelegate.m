// AppDelegate.h
// AppfigurateExample Copyright© 2013-2024; Electric Bolt Limited.

@import AppfigurateLibrary;
#import "AppDelegate.h"
#import "ExampleViewController.h"

@implementation AppDelegate

- (BOOL) application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options {
    return APLApplicationOpenURL(url);
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    APLApplicationDidFinishLaunchingWithOptions(launchOptions);
    
#if DEBUG
    // Allows XCUITest automation test cases to invoke functionality and return results from the app under test.
    APLAutomationMessageReceivedBlock(^id _Nullable(NSString * _Nonnull message, id  _Nullable plist) {
        UIWindow* window;
        for (window in [UIApplication sharedApplication].windows) {
            if ([window isKeyWindow])
                break;
        }
            
        if ([message isEqualToString: @"SetDarkMode"]) {
            window.overrideUserInterfaceStyle = [plist boolValue] ? UIUserInterfaceStyleDark : UIUserInterfaceStyleLight;
        } else if ([message isEqualToString: @"GetDarkMode"]) {
            return [NSNumber numberWithBool: window.traitCollection.userInterfaceStyle == UIUserInterfaceStyleDark];
        }
        return nil;
    });
#endif
    return YES;
}

- (UISceneConfiguration *) application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
    return [[UISceneConfiguration alloc] initWithName: @"Default Configuration" sessionRole: connectingSceneSession.role];
}

@end
