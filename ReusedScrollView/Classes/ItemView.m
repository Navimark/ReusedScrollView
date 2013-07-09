//
//  ItemView.m
//  ReusedScrollView
//
//  Created by Mike Chen on 13-7-9.
//  Copyright (c) 2013年 BeyondSoft Co.,Ltd. All rights reserved.
//

#import "ItemView.h"

@implementation ItemView

- (ItemView *)allocItemView
{
//    int from = 1;
//    int to = 2147483647;
//    int randNumber = arc4random()%(to - from + 1);
//    return  (int)(from + randNumber);
    CGRect tempFrame = (CGRect){};
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
