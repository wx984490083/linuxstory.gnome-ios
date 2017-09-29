//
//  GLSEventViewController.m
//  LinuxStory
//
//  Created by 王鑫 on 2017/9/29.
//  Copyright © 2017年 linuxstory.gnome. All rights reserved.
//

#import "GLSEventViewController.h"
#import "IDNFeedParser.h"

@interface GLSEventViewController ()

@end

static NSString* eventFeedURL = @"https://linuxstory.org/feed/?(category/activity/)";

@implementation GLSEventViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self testLoadFeed];
}

//读取rss信息示例
-(void)testLoadFeed
{
    dispatch_async(dispatch_get_main_queue(), ^{
        NSData* feeddata = [IDNFeedParser dataFromUrl:eventFeedURL];
        
        NSArray* items = [IDNFeedParser feedItemsWithData:feeddata fromUrl:eventFeedURL];
        for (IDNFeedItem* item in items)
        {
            NSLog(@"title:%@", item.title);
            NSLog(@"author:%@", item.author);
            NSLog(@"identifier:%@", item.identifier);
            NSLog(@"link:%@", item.link);
            NSLog(@"date:%@", item.date.description);
            
            //updated字段为空
            NSLog(@"updated:%@", item.updated.description);
            
            NSLog(@"summary:%@", item.summary);
            NSLog(@"content:%@", item.content);
        }
    });
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
