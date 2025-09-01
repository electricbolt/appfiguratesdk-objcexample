// AppDelegate.h
// AppfigurateExample Copyright© 2013-2025; Electric Bolt Limited.

@import AppfigurateLibrary;
@import FirebaseCore;
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

    [self initFirebaseRemoteConfig];
    return YES;
}

- (UISceneConfiguration *) application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
    return [[UISceneConfiguration alloc] initWithName: @"Default Configuration" sessionRole: connectingSceneSession.role];
}

- (void) initFirebaseRemoteConfig {
    [FIRApp configure];
    self.remoteConfig = [FIRRemoteConfig remoteConfig];
    FIRRemoteConfigSettings* remoteConfigSettings = [FIRRemoteConfigSettings new];
    remoteConfigSettings.minimumFetchInterval = 0;
    self.remoteConfig.configSettings = remoteConfigSettings;

    // Set default values for firebase remote config to those from the reset() method of the ExampleConfiguration class.
    [self.remoteConfig setDefaults: [[APLConfiguration sharedConfiguration] remoteDefaults]];

    APLFetchRemoteConfiguration(^NSObject* (NSString* propertyKey, APLRemotePropertyType propertyType, NSObject* defaultValue) {
        if (propertyType == APLRemotePropertyTypeString)
            return [self.remoteConfig configValueForKey: propertyKey].stringValue;
        else if (propertyType == APLRemotePropertyTypeBool)
            return [NSNumber numberWithBool: [self.remoteConfig configValueForKey: propertyKey].boolValue];
        else // APLRemotePropertyTypeInt || APLRemotePropertyTypeDouble
            return [self.remoteConfig configValueForKey: propertyKey].numberValue;
    });

    __weak __typeof__(self) weakSelf = self;
    [self.remoteConfig fetchWithCompletionHandler: ^(FIRRemoteConfigFetchStatus status, NSError* error) {
        if (status == FIRRemoteConfigFetchStatusSuccess) {
            __typeof__(self) strongSelf = weakSelf;
            [strongSelf.remoteConfig activateWithCompletion: ^(BOOL changed, NSError* error) {
                if (error == nil) {
                    NSLog(@"Remote config updated keys");
                    APLFlushRemoteConfiguration();
                }
            }];
        }
    }];
    [self.remoteConfig addOnConfigUpdateListener: ^(FIRRemoteConfigUpdate* configUpdate, NSError* error) {
        if (error == nil) {
            __typeof__(self) strongSelf = weakSelf;
            [strongSelf.remoteConfig activateWithCompletion: ^(BOOL changed, NSError* error) {
                if (error == nil) {
                    NSLog(@"Remote config updated keys");
                    APLFlushRemoteConfiguration();
                }
            }];
        }
    }];
}
@end
