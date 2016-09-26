//
//  SQLrcParser.m
//  SQVideoMangerDemo
//
//  Created by qbshen on 16/9/26.
//  Copyright © 2016年 qbshen. All rights reserved.
//

#import "SQLrcParser.h"


@implementation SQLrcParser
-(instancetype) init{
    self=[super init];
    if(self!=nil){
        self.timerArray=[[NSMutableArray alloc] init];
        self.wordArray=[[NSMutableArray alloc] init];
    }
    return  self;
}



-(NSString *)getLrcFile:(NSString *)lrc{
    NSString* filePath=[[NSBundle mainBundle] pathForResource:lrc ofType:@"lrc"];
    return  [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
}
//测试示例
-(void)parseLrc{
    [self parseLrc:[self getLrcFile:@"时间都去哪儿了"]];
}


-(void)parseLrc:(NSString *)lrc{
    NSLog(@"%@",lrc);
    
    if(![lrc isEqual:nil]){
        NSArray *sepArray=[lrc componentsSeparatedByString:@"["];
        NSArray *lineArray=[[NSArray alloc] init];
        for(int i=0;i<sepArray.count;i++){
            if([sepArray[i] length]>0){
                lineArray=[sepArray[i] componentsSeparatedByString:@"]"];
                if(![lineArray[0] isEqualToString:@"\n"]){
                    [self.timerArray addObject:lineArray[0]];
                    
                    [self.wordArray addObject:lineArray.count>1?lineArray[1]:@""];
                }
            }
        }
    }
}
@end
