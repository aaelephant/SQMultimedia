//
//  SMPrograssView.h
//  BleMall
//
//  Created by wei wu on 14/11/27.
//  Copyright (c) 2014年 blemall. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface SMProgressView : NSObject
+ (void)show;
+ (void)showWithStatus:(NSString*)string;
+ (void)dismiss;
@end
