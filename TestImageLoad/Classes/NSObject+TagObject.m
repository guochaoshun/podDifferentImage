//
//  NSObject+TagObject.m
//  Hualu
//
//  Created by 郭朝顺 on 2018/11/15星期四.
//  Copyright © 2018年 智网易联. All rights reserved.
//

#import "NSObject+TagObject.h"
#import <objc/runtime.h>

@implementation NSObject (TagObject)


- (void)setTagObject:(id)tagObject{
    objc_setAssociatedObject(self, @"tagObject", tagObject, OBJC_ASSOCIATION_RETAIN_NONATOMIC) ;
}
- (id)tagObject{
    return objc_getAssociatedObject(self, @"tagObject") ;
}


@end
