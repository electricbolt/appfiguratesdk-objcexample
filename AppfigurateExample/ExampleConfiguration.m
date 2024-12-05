// ExampleConfiguration.m
// RemoteConfigTest Copyright© 2023; Electric Bolt Limited.

#import "ExampleConfiguration.h"

@implementation ExampleConfiguration

// MARK: - Bool

BOOL_PROPERTY(boolean, @"BOOL - Boolean YES or NO", NO);

// MARK: - String

STRING_PROPERTY_EDIT(string_Textfield, @"", @"NSString - textfield", YES);
STRING_PROPERTY_EDIT(string_RegexTextfield, @"b[aeiou]t", @"NSString - textfield with regex", NO);
STRING_PROPERTY_LIST(string_List, @"NSString - fixed list", NO, @{@"Small":@"sm", @"Medium":@"md", @"Large":@"lg"});
STRING_PROPERTY_LIST_EDIT(string_Textfield_List, @"", @"NSString - textfield, customizable list", NO, @{@"Red":@"r", @"Green":@"g", @"Blue":@"b"});
STRING_PROPERTY_LIST_EDIT(string_RegexTextfield_List, @"https://[\\w\\.-]+\\.electricbolt.co.nz/.*", @"NSString - textfield with regex, customizable list", NO, @{@"Dev":@"https://dev.electricbolt.co.nz/list", @"Test":@"https://test.electricbolt.co.nz/list", @"Prod":@"https://m.electricbolt.co.nz/list"});

// MARK: - Encrypted String

