//
//  GLSEventViewController.m
//  LinuxStory
//
//  Created by 王鑫 on 2017/9/29.
//  Copyright © 2017年 linuxstory.gnome. All rights reserved.
//

#import "GLSEventViewController.h"
#import "IDNFeedParser.h"

@interface GLSEventViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray *items;
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
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSData* feeddata = [IDNFeedParser dataFromUrl:eventFeedURL];
        NSArray* items = [IDNFeedParser feedItemsWithData:feeddata fromUrl:eventFeedURL];
        self.items = items;
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
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
        });
    });
}

//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
//
//}
//
//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
//
//}
//
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
//
//}
//
//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//
//}

@end
