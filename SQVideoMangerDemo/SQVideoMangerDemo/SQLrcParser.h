//
//  SQLrcParser.h
//  SQVideoMangerDemo
//
//  Created by qbshen on 16/9/26.
//  Copyright © 2016年 qbshen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SQLrcParser : NSObject
//时间
@property (nonatomic,strong) NSMutableArray *timerArray;
//歌词
@property (nonatomic,strong) NSMutableArray *wordArray;


//解析歌词
-(void) parseLrc;
//解析歌词
-(void) parseLrc:(NSString*)lrc;
@end
