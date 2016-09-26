//
//  UIScrollView+SMRefresh.h
//  DTPocket
//
//  Created by sqb on 15-2-13.
//  Copyright (c) 2015年 sqp. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^voidBlock)(void);

@interface UIScrollView (SMRefresh)

- (void)addHeaderRefreshWithCallback:(voidBlock)block;

- (void)beginRefreshing;

- (void)endRefreshing;


@end
