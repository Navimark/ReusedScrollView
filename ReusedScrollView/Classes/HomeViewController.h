//
//  HomeViewController.h
//  ReusedScrollView
//
//  Created by Mike Chen on 13-7-9.
//  Copyright (c) 2013年 BeyondSoft Co.,Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIScrollView (esxtraVariable)

@property (nonatomic , retain) NSString *didVisibleFrameChanged;

@end

@interface HomeViewController : UIViewController <UIScrollViewDelegate>

@end
