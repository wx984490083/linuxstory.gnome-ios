//
//  FJSlidingController.h
//  FJSlidingController
//
//  Created by fujin on 15/12/17.
//  Copyright © 2015年 fujin. All rights reserved.
//

// last modified by wx. 2017/10/07
// add: 可调节按钮栏的垂直坐标
// add: 可设置按钮栏背景色
// mod: 可直接设置按钮栏标题颜色、选中颜色、下划线颜色、字体大小


#import <UIKit/UIKit.h>
#import "SegmentTapView.h"

@protocol FJSlidingControllerDataSource;
@protocol FJSlidingControllerDelegate;

@interface FJSlidingController : UIViewController
@property (nonatomic, strong) id<FJSlidingControllerDataSource> datasouce;
@property (nonatomic, strong) id<FJSlidingControllerDelegate> delegate;

//
@property (nonatomic, assign) CGFloat segmentBarY;
@property (nonatomic, strong) UIColor* segmentBarBG;
@property (nonatomic, strong) UIColor* textNomalColor;
@property (nonatomic, strong) UIColor* textSelectedColor;
@property (nonatomic, strong) UIColor* lineColor;
@property (nonatomic, assign) CGFloat fontSize;

-(void)reloadData;
@end

@protocol FJSlidingControllerDataSource <NSObject>
@required
// pageNumber
- (NSInteger)numberOfPageInFJSlidingController:(FJSlidingController *)fjSlidingController;
// index -> UIViewController
- (UIViewController *)fjSlidingController:(FJSlidingController *)fjSlidingController controllerAtIndex:(NSInteger)index;
// index -> Title
- (NSString *)fjSlidingController:(FJSlidingController *)fjSlidingController titleAtIndex:(NSInteger)index;

@optional
// textNomalColor
- (UIColor *)titleNomalColorInFJSlidingController:(FJSlidingController *)fjSlidingController;
// textSelectedColor
- (UIColor *)titleSelectedColorInFJSlidingController:(FJSlidingController *)fjSlidingController;
// lineColor
- (UIColor *)lineColorInFJSlidingController:(FJSlidingController *)fjSlidingController;
// titleFont
- (CGFloat)titleFontInFJSlidingController:(FJSlidingController *)fjSlidingController;
@end

@protocol FJSlidingControllerDelegate <NSObject>
@optional
// selctedIndex
- (void)fjSlidingController:(FJSlidingController *)fjSlidingController selectedIndex:(NSInteger)index;
// selectedController
- (void)fjSlidingController:(FJSlidingController *)fjSlidingController selectedController:(UIViewController *)controller;
// selectedTitle
- (void)fjSlidingController:(FJSlidingController *)fjSlidingController selectedTitle:(NSString *)title;
@end
