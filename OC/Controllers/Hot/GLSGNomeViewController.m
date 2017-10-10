//
//  GLSGNomeViewController.m
//  LinuxStory
//
//  Created by 王鑫 on 2017/9/29.
//  Copyright © 2017年 linuxstory.gnome. All rights reserved.
//

#import "GLSGNomeViewController.h"
#import "GLSNewsViewController.h"
#import "GLSScheduleViewController.h"
#import "GLSFieldViewController.h"
#import "GLSSponsorViewController.h"
#import "GLSStaffViewController.h"

#define MAX_CONTROLLER_COUNT 10

@interface GLSGNomeViewController ()<FJSlidingControllerDelegate, FJSlidingControllerDataSource>
{
    NSArray* titles;
    NSArray* controllerClasses;
    UIViewController* controllers[MAX_CONTROLLER_COUNT];
}

@end

@implementation GLSGNomeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = UIColorFromRGB(0xFC361D);
    self.segmentBarY = StatusBarHeight;
    self.segmentBarBG = UIColor.clearColor;
    self.textSelectedColor = UIColor.whiteColor;
    self.textNomalColor = UIColor.lightTextColor;
    self.lineColor = UIColor.whiteColor;
    
    self.delegate = self;
    self.datasouce = self;
    [self setupDataSource];
    [self reloadData];
}

-(void)setupDataSource
{
    titles = @[@"新闻",@"议程",@"场地",@"赞助",@"工作人员"];
    controllerClasses = @[GLSNewsViewController.class,
                          GLSScheduleViewController.class,
                          GLSFieldViewController.class,
                          GLSSponsorViewController.class,
                          GLSStaffViewController.class];
    bzero(controllers, sizeof(controllers));
}

-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

-(void)viewWillAppear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:YES animated:animated];
}

-(void)viewWillDisappear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:NO animated:animated];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

// pageNumber
- (NSInteger)numberOfPageInFJSlidingController:(FJSlidingController *)fjSlidingController
{
    return titles.count;
}

// index -> UIViewController
- (UIViewController *)fjSlidingController:(FJSlidingController *)fjSlidingController controllerAtIndex:(NSInteger)index
{
    if (!controllers[index])
    {
        Class cls = controllerClasses[index];
        controllers[index] = [cls new];
        [self addChildViewController:controllers[index]];
    }
    return controllers[index];
}

// index -> Title
- (NSString *)fjSlidingController:(FJSlidingController *)fjSlidingController titleAtIndex:(NSInteger)index
{
    return titles[index];
}

// selctedIndex
- (void)fjSlidingController:(FJSlidingController *)fjSlidingController selectedIndex:(NSInteger)index
{
    NSLog(@"selected index:%ld", (long)index);
}

// selectedController
- (void)fjSlidingController:(FJSlidingController *)fjSlidingController selectedController:(UIViewController *)controller
{
    NSLog(@"selected controller:%p", controller);
}

// selectedTitle
- (void)fjSlidingController:(FJSlidingController *)fjSlidingController selectedTitle:(NSString *)title
{
    NSLog(@"selected title:%@", title);
}

@end
