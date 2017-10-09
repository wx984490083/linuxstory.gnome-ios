//
//  GLSLoginViewController.m
//  LinuxStory
//
//  Created by 王鑫 on 2017/9/29.
//  Copyright © 2017年 linuxstory.gnome. All rights reserved.
//

#import "GLSLoginViewController.h"
#import "LinuxStory-Swift.h"
#import "HTTPClient.h"
#import <MJExtension/MJExtension.h>
#import <SVProgressHUD/SVProgressHUD.h>
#import "GLSUserInfoModel.h"

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
    NSString *code = self.codeField.text;
    if (!code||code.length == 0) {
        return;
    }
    NSDictionary *body = @{@"code":code};
    
    //TODO: 登陆
    [[HTTPClient sharedInstance] postWithURL:@"http://gnome.liumax.com/ticket/getTicketInfoByCode" headers:nil httpBody:[body mj_JSONData] completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (!error&&response) {
//            GLSUserInfoModel *model = [GLSUserInfoModel yy_modelWithJSON:data[@"data"]];
            [AppDelegate.glsAppDelegate switchToMainPage];
        }else{
            dispatch_async(dispatch_get_main_queue(), ^{
                [SVProgressHUD showErrorWithStatus:@"an error code"];
            });
        }
    }];
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
