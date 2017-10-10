//
//  GLSLoginViewController.m
//  LinuxStory
//
//  Created by 王鑫 on 2017/9/29.
//  Copyright © 2017年 linuxstory.gnome. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic, class, readonly) AppDelegate* glsAppDelegate;

-(void)switchToMainPage;
-(void)switchToLoginPage;

@end

