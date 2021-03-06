//
//  KilaTool.m
//  TestImageLoad
//
//  Created by 李雅珠 on 2021/3/6.
//

#import "KilaTool.h"

@implementation KilaTool

+ (UIImage *)returnImage {

//    NSString * imageName = @"mx-gd"; // 不能显示
//    NSString * imageName = @"mx-gd@2x"; // 不能显示
    NSString * imageName = @"mx-gd@2x.png"; // 必须全称才可以

    NSBundle * currentBundle = [NSBundle bundleForClass:self];
    NSString *path = [currentBundle pathForResource:imageName ofType:nil inDirectory:@"KilaImageLoad.bundle"];

    UIImage *image = [UIImage imageWithContentsOfFile:path];
    return image;
}

@end
