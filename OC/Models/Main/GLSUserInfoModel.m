//
//  GLSUserInfoModel.m
//  LinuxStory
//
//  Created by 谭培 on 2017/9/30.
//  Copyright © 2017年 linuxstory.gnome. All rights reserved.
//

#import "GLSUserInfoModel.h"

@interface GLSUserInfoModel ()<NSCoding>

@end

@implementation GLSUserInfoModel

+ (nullable NSDictionary<NSString *, id> *)modelCustomPropertyMapper{
    return @{
             @"userCode":@"ticket_code",
             @"userId":@"ticket_id",
             @"userName":@"",
             @"userNickName":@"ticket_user_nickname",
             @"userAvatar":@"ticket_user_avatar",
             @"userSite":@"",
             @"userEmail":@"ticket_email",
             @"userPhone":@"ticket_phone",
             @"userOrderId":@"ticket_order_id",
             @"totalAmout":@"ticket_total_amount",
             @"paidAmount":@"ticket_discount_amount",
             @"discountAmount":@"ticket_discount_amount",
             @"refundedAmount":@"ticket_refunded_amount"
             };
}

- (void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:self.userCode forKey:@"USERCODE"];
    [aCoder encodeObject:self.userId forKey:@"USERID"];
    [aCoder encodeObject:self.userName forKey:@"USERNAME"];
    [aCoder encodeObject:self.userNickName forKey:@"USERNICKNAME"];
    [aCoder encodeObject:self.userAvatar forKey:@"USERAVATAR"];
    [aCoder encodeObject:self.userSite forKey:@"USERSITE"];
    [aCoder encodeObject:self.userEmail forKey:@"USEREMAIL"];
    [aCoder encodeObject:self.userPhone forKey:@"USERPHONE"];
    [aCoder encodeObject:self.userOrderId forKey:@"USERORDERID"];
    [aCoder encodeObject:self.totalAmout forKey:@"TOTALAMOUT"];
    [aCoder encodeObject:self.paidAmount forKey:@"PAIDAMOUNT"];
    [aCoder encodeObject:self.discountAmount forKey:@"DISCOUNTAMOUNT"];
    [aCoder encodeObject:self.refundedAmount forKey:@"REFUNDEDAMOUNT"];

}

- (nullable instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super init]) {
        self.userCode = [aDecoder decodeObjectForKey:@"USERCODE"];
        self.userId = [aDecoder decodeObjectForKey:@"USERID"];
        self.userName = [aDecoder decodeObjectForKey:@"USERNAME"];
        self.userNickName = [aDecoder decodeObjectForKey:@"USERNICKNAME"];
        self.userAvatar = [aDecoder decodeObjectForKey:@"USERAVATAR"];
        self.userSite = [aDecoder decodeObjectForKey:@"USERSITE"];
        self.userEmail = [aDecoder decodeObjectForKey:@"USEREMAIL"];
        self.userPhone = [aDecoder decodeObjectForKey:@"USERPHONE"];
        self.userOrderId = [aDecoder decodeObjectForKey:@"USERORDERID"];
        self.totalAmout = [aDecoder decodeObjectForKey:@"TOTALAMOUT"];
        self.paidAmount = [aDecoder decodeObjectForKey:@"PAIDAMOUNT"];
        self.discountAmount = [aDecoder decodeObjectForKey:@"DISCOUNTAMOUNT"];
        self.refundedAmount = [aDecoder decodeObjectForKey:@"REFUNDEDAMOUNT"];
    }
    return self;
}

@end
