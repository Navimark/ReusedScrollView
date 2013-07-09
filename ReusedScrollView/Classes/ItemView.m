//
//  ItemView.m
//  ReusedScrollView
//
//  Created by Mike Chen on 13-7-9.
//  Copyright (c) 2013年 BeyondSoft Co.,Ltd. All rights reserved.
//

#import "ItemView.h"

@implementation ItemView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [self randomColor];
        self.layer.cornerRadius = 3.0;
    }
    return self;
}

- (UIColor *)randomColor
{
    return [UIColor colorWithRed:arc4random()%10 / 10. green:arc4random()%10 /10. blue:arc4random()%10 /10. alpha:1];
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
