//
//  UIScrollView+SMRefresh.m
//  DTPocket
//
//  Created by sqb on 15-2-13.
//  Copyright (c) 2015年 sqp. All rights reserved.
//

#import "UIScrollView+SMRefresh.h"
#import <objc/runtime.h>
#import "SMSRefreshControl.h"

static const void *ISHeaderRefreshControlKey = &ISHeaderRefreshControlKey;
static const void *ISHeaderRefreshCallbackKey = &ISHeaderRefreshCallbackKey;

@interface UIScrollView ()
@property (nonatomic, strong) SMSRefreshControl *headerRefreshControl;
@property (nonatomic, strong) voidBlock headerRefreshCallback;
@end

@implementation UIScrollView (SMRefresh)

-(void)addHeaderRefreshWithCallback:(voidBlock)block
{
    SMSRefreshControl * refreshC = [[SMSRefreshControl alloc]init];
    
    self.headerRefreshControl = refreshC;
    if (block) {
        self.headerRefreshCallback = block;
        [refreshC addTarget:self
                     action:@selector(headerRefreshComplate:)
           forControlEvents:UIControlEventValueChanged];
    }
    [self addSubview:refreshC];
}

-(void)beginRefreshing
{
    [self.headerRefreshControl beginRefreshing];
}

-(void)endRefreshing
{
    [self.headerRefreshControl endRefreshing];
}

- (void)headerRefreshComplate:(UIRefreshControl *)refreshControl{
    [self.headerRefreshControl updateRefreshingTitle:@"正在刷新"];
    if (self.headerRefreshCallback) {
        self.headerRefreshCallback();
    }
}

#pragma mark setter & getter

-(voidBlock)headerRefreshCallback{
    return objc_getAssociatedObject(self, ISHeaderRefreshCallbackKey);
}
-(void)setHeaderRefreshCallback:(voidBlock)headerRefreshCallback{
    objc_setAssociatedObject(self, ISHeaderRefreshCallbackKey, headerRefreshCallback, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UIRefreshControl *)headerRefreshControl{
    return objc_getAssociatedObject(self, ISHeaderRefreshControlKey);
}
-(void)setHeaderRefreshControl:(UIRefreshControl *)headerRefreshControl{
    objc_setAssociatedObject(self, ISHeaderRefreshControlKey, headerRefreshControl, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
