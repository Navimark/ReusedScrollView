//
//  DataHelper.m
//  ReusedScrollView
//
//  Created by Mike Chen on 13-7-9.
//  Copyright (c) 2013年 BeyondSoft Co.,Ltd. All rights reserved.
//

#import "DataHelper.h"

@implementation DataHelper

+ (void)drawBounder:(UIView *)view bounderColor:(UIColor *)color
{
    [view.layer setBorderWidth:2.0];
    [view.layer setBorderColor:color.CGColor];
}

+ (CGRect)randomRect
{
    CGFloat itemHeigt = arc4random()%(kItemMaxHeight - kItemMinHeight + 1) + kItemMinHeight;
    return (CGRect){{0,0},(CGSize){kWaterItemWidth,itemHeigt}};
}

@end
