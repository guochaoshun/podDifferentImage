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


+ (UIImage *)yy_imageNamed:(NSString *)name {
    if (name.length == 0) return nil;
    if ([name hasSuffix:@"/"]) return nil;
    // 比如mx-gd.png, res就是mx-gd, ext就是png
    NSString *res = name.stringByDeletingPathExtension;
    NSString *ext = name.pathExtension;
    NSString *path = nil;
    CGFloat scale = 1;

    // 如果传入的name没有后缀, 会使用数组进行查找
    NSArray *exts = ext.length > 0 ? @[ext] : @[@"", @"png", @"jpeg", @"jpg", @"gif", @"webp", @"apng"];
    NSArray *scales = _NSBundlePreferredScales();
    for (int s = 0; s < scales.count; s++) {
        scale = ((NSNumber *)scales[s]).floatValue;
        NSString *scaledName = _NSStringByAppendingNameScale(res, scale);
        for (NSString *e in exts) {
            NSBundle * currentBundle = [NSBundle bundleForClass:self];
            path = [currentBundle pathForResource:scaledName ofType:e inDirectory:@"KilaImageLoad.bundle"];
            if (path) break;
        }
        if (path) break;
    }
    if (path.length == 0) return nil;

    UIImage *image = [UIImage imageWithContentsOfFile:path];
    return image;

}

// 根据屏幕比例返回对应的数组
// 2倍屏 @[2,3,1];  3倍屏 @[3,2,1]; 1倍屏 @[2,3,1], 这个应该已经没有了
static NSArray *_NSBundlePreferredScales() {
    static NSArray *scales;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        CGFloat screenScale = [UIScreen mainScreen].scale;
        if (screenScale <= 1) {
            scales = @[@1,@2,@3];
        } else if (screenScale <= 2) {
            scales = @[@2,@3,@1];
        } else {
            scales = @[@3,@2,@1];
        }
    });
    return scales;
}

// 拼接比例
/**
 比如string是@"icon" ,
 scale 是3, return就是icon@3x
 scale 是2, return就是icon@2x
 scale 是1,return就是icon
 */
static NSString *_NSStringByAppendingNameScale(NSString *string, CGFloat scale) {
    if (!string) return nil;
    if (fabs(scale - 1) <= __FLT_EPSILON__ || string.length == 0 || [string hasSuffix:@"/"]) return string.copy;
    return [string stringByAppendingFormat:@"@%@x", @(scale)];
}






@end
