//
//  GCSViewController.m
//  TestImageLoad
//
//  Created by guochaoshun on 03/06/2021.
//  Copyright (c) 2021 guochaoshun. All rights reserved.
//

#import "GCSViewController.h"
#import <TestImageLoad/UIView+ViewController.h>
#import <TestImageLoad/NSObject+TagObject.h>
#import <TestImageLoad/UILabel+SetText.h>
#import <TestImageLoad/UILabel+SetText.h>

#import <TestImageLoad/KilaTool.h>
#import <TestImageLoad/AudioTool.h>


@interface GCSViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@property (weak, nonatomic) IBOutlet UIImageView *imageView2;


@end

@implementation GCSViewController

- (void)viewDidLoad
{
    [super viewDidLoad];


    NSLog(@"%@",self.view.viewController);

    self.view.tagObject = @(123);

    NSLog(@"%@",self.view.tagObject);


    self.imageView.image = [KilaTool returnImage];
    self.imageView2.image = [AudioTool returnImage];


}

@end
