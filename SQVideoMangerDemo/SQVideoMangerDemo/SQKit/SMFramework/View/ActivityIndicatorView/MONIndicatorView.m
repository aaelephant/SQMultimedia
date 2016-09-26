//
//  MONIndicatorView.m
//  DTPocket
//
//  Created by sqb on 15-2-9.
//  Copyright (c) 2015年 sqp. All rights reserved.
//

#import "MONIndicatorView.h"


@interface MONIndicatorView ()<MONActivityIndicatorViewDelegate>

@end

@implementation MONIndicatorView

-(instancetype)initWithParentView:(UIView*)parentView
{
    self = [super init];
    if (self) {
        [self showIndicator:parentView];
    }
    return self;
}
-(void)showIndicator:(UIView*)parentView
{
    self.delegate = self;
    self.numberOfCircles = 3;
    self.radius = 10;
    self.internalSpacing = 3;
    self.center = parentView.center;
    [self startAnimating];
//    [NSTimer scheduledTimerWithTimeInterval:7 target:self selector:@selector(stopAnimating) userInfo:nil repeats:NO];
    [NSTimer scheduledTimerWithTimeInterval:9 target:self selector:@selector(startAnimating) userInfo:nil repeats:NO];
}

#pragma mark -
#pragma mark - MONActivityIndicatorViewDelegate Methods

- (UIColor *)activityIndicatorView:(MONActivityIndicatorView *)activityIndicatorView
      circleBackgroundColorAtIndex:(NSUInteger)index {
    CGFloat red   = (arc4random() % 256)/255.0;
    CGFloat green = (arc4random() % 256)/255.0;
    CGFloat blue  = (arc4random() % 256)/255.0;
    CGFloat alpha = 1.0f;
    return [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
}


@end
