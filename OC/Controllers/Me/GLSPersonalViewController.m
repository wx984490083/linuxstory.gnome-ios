//
//  GLSPersonalViewController.m
//  LinuxStory
//
//  Created by 王鑫 on 2017/9/29.
//  Copyright © 2017年 linuxstory.gnome. All rights reserved.
//

#import "GLSPersonalViewController.h"
#import "GLSUserInfoModel.h"
#import "GLSUserInfoCell.h"

@interface GLSPersonalViewController () <UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UIImageView *headImageView;
@property (weak, nonatomic) IBOutlet UILabel *nikeNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *userIdLabel;
@property (weak, nonatomic) IBOutlet UIView *settingView;
@property (weak, nonatomic) IBOutlet UITableView *userInfoTableView;

@property (nonatomic, strong) NSArray *tints;
@property (nonatomic, strong) NSArray *contents;

@end

@implementation GLSPersonalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationController.navigationBar.barTintColor = Hex(0xFC361D);
    self.title = @"我的";
    NSDictionary *titleAttributes = @{NSForegroundColorAttributeName:[UIColor whiteColor]};
    self.view.backgroundColor = klightGray;
    [self.navigationController.navigationBar setTitleTextAttributes:titleAttributes];
    [self.navigationController.navigationBar setValue:@0 forKeyPath:@"backgroundView.alpha"];
//    [self.userInfoTableView dequeueReusableCellWithIdentifier:@""];
    self.userInfoTableView.delegate = self;
    self.userInfoTableView.dataSource = self;
    self.userInfoTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.userInfoTableView.scrollEnabled = NO;
    self.userInfoTableView.allowsSelection = NO;
    self.tints = @[@"姓名：",@"工作地址：",@"Email：",@"电话：",@"订单ID：",@"已付金额：",@"折扣金额：",@"退换金额"];
    [self.userInfoTableView reloadData];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.tints.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return self.userInfoTableView.frame.size.height/8.0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    GLSUserInfoCell *cell = [GLSUserInfoCell cellWithTableView:tableView];
    cell.tintLabel.text = self.tints[indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

@end
