//
//  NSObject+TagObject.h
//  Hualu
//
//  Created by 郭朝顺 on 2018/11/15星期四.
//  Copyright © 2018年 智网易联. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (TagObject)

// 每个UIView都有一个tag属性,记录一些小数据挺方便的,就给NSObject添加一个,记录一些关于NSObject的小数据
@property (nonatomic,strong) id tagObject ;

@end
