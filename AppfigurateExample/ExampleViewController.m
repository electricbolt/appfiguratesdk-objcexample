// ExampleViewController.m
// AppfigurateExample Copyright© 2013; Electric Bolt Limited.

#import "ExampleViewController.h"
#import "ExampleConfiguration.h"

@interface ExampleViewController()<APLConfigurationUpdated>

@end

@implementation ExampleViewController

- (void) viewDidLoad {
    self.navigationItem.title = [NSString stringWithFormat: @"ObjC Example %@", APLVersion()];
    APLAddConfigurationUpdatedListener(self);

    APLConfigurationLabel* label = [[APLConfigurationLabel alloc] initWithFrame: CGRectZero];
    label.center = CGPointMake(7, self.navigationController.view.bounds.size.height / 2);
    [self.navigationController.view addSubview: label];
}

/**
 * Called when the application configuration is applied from the Appfigurate application.
 */
- (void) configurationUpdated:(NSNotification *)notification {
    [self.tableView reloadData];
}

- (UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [super tableView:tableView cellForRowAtIndexPath:indexPath];
    switch (indexPath.section) {
        case 0: cell.detailTextLabel.text = CONFIGURATION.boolean ? @"YES":@"NO"; break;
        case 1:
            switch (indexPath.row) {
                case 0: cell.detailTextLabel.text = CONFIGURATION.string_Textfield; break;
                case 1: cell.detailTextLabel.text = CONFIGURATION.string_RegexTextfield; break;
                case 2: cell.detailTextLabel.text = CONFIGURATION.string_List; break;
                case 3: cell.detailTextLabel.text = CONFIGURATION.string_Textfield_List; break;
                case 4: cell.detailTextLabel.text = CONFIGURATION.string_RegexTextfield_List; break;
                case 5: cell.detailTextLabel.text = CONFIGURATION.encrypted_string_Textfield_List; break;
                case 6: cell.detailTextLabel.text = CONFIGURATION.encrypted_string_RegexTextfield_List; break;
            }
            break;
        case 2:
            switch (indexPath.row) {
                case 0: cell.detailTextLabel.text = [NSString stringWithFormat: @"%ld", (long) CONFIGURATION.integer_Slider]; break;
                case 1: cell.detailTextLabel.text = [NSString stringWithFormat: @"%ld", (long) CONFIGURATION.integer_Textfield]; break;
                case 2: cell.detailTextLabel.text = [NSString stringWithFormat: @"%ld", (long) CONFIGURATION.integer_RegexTextfield]; break;
                case 3: cell.detailTextLabel.text = [NSString stringWithFormat: @"%ld", (long) CONFIGURATION.integer_List]; break;
                case 4: cell.detailTextLabel.text = [NSString stringWithFormat: @"%ld", (long) CONFIGURATION.integer_Textfield_List]; break;
                case 5: cell.detailTextLabel.text = [NSString stringWithFormat: @"%ld", (long) CONFIGURATION.integer_RegexTextfield_List]; break;
            }
            break;
        case 3:
            switch (indexPath.row) {
                case 0: cell.detailTextLabel.text = [NSString stringWithFormat: @"%0.3f", CONFIGURATION.float_Slider]; break;
                case 1: cell.detailTextLabel.text = [NSString stringWithFormat: @"%0.3f", CONFIGURATION.float_Textfield]; break;
                case 2: cell.detailTextLabel.text = [NSString stringWithFormat: @"%0.3f", CONFIGURATION.float_RegexTextfield]; break;
                case 3: cell.detailTextLabel.text = [NSString stringWithFormat: @"%0.3f", CONFIGURATION.float_List]; break;
                case 4: cell.detailTextLabel.text = [NSString stringWithFormat: @"%0.3f", CONFIGURATION.float_Textfield_List]; break;
                case 5: cell.detailTextLabel.text = [NSString stringWithFormat: @"%0.3f", CONFIGURATION.float_RegexTextfield_List]; break;
            }
            break;
        case 4:
            switch (indexPath.row) {
                case 0: cell.detailTextLabel.text = [NSString stringWithFormat: @"%0.3f", CONFIGURATION.double_Slider]; break;
                case 1: cell.detailTextLabel.text = [NSString stringWithFormat: @"%0.3f", CONFIGURATION.double_Textfield]; break;
                case 2: cell.detailTextLabel.text = [NSString stringWithFormat: @"%0.3f", CONFIGURATION.double_RegexTextfield]; break;
                case 3: cell.detailTextLabel.text = [NSString stringWithFormat: @"%0.3f", CONFIGURATION.double_List]; break;
                case 4: cell.detailTextLabel.text = [NSString stringWithFormat: @"%0.3f", CONFIGURATION.double_Textfield_List]; break;
                case 5: cell.detailTextLabel.text = [NSString stringWithFormat: @"%0.3f", CONFIGURATION.double_RegexTextfield_List]; break;
            }
            break;
        case 5:
            switch (indexPath.row) {
                case 0: cell.detailTextLabel.text = CONFIGURATION.alwaysDarkMode ? @"YES": @"NO"; break;
                case 1: cell.detailTextLabel.text = CONFIGURATION.appTitle; break;
                case 2: cell.detailTextLabel.text = [NSString stringWithFormat: @"%0.3f", CONFIGURATION.fontSize]; break;
                case 3: cell.detailTextLabel.text = [NSString stringWithFormat: @"%ld", (long) CONFIGURATION.bookingDuration]; break;
            }
    }
    return cell;
}

@end
