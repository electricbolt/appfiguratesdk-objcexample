// ExampleConfiguration.h
// RemoteConfigTest Copyright© 2023; Electric Bolt Limited.

@import Foundation;
#import "Appfigurate.h"

@interface ExampleConfiguration : APLConfiguration

// Local properties

@property(nonatomic, assign) BOOL boolean;

@property(nonatomic, strong) NSString *string_Textfield;
@property(nonatomic, strong) NSString *string_RegexTextfield;
@property(nonatomic, strong) NSString *string_List;
@property(nonatomic, strong) NSString *string_Textfield_List;
@property(nonatomic, strong) NSString *string_RegexTextfield_List;
@property(nonatomic, strong) NSString *encrypted_string_Textfield_List;
@property(nonatomic, strong) NSString *encrypted_string_RegexTextfield_List;

@property(nonatomic, assign) NSInteger integer_Slider;
@property(nonatomic, assign) NSInteger integer_Textfield;
@property(nonatomic, assign) NSInteger integer_RegexTextfield;
@property(nonatomic, assign) NSInteger integer_List;
@property(nonatomic, assign) NSInteger integer_Textfield_List;
@property(nonatomic, assign) NSInteger integer_RegexTextfield_List;

@property(nonatomic, assign) float float_Slider;
@property(nonatomic, assign) float float_Textfield;
@property(nonatomic, assign) float float_RegexTextfield;
@property(nonatomic, assign) float float_List;
@property(nonatomic, assign) float float_Textfield_List;
@property(nonatomic, assign) float float_RegexTextfield_List;

@property(nonatomic, assign) double double_Slider;
@property(nonatomic, assign) double double_Textfield;
@property(nonatomic, assign) double double_RegexTextfield;
@property(nonatomic, assign) double double_List;
@property(nonatomic, assign) double double_Textfield_List;
@property(nonatomic, assign) double double_RegexTextfield_List;

// Remote properties

@property(nonatomic, assign) BOOL alwaysDarkMode;
@property(nonatomic, strong) NSString* appTitle;
@property(nonatomic, assign) double fontSize;
@property(nonatomic, assign) NSInteger bookingDuration;

@end