ENCRYPTED_STRING_PROPERTY_LIST_EDIT(encrypted_string_Textfield_List, @"", @"encrypted NSString - textfield, customizable list", NO, @{
    @"Red":ENCRYPTED_STRING(@"r",@"3/iZZ1Gv8EniGIkIoUzLdJI8SN8tGjus/jGanA6kRM+afnCJYI4E/6Nc1CWK7eIAJBuZRceU6rtlY/OPTSubV4kLQkf/I4gN4pdrC0T8wZSI6uq7xSWk3nfGG6Ujh5sopOpvseCfg+TaTCfYgEgBwlCuxKZICMNH36BZT41v14foSG8AiGjXVcyQ1eYhY9SxQSd8ZsrQhUyyVcInsuJP3GK20yOg2yQjsbOHD3OfkI+adP5M7Y3B7oC/1sPz+CK2ZNhnOMSTeIl3NpfH6YhSkg2Oh5GTZI2cNAGYxPVTgF6/oCCmky8pgZwQFkh7KKqlKKWEB8Mec5emzr2I3IFF8nNQcsX0ck2sGNClqWXY3ysB"),
    @"Green":ENCRYPTED_STRING(@"g",@"PkQfHwaWmK94u9eB9mCfWmOk/vOIOacKivt1lptgJbUzUl2e8pmRnSVLkCeYxoSjPgKEx94t6e/BRhtgMbZyXoo2usUH5jdxaA8HkoUtR4VuMHuZ4Gla+kyuNg1Ki6LC+xAD++dESITzX4EqCCCfVV/qv5u5c9NJYrc7TwNN8bXtVJ6+8hEQeWXdk/05p0wCDjx8hIl+wfmjbKOYwl35mQMW/4EM7SEYFqExxMsR/dcHJG4X0Mw03hEfdqL9nk0anMEyx8ez03WmR8TiZg4UqpbARr6i8IUYx6pMr2ZJjQUzllvTxGpT84VetpN1tvp/Ys+ygtOODZuSp3MjpG0M/tiyGe8g7gNIdauWxN1afdgB"),
    @"Blue":ENCRYPTED_STRING(@"b",@"jaIxDwexYEFUlmoG8QsdKYbj/g2zZWL0q5gmeWGCuLOwXvUHdB0CU7i4v/55LEi3UuN7L9Yj4zjWX//WZB0HFn5+9NZ8IG9xoc+uE+vDMbxAKaqjA5IfJM38eVl0DK/hp0le3qOG11sd+GXoSXSDiwKWGoihqYZ6GUzgDTx8f2OlhqG/SUlm/jADLUNJjK8czZ8fY+Fx75cj7OTlOl+nikFoE5BkR3exOYkeCmAY2KgCYyJQn2w3yaBS0tGafUjAIHIHITodrjG+IbjZLhZyG2/jxkMjLNDs0GCWH6vh+mQ9h6Iwzq3UIZnK9zUn2D4cZV5I2StjPpPdAkGrsdIv0L/bQJZjAnidQIWOC5iB7poB")
});
ENCRYPTED_STRING_PROPERTY_LIST_EDIT(encrypted_string_RegexTextfield_List, @"https://[\\w\\.-]+\\.appfigurate.io/.*", @"encrypted NSString - textfield with regex, customizable list", NO, @{
    @"Dev":ENCRYPTED_STRING(@"https://dev.appfigurate.io/list",@"jm9SM4MEYa4FRbTrK23n6QWpBl0MfLolPPUrnaUcMcCzmJbzBT0MumGIEFFthMFbx5ZZta8mCIKYwBR2Cu/2b52rFUr2N8xCuWiWURS0erO6sxdY3bJSzRJPo70aGYzMLydVrxUtHv1BjeLTYaG/25hF5JYWf8/TOA4lBRgMsttwbiO+0D6u1qGh4pewpTD5lI8jK39sY3DfSco7+61chGakI7n44y/+toqxWl8rEa5+I9eL0vDASfe7V2KvBhQGV8FLZDkVo0a0fqcCeq5AXU1bl0bMXIB2anN1PdihbPjOLZgpllIzuY+Hy8gFfpoCGQRAiiPSI2YDxT+pg2fKUBMQ9OqFAC5fi+7DqfRhy6SRXjfemq5cDglwMGnpRI4JAQ=="),
    @"Test":ENCRYPTED_STRING(@"https://test.appfigurate.io/list",@"4H4M2YQ2XH+bm7FYVm1sQuN+DaUQdvJecWLKYo3peUYwNJsw+bE/ANFbtfD6xDWCnDW8Bs62tqYDtyg6YhucnTjx82c+axxKG/eDpEd3nPdiWubrw3UwuWa8xKIH8RFVQyRDpWrCbSDG/rREiRdUUs4Lwer7uJfOa92u9iN56T5rgH7/IXfo2N///FxmN/6Tr2vVXNVc+m3snBE8B05+4WUKuDLkjGcmHfzlnRiQVyDDyNKDNr1vDoZduu5Fb5CwPfCrxNIJY4r0XFyPIv+pjAG/Z8Tl2dud6SjCzKirb1Nc0ZeQsCKyhSXDN3PC82qMbviAlkCOvkZ2mca4mRcW1VqeR63Ujp37lCAZKExPdqSlElI4Z0J7/dHuEyMFNP1/xngi3iuOxO6L7Qy9i/RTnQE="),
    @"Prod":ENCRYPTED_STRING(@"https://m.appfigurate.io/list",@"IE7X1bkOQGAqCTtLk011hG0Kmj5l0RkSviSO6IfItnIlSEL66ZH1cO4vmN8FtjkWhD+zvcDzHkcsVSsqPrkmYJl29I2otn2dXa9tNIZMW3it1kyoyxnZLwzIJhPGORTMxeLN9h+U36lydUA4fASALFFP+uC+bVHVdvIVUMoGBDdoVwZAXyss4C+rgLTafkok4Hcz/a6rXC5SsluX8/LTnomluqfi8bgrSS2xJKKpHsQQllQmsshublBJ57bKn3EeKmo6DxwBuwBVA2nAdyoi1bLUYN+XN1sjzLaAuYyZeDJGs9qiuj78HCyN4ZrcVe3x00AbNAlSISrZJrw2oMt3exSGFGKAenClYqwoVygDPIPI3vNFCRFcp29N7T4S78K5AQ==")
});

// MARK: - NSInteger

