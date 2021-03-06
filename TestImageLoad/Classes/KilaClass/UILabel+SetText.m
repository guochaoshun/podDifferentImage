//
//  NSLabel+SetText.m
//  拖动手势
//
//  Created by 郭朝顺 on 2018/5/15星期二.
//  Copyright © 2018年 乐乐. All rights reserved.
//

#import "UILabel+SetText.h"
#import <objc/runtime.h>

@implementation UILabel (SetText)

+ (void)load {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        SEL origSel = @selector(setText:) ;
        SEL altSel = @selector(setTextHooked:) ;
        
        Method origMethod = class_getInstanceMethod(self, origSel);
        Method altMethod = class_getInstanceMethod(self, altSel);
        if (!origMethod || !altMethod) {
            return ;
        }
        class_addMethod(self,
                        origSel,
                        class_getMethodImplementation(self, origSel),
                        method_getTypeEncoding(origMethod));
        class_addMethod(self,
                        altSel,
                        class_getMethodImplementation(self, altSel),
                        method_getTypeEncoding(altMethod));
        method_exchangeImplementations(class_getInstanceMethod(self, origSel),
                                       class_getInstanceMethod(self, altSel));
    });
}

/// 主要是解决 服务器有时返回NSNumber类型,但是用了NSString指针接收,在 label.text = @(num) 时崩溃 ,DEBUG下会崩溃, Release下不崩溃
- (void) setTextHooked:(NSString *)string {
    
    if (string == nil) {
        string = @"";
    }
    if ([string containsString:@"(null)"]) {
        string = [string stringByReplacingOccurrencesOfString:@"(null)" withString:@""];
    }
    
    [self setTextHooked:string.description] ;
    
}





@end
