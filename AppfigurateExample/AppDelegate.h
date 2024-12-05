// AppDelegate.m
// RemoteConfigTest Copyright© 2023; Electric Bolt Limited.

@import UIKit;
@import FirebaseCore;
@import FirebaseRemoteConfig;

#define APPDELEGATE ((AppDelegate*) [UIApplication sharedApplication].delegate)

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) FIRRemoteConfig* remoteConfig;

@end
