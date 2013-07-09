//
//  ItemView.m
//  ReusedScrollView
//
//  Created by Mike Chen on 13-7-9.
//  Copyright (c) 2013年 BeyondSoft Co.,Ltd. All rights reserved.
//

#import "ItemView.h"

static NSInteger counter = 0;

@interface ItemView ()
{
    NSInteger selfCounter;
}
@property (nonatomic , retain) UILabel *label;

@end

@implementation ItemView
@synthesize label = _label;

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if ([keyPath isEqualToString:@"didVisibleFrameChanged"]) {
        UIScrollView *mainScrollView = object;
        CGPoint scrollViewOffSet = CGPointFromString([change objectForKey:@"new"]);
        CGRect scrollViewVisibleFrame = (CGRect){scrollViewOffSet,mainScrollView.frame.size};
        CGRect targetRect = [mainScrollView convertRect:self.frame toView:mainScrollView];
        if (!CGRectIntersectsRect(scrollViewVisibleFrame, targetRect)) {
            [self deLoadImage];
        } else {
            [self loadImage];
        }
    }
}

- (void)dealloc
{
    [_label release];
    [super dealloc];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [self randomColor];
        self.layer.cornerRadius = 3.0;
        self.clipsToBounds = YES;
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, kWaterItemWidth, 30)];
        label.textAlignment = NSTextAlignmentCenter;
        label.textColor = [UIColor blackColor];
        label.clipsToBounds = YES;
        label.layer.cornerRadius = 3.0;
        label.text = [NSString stringWithFormat:@"%d",++counter];
        selfCounter = counter;
        label.backgroundColor = [UIColor colorWithWhite:150 / 255. alpha:0.5];
        self.label = label;
        [self addSubview:_label];
        [label release];
        
    }
    return self;
}

- (void)loadImage
{
    double delayInSeconds = 0.5;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
//        self.label.text = [NSString stringWithFormat:@"%d",selfCounter];
        [UIView animateWithDuration:0.3 animations:^(void){
            self.label.alpha = 1.0;
        }];
    });
}

- (void)deLoadImage
{
//    self.label.text = @"";
    self.label.alpha = 0.0;
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
