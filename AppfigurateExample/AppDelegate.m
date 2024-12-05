// AppDelegate.h
// RemoteConfigTest Copyright© 2023; Electric Bolt Limited.

#import "Appfigurate.h"
#import "AppDelegate.h"
#import "ExampleViewController.h"
@import FirebaseCore;

@implementation AppDelegate

- (BOOL) application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options {
    return APLApplicationOpenURL(url);
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    NSLog(@"application:didFinishLaunchingWithoptions:");
    [FIRApp configure];
    
    // Configure firebase remote config.
    self.remoteConfig = [FIRRemoteConfig remoteConfig];
    FIRRemoteConfigSettings* remoteConfigSettings = [FIRRemoteConfigSettings new];
    remoteConfigSettings.minimumFetchInterval = 0;
    self.remoteConfig.configSettings = remoteConfigSettings;
    
    // Set default values for firebase remote config to those from the reset() method of the ExampleConfiguration class.
    [self.remoteConfig setDefaults: [[APLConfiguration sharedConfiguration] remoteDefaults]];

    APLFetchRemoteConfiguration(^NSObject* (NSString* propertyKey, APLRemotePropertyType propertyType, NSObject* defaultValue) {
        if (propertyType == APLRemotePropertyTypeString)
            return [self.remoteConfig configValueForKey: propertyKey].stringValue;
        else if (propertyType == APLRemotePropertyTypeBoolean)
            return [NSNumber numberWithBool: [self.remoteConfig configValueForKey: propertyKey].boolValue];
        else // APLRemotePropertyTypeInt || APLRemotePropertyTypeDouble
            return [self.remoteConfig configValueForKey: propertyKey].numberValue;
    });
    
    NSLog(@"invoking APLApplicationDidFinishLaunchingWithOptions");
    APLApplicationDidFinishLaunchingWithOptions(launchOptions);
    
    __weak __typeof__(self) weakSelf = self;
    [self.remoteConfig fetchWithCompletionHandler: ^(FIRRemoteConfigFetchStatus status, NSError* error) {
        if (status == FIRRemoteConfigFetchStatusSuccess) {
            NSLog(@"Config fetched!");

            __typeof__(self) strongSelf = weakSelf;
            [strongSelf.remoteConfig activateWithCompletion: ^(BOOL changed, NSError* error) {
                if (error != nil) {
                    NSLog(@"Activate error: %@", error.localizedDescription);
                } else {
                    APLFlushRemoteConfiguration();
                }
            }];
        } else {
            NSLog(@"Config not fetched");
            NSLog(@"Error %@", error.localizedDescription);
        }
    }];
    
    // Optional - Firebase remote config realtime updates.
    [self.remoteConfig addOnConfigUpdateListener: ^(FIRRemoteConfigUpdate* configUpdate, NSError* error) {
        if (error == nil) {
            NSLog(@"Config fetched! updated keys %@", configUpdate.updatedKeys);
            
            __typeof__(self) strongSelf = weakSelf;
            [strongSelf.remoteConfig activateWithCompletion: ^(BOOL changed, NSError* error) {
                if (error != nil) {
                    NSLog(@"Activate error: %@", error.localizedDescription);
                } else {
                    APLFlushRemoteConfiguration();
                }
            }];
        } else {
            NSLog(@"Config not fetched");
            NSLog(@"Error %@", error.localizedDescription);
        }
    }];
    
    return YES;
}

- (UISceneConfiguration *) application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options API_AVAILABLE(ios(13.0)) {
    return [[UISceneConfiguration alloc] initWithName: @"Default Configuration" sessionRole: connectingSceneSession.role];
}

@end
