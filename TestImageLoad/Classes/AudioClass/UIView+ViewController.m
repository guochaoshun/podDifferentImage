//
//   ______     ______     __  __
//  /\  ___\   /\  ___\   /\_\_\_\
//  \ \  __\   \ \ \____  \/_/\_\/_
//   \ \_____\  \ \_____\   /\_\/\_\
//    \/_____/   \/_____/   \/_/\/_/
//
// -----------------------------------------------------------------------------
//

#import "UIView+ViewController.h"

@implementation UIView (ViewController)


- (UIViewController *)viewController
{
    UIResponder *next = [self nextResponder];
    
    do {
        if ([next isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)next;
        }
        next = [next nextResponder];
    } while (next != nil);
    return nil;
}



@end

@implementation UINavigationController (DelayPop)

- (void)popViewControllerAfterDelay {
    [self performSelector:@selector(popViewControllerAnimated:) withObject:@(YES) afterDelay:2];
}

@end



@implementation UITableViewCell (TableView)

- (UITableView *)tableView {
    UIView *next = [self superview];
    
    do {
        if ([next isKindOfClass:[UITableView class]]) {
            return (UITableView *)next;
        }
        next = [next superview];
    } while (next != nil);
    return nil;

}

@end
