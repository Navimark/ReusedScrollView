//
//  HomeViewController.m
//  ReusedScrollView
//
//  Created by Mike Chen on 13-7-9.
//  Copyright (c) 2013年 BeyondSoft Co.,Ltd. All rights reserved.
//

#import "HomeViewController.h"
#import "ItemView.h"
#include <objc/runtime.h>

NSString const *const kkNewPropertyKey = @"MyButtonIndexPropertyKey";
@implementation UIScrollView (esxtraVariable)

@dynamic didVisibleFrameChanged;

- (void)setDidVisibleFrameChanged:(NSString *)didVisibleFrameChanged
{
    objc_setAssociatedObject(self,kkNewPropertyKey,didVisibleFrameChanged,OBJC_ASSOCIATION_RETAIN);
}

- (NSString *)didVisibleFrameChanged
{
    return objc_getAssociatedObject(self, kkNewPropertyKey);
}

@end

@interface HomeViewController ()
{
    CGFloat maxThreePoint[3];
}
@property (nonatomic , retain) NSMutableArray *dataSource;
@property (nonatomic , retain) UIScrollView *mainScrollView;


@end

@implementation HomeViewController
@synthesize mainScrollView = _mainScrollView;

- (UIScrollView *)mainScrollView
{
    if (!_mainScrollView) {
        UIScrollView *scrollView = [[[UIScrollView alloc] initWithFrame:(CGRect){(CGPoint){0,0},(CGSize){320,548}}] autorelease];
        scrollView.delegate = self;
        scrollView.backgroundColor = [UIColor clearColor];
        scrollView.contentSize = CGSizeMake(self.view.frame.size.width, self.view.frame.size.height + 20);
        scrollView.showsVerticalScrollIndicator = YES;
        return _mainScrollView = scrollView;
    } else {
        return _mainScrollView;
    }
}

- (void)dealloc
{
    [_mainScrollView removeObserver:nil forKeyPath:@"didVisibleFrameChanged"];
    [_mainScrollView release];
    [super dealloc];
}

- (id)init
{
    self = [super init];
    if (self) {
        memset(maxThreePoint, 0, sizeof(CGFloat) * 3);
    }
    return self;
}

- (void)loadView
{
    [super loadView];
    [self.view addSubview:self.mainScrollView];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.navigationItem.title = @"重用";
    [self loadAnotherItemsWithNumber:50];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma -
#pragma - 私有函数

//找到最大的Y的下标
- (NSInteger)findIndexOfMaxY
{
    NSInteger index = 0;
    for (int i =0; i != 3; ++ i) {
        if (maxThreePoint[i] > maxThreePoint[index]) {
            index = i;
        }
    }
    return index;
}

//找到最小的Y的下标
- (NSInteger)findIndexOfMinY
{
    NSInteger index = 0;
    for (int i = 0; i != 3; ++ i) {
        if (maxThreePoint[i] < maxThreePoint[index]) {
            index = i;
        }
    }
    return index;
}

- (void)refreshScrollView
{
//    脚丫（鸭）   手机（鸡）
}

- (void)loadAnotherItemsWithNumber:(NSInteger )count
{
    for (int i = 0; i != count; ++ i) {
        CGRect itemFrame = [DataHelper randomRect];
        NSInteger minIndexOfY = [self findIndexOfMinY];
        CGFloat topOffSetY = (maxThreePoint[minIndexOfY] == 0 ? 5 : 10);
        itemFrame.origin = CGPointMake(minIndexOfY * kWaterItemWidth + 8 + minIndexOfY * 10, maxThreePoint[minIndexOfY] + topOffSetY);
        ItemView *shit = [[ItemView alloc] initWithFrame:itemFrame];
        [self.mainScrollView addObserver:shit forKeyPath:@"didVisibleFrameChanged" options:NSKeyValueObservingOptionNew context:NULL];
        [self.mainScrollView addSubview:shit];
        //更新
        maxThreePoint[minIndexOfY] = CGRectGetMaxY(shit.frame);
        [shit release];
    }
    [self.mainScrollView setContentSize:CGSizeMake(self.mainScrollView.contentSize.width, maxThreePoint[[self findIndexOfMaxY]] + 5)];
}

#pragma mark -
#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    [self.mainScrollView setValue:NSStringFromCGPoint(scrollView.contentOffset) forKey:@"didVisibleFrameChanged"];
}

@end
