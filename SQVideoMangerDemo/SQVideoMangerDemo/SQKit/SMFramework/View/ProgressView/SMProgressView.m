//
//  SMPrograssView.m
//  BleMall
//
//  Created by wei wu on 14/11/27.
//  Copyright (c) 2014年 blemall. All rights reserved.
//

#import "SMProgressView.h"
#import "SVProgressHUD.h"

@implementation SMProgressView
+ (void)show{
    [SVProgressHUD setDefaultStyle:SVProgressHUDStyleDark];
//    [SVProgressHUD showWithMaskType:SVProgressHUDMaskTypeBlack];
}

+ (void)showWithStatus:(NSString*)string
{
    
    [SVProgressHUD showProgress:-1 status:string];
//    [SVProgressHUD showProgress:-1 status:string maskType:SVProgressHUDMaskTypeNone];
}
+ (void)dismiss{
    [SVProgressHUD dismiss];
}
@end

