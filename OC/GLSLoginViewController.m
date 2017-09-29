//
//  GLSLoginViewController.m
//  LinuxStory
//
//  Created by 王鑫 on 2017/9/29.
//  Copyright © 2017年 linuxstory.gnome. All rights reserved.
//

#import "GLSLoginViewController.h"
#import "LinuxStory-Swift.h"

@interface GLSLoginViewController ()

@property (nonatomic, weak) IBOutlet UIButton* getCodeButton;
@property (nonatomic, weak) IBOutlet UITextField* codeField;
@property (nonatomic, weak) IBOutlet UIButton* loginButton;
@property (nonatomic, weak) IBOutlet UIButton* visitorButton;

@end

@implementation GLSLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)getCodeButtonTouched:(UIButton*)sender
{
    //TODO: 执行获取活动码的操作
}

-(IBAction)loginButtonTouched:(UIButton*)sender
{
    //TODO: 登陆
    
}

-(IBAction)visitorButtonTouched:(UIButton*)sender
{
    //TODO: 执行游客登陆的操作
    [AppDelegate.glsAppDelegate switchToMainPage];
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
