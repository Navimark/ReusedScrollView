//
//  HomeViewController.m
//  ReusedScrollView
//
//  Created by Mike Chen on 13-7-9.
//  Copyright (c) 2013年 BeyondSoft Co.,Ltd. All rights reserved.
//

#import "HomeViewController.h"
#import "ItemView.h"

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
    [DataHelper drawBounder:self.mainScrollView bounderColor:[UIColor yellowColor]];
    [self.view addSubview:self.mainScrollView];
//    NSLog(@"self.mainScrollView = %@",self.mainScrollView);
    NSLog(@"self.view = %@",self.view);
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.navigationItem.title = @"重用";
    ItemView *shit = [[ItemView alloc] initWithFrame:[DataHelper randomRectWithOrignalPoint:CGPointMake(0, 0)]];
//    self.view conv
    NSLog(@"%@",shit);
    [self.mainScrollView addSubview:shit];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma -
#pragma - 私有函数

- (void)refreshScrollView
{
    
}

- (void)loadAnotherItemsWithNumber:(NSInteger )count
{
    
}

#pragma mark -
#pragma mark - UIScrollViewDelegate

@end
