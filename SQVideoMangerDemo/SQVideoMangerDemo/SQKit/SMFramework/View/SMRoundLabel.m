//
//  SMRoundLabel.m
//  MIFI360
//
//  Created by wei wu on 14-10-7.
//  Copyright (c) 2014年 qihoo360. All rights reserved.
//

#import "SMRoundLabel.h"

#define DEF_CORNER_RADIUS  (18.0f)

@implementation SMRoundLabel
-(instancetype)initWithFrame:(CGRect)aRect{
    self = [super initWithFrame:aRect];
    if (nil != self){
        [self initializeData];
    }
    return self;
}
- (id)initWithCoder:(NSCoder *)decoder{
    self = [super initWithCoder:decoder];
    if (nil != self){
        [self initializeData];
    }
    return self;
}
-(void)initializeData{
    _cornerRadius = DEF_CORNER_RADIUS;
}
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    [self drawBorder:rect];
    [super drawRect:rect];
}
-(void)drawBorder:(CGRect)rect
{
    // [self.layer setCornerRadius:[self cornerRadius]];
    // self.layer.borderColor = [UIColor whiteColor].CGColor;
    // self.layer.borderWidth = 2.0f;
    // [self.layer setMasksToBounds:YES];

    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                                   byRoundingCorners:UIRectCornerAllCorners
                                                         cornerRadii:CGSizeMake(20.0, 30.0)];
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    maskLayer.frame         = self.bounds;
    maskLayer.path          = maskPath.CGPath;
    self.layer.mask         = maskLayer;
}
@end
