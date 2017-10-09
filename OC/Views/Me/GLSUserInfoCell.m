//
//  GLSUserInfoCell.m
//  LinuxStory
//
//  Created by 谭培 on 2017/10/9.
//  Copyright © 2017年 linuxstory.gnome. All rights reserved.
//

#import "GLSUserInfoCell.h"

@implementation GLSUserInfoCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

+ (instancetype)cellWithTableView:(UITableView *)tableView{
    static NSString *identifier = @"userInfoCell";
    GLSUserInfoCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:identifier owner:nil options:nil] firstObject];
    }
    return cell;
}

@end
