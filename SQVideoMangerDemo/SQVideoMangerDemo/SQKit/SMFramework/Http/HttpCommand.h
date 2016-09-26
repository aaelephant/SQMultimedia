//
//  HttpCommad.h
//  HttpExamples
//
//  Created by wei wu on 14-7-18.
//  Copyright (c) 2014年 www.smilingmobile.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HttpCommandProtocol.h"

@class RequestResult;

@interface HttpCommand : NSObject <HttpCommandProtocol>
{
    @protected
    NSDictionary *requestInfo_;
    RequestResult *result_;
}
@property(nonatomic,retain) NSDictionary *requestInfo;
@property(nonatomic,retain) RequestResult *result;
@property(nonatomic,retain) id<HttpCommandProtocol> delegate;
@property(nonatomic,retain) id<HttpCommandCompleteDelegate> completeDelegate;
@property NSString *version;
@property(nonatomic) BOOL needVerify;
@property BOOL needOtherParams;

-(instancetype)initWithVersion:(NSString *)version;
-(instancetype)initWithVerify:(BOOL)needVerify;
-(instancetype)initWithOtherParamsNeed:(BOOL)needOtherParams;
-(instancetype)initWithVerify:(BOOL)needVerify withOtherParamsNeed:(BOOL)needOtherParams;
-(void)invokeComplete;
-(NSString *)getBaseUrl;
-(NSString *)getActionUrl;
-(NSDictionary *)getRequestParam;
@property (copy) void(^loginCompleteBlock)(RequestResult*,id);
@property (copy) void(^loginCancleBlock)();

+(HttpCommand *) httpCommandWithVersion:(NSString *)version;
@end