INT_PROPERTY_SLIDER(integer_Slider, 0, 1000, APLIconSliderNumeric, @"Integer - slider", YES);
INT_PROPERTY_EDIT(integer_Textfield, 10, 20, @"", @"Integer - textfield", NO);
INT_PROPERTY_EDIT(integer_RegexTextfield, 1, 999, @"^([1-9]|[1-9][0-9]|[1-9][0-9][0-9])$", @"Integer - textfield with regex", NO);
INT_PROPERTY_LIST(integer_List, @"Integer - fixed list", NO, @{@"None":@-100,@"Low":@-50,@"Zero":@0,@"High":@50,@"Urgent":@100});
INT_PROPERTY_LIST_EDIT(integer_Textfield_List, 0, 100, @"", @"Integer - textfield, customizable list", NO, @{@"Failed":@0,@"Pass":@80,@"Excellence":@90});
INT_PROPERTY_LIST_EDIT(integer_RegexTextfield_List, 0, 365, @"^(0?[0-9]?[0-9]|[1-2][0-9][0-9]|3[0-5][0-9]|36[0-5])$", @"Integer - textfield with regex, customizable list",NO, @{@"0 days":@0,@"1 month":@30,@"1 Year":@365});

// MARK: - float

FLOAT_PROPERTY_SLIDER(float_Slider, 0.0, 1000.0, APLIconSliderVolume, @"Float - slider", NO);
FLOAT_PROPERTY_EDIT(float_Textfield, 10.0, 20.0, @"", @"Float - textfield", YES);
FLOAT_PROPERTY_EDIT(float_RegexTextfield, 5.0, 250.0, @"^(?:[1-9]\\d*|0)?(?:\\.\\d+)?$", @"Float - textfield with regex", NO);
FLOAT_PROPERTY_LIST(float_List, @"Float - fixed list", NO, @{@"None":@-100.0,@"Low":@-50.0,@"Zero":@0.0,@"High":@50.0,@"Urgent":@100.0});
FLOAT_PROPERTY_LIST_EDIT(float_Textfield_List, 0.0, 100.0, @"", @"Float - textfield, customizable list", NO, @{@"Failed":@0.0,@"Pass":@80.0,@"Excellence":@90.0});
FLOAT_PROPERTY_LIST_EDIT(float_RegexTextfield_List, 0.0, 366.0, @"^(0?[0-9]?[0-9]|[1-2][0-9][0-9]|3[0-5][0-9]|36[0-5])?(?:\\.\\d+)?$", @"Float - textfield with regex, customizable list", NO, @{@"0 days":@0.0,@"1 month":@30.0,@"1 Year":@365.0});

// MARK: - double

DOUBLE_PROPERTY_SLIDER(double_Slider, 0.0, 1000.0, APLIconSliderBrightness, @"Double - slider", NO);
DOUBLE_PROPERTY_EDIT(double_Textfield, 10.0, 20.0, @"", @"Double - textfield", NO);
DOUBLE_PROPERTY_EDIT(double_RegexTextfield, 5.0, 250.0, @"^(?:[1-9]\\d*|0)?(?:\\.\\d+)?$", @"Double - textfield with regex", NO);
DOUBLE_PROPERTY_LIST(double_List, @"Double - fixed list", YES, @{@"None":@-100.0,@"Low":@-50.0,@"Zero":@0.0,@"High":@50.0,@"Urgent":@100.0});
DOUBLE_PROPERTY_LIST_EDIT(double_Textfield_List, 0.0, 100.0, @"", @"Double - textfield, customizable list", NO, @{@"Failed":@0.0,@"Pass":@80.0,@"Excellence":@90.0});
DOUBLE_PROPERTY_LIST_EDIT(double_RegexTextfield_List, 0.0, 366.0, @"^(0?[0-9]?[0-9]|[1-2][0-9][0-9]|3[0-5][0-9]|36[0-5])?(?:\\.\\d+)?$", @"Double - textfield with regex, customizable list", NO, @{@"0 days":@0.0,@"1 month":@30.0,@"1 Year":@365.0});

// MARK: - remote

REMOTE_BOOL_PROPERTY(alwaysDarkMode, @"alwaysDarkMode", @"Force dark mode to be always set");
REMOTE_STRING_PROPERTY_EDIT(appTitle, @"appTitle", @"Title of application");
REMOTE_DOUBLE_PROPERTY_EDIT(fontSize, @"fontSize", @"Size of font throughout app");
REMOTE_INT_PROPERTY_EDIT(bookingDuration, @"bookingDuration", @"Duration (days) for reservation bookings");
                     
