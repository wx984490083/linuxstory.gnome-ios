//
//  GLSUserInfoModel.h
//  LinuxStory
//
//  Created by 谭培 on 2017/9/30.
//  Copyright © 2017年 linuxstory.gnome. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GLSUserInfoModel : NSObject

@property (nonatomic, strong) NSNumber *userCode;
@property (nonatomic, strong) NSNumber *userId;
@property (nonatomic, strong) NSString *userName;
@property (nonatomic, strong) NSString *userNickName;
@property (nonatomic, strong) NSString *userAvatar;
@property (nonatomic, strong) NSString *userSite;
@property (nonatomic, strong) NSString *userEmail;
@property (nonatomic, strong) NSString *userPhone;
@property (nonatomic, strong) NSString *userOrderId;
@property (nonatomic, strong) NSString *totalAmout;
@property (nonatomic, strong) NSString *paidAmount;
@property (nonatomic, strong) NSString *discountAmount;
@property (nonatomic, strong) NSString *refundedAmount;

@end
