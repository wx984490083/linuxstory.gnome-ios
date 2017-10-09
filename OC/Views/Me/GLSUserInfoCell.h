//
//  GLSUserInfoCell.h
//  LinuxStory
//
//  Created by 谭培 on 2017/10/9.
//  Copyright © 2017年 linuxstory.gnome. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GLSUserInfoCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *tintLabel;

@property (weak, nonatomic) IBOutlet UILabel *contentlabel;

+ (instancetype)cellWithTableView:(UITableView *)tableView;

@end