// MARK: - Actions

ACTION_METHOD(randomIntegers, @"Set all integer properties to random values", YES) {
    self.integer_Slider = rand() % 1001;
    self.integer_Textfield = (rand() % 10) + 10;
    self.integer_RegexTextfield = (rand() % 998) + 1;
    switch (rand() % 5) {
        case 0: self.integer_List = -100; break;
        case 1: self.integer_List = -50; break;
        case 2: self.integer_List = 0; break;
        case 3: self.integer_List = 50; break;
        default: self.integer_List = 100;
    }
    switch (rand() % 3) {
        case 0: self.integer_Textfield_List = 0; break;
        case 1: self.integer_Textfield_List = 80; break;
        default: self.integer_Textfield_List = 90;
    }
    self.integer_RegexTextfield_List = rand() % 366;
}

ACTION_METHOD(resetIntegers, @"Reset integer properties to defaults", YES) {
    self.integer_Slider = 500;
    self.integer_Textfield = 10;
    self.integer_RegexTextfield = 500;
    self.integer_List = 0;
    self.integer_Textfield_List = 80;
    self.integer_RegexTextfield_List = 30;
}


// MARK: - Overrides

- (BOOL) allowInvalidSignatures {
#if DEBUG
    return YES;
#else
    return NO;
#endif
}

- (NSString*) publicKey {
    // 41 36 87 71 0D 05
    return @"-----BEGIN PUBLIC KEY-----\n" \
        "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA4TZnKfGeXttN7Rr3eiAZ\n" \
        "PMEPsZvbo7lgIpMh6OjgBsoqkJJP0yXXLtpqsBCv8vm7RYqCn5+yfkiCQiXvkJBz\n" \
        "FSKmLF9EPR9l1H+32Id82dDuseD70D66puPUHjciEgmU18DpW2NVvTAykMwTEsiR\n" \
        "0h/ExBEhUe75qtwlVno8cMFbEfVtiGbKECvWIr122ED71T0Jt2Bcxqx1a7c1hPIV\n" \
        "RwLxIfWfE0+2rB9nJVPBgsTVPywibDvjio82FousyMDmvkAbMq5iyuyvJ0+5bATz\n" \
        "o12GEt5lSiQlCMzfmkWYBROMDCh27qGFVVo1XAUCVsMfsW9n4iQcoLAdUp/LI3B3\n" \
        "ywIDAQAB\n" \
        "-----END PUBLIC KEY-----\n";
}

- (void) reset {
    // Local properties
    self.boolean = YES;
    self.string_Textfield = @"tuesday";
    self.string_RegexTextfield = @"bot";
    self.string_List = @"sm";
    self.string_Textfield_List = @"g";
    self.string_RegexTextfield_List = @"https://m.electricbolt.co.nz/list";
    self.encrypted_string_Textfield_List = @"g";
    self.encrypted_string_RegexTextfield_List = @"https://m.appfigurate.io/list";
    self.integer_Slider = 500;
    self.integer_Textfield = 10;
    self.integer_RegexTextfield = 500;
    self.integer_List = 0;
    self.integer_Textfield_List = 80;
    self.integer_RegexTextfield_List = 30;
    self.float_Slider = 950.0;
    self.float_Textfield = 12.0;
    self.float_RegexTextfield = 5.95;
    self.float_List = -50.0;
    self.float_Textfield_List = 80.0;
    self.float_RegexTextfield_List = 365.0;
    self.double_Slider = 950.0;
    self.double_Textfield = 12.0;
    self.double_RegexTextfield = 5.95;
    self.double_List = -50.0;
    self.double_Textfield_List = 80.0;
    self.double_RegexTextfield_List = 365.0;
    
    // Remote properties
    self.alwaysDarkMode = true;
    self.appTitle = @"Remote Config Test";
    self.fontSize = 13.0;
    self.bookingDuration = 180;
}

@end

Class APLConfigurationClass(void) {
    return [ExampleConfiguration class];
}
