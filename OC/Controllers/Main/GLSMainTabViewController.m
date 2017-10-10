//
//  GLSMainTabViewController.m
//  LinuxStory
//
//  Created by 王鑫 on 2017/9/29.
//  Copyright © 2017年 linuxstory.gnome. All rights reserved.
//

#import "GLSMainTabViewController.h"

@interface GLSMainTabViewController ()

@end

@implementation GLSMainTabViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.tabBar.tintColor = UIColorFromRGB(0xFC361D);
    //tabbar背景色
    self.tabBar.barStyle = UIBarStyleBlack;
    self.tabBar.translucent = NO;
    self.tabBar.barTintColor = UIColor.whiteColor;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
