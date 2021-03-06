//
//   ______     ______     __  __
//  /\  ___\   /\  ___\   /\_\_\_\
//  \ \  __\   \ \ \____  \/_/\_\/_
//   \ \_____\  \ \_____\   /\_\/\_\
//    \/_____/   \/_____/   \/_/\/_/
//
// -----------------------------------------------------------------------------
//

#import <UIKit/UIKit.h>

@interface UIView (ViewController)
- (UIViewController *)viewController;


@end

@interface UINavigationController (DelayPop)
- (void)popViewControllerAfterDelay;
@end

@interface UITableViewCell (TableView)
- (UITableView *)tableView;
@end

