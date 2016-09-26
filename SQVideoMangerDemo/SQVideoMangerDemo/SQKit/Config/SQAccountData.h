//
//  DTPAccountData.h
//  DTPocket
//
//  Created by ; on 15-2-12.
//  Copyright (c) 2015年 sqp. All rights reserved.
//

#import <Foundation/Foundation.h>

#define LOGIN_BIND_TYPE_QQ @"login_bind_type_qq"
#define LOGIN_BIND_TYPE_WEICHAT @"login_bind_type_weichat"
#define LOGIN_BIND_TYPE_PHONE @"login_bind_type_phone"


@interface SQAccountData : NSObject
+ (SQAccountData *)sharedInstance;
- (bool)isFirstLaunch;
- (bool)isLogin;
- (void)saveLoginState:(bool) isLogin;
- (bool)isOnlyWiFi;
- (void)saveOnlyWiFi:(bool) isOnlyWiFi;
- (void)saveSessionId:(NSString *)sessionId;
- (NSString *)getSessionId;
- (NSString *)getSex;

- (void)saveArea:(NSString *)area;
- (NSString *)getArea;
- (void)saveSchool:(NSString *)school;
- (NSString *)getSchool;
- (void)saveSpecialty:(NSString *)specialty;
- (NSString *)getSpecialty;


- (void)saveAccountId:(NSString *)accountId;
- (NSString *)getAccountId;
- (void)saveSex:(NSString *)sex;

- (void)clearAccountData;
- (void)saveEmail:(NSString *) email;
- (NSString *)getEmail;
-(void)savePhone:(NSString*)phone;
-(NSString *)getPhone;
-(void)saveName:(NSString*)name;
-(NSString *)getName;
-(void)saveEaseName:(NSString*)name;
-(NSString*)getEaseName;
-(void)saveIcon:(NSString*)icon;
-(NSString *)getIcon;
-(void)saveTeamNum:(NSString*)teamNum;
-(NSString*)getTeamNum;
-(void)saveRealIcon:(NSString*)icon;
-(NSString*)getRealIcon;
-(void)saveMsgNum:(NSString*)num;
-(NSString*)getMsgNum;

- (bool)isPlaySound;
- (void)savePlaySound:(bool) isPlaySound;
- (bool)isPlayVibration;
- (void)savePlayVibration:(bool) isPlayVibration;
- (bool)isPlayRecord;
- (void)savePlayRecord:(bool) isPlayRecord;

- (bool)isUploadLocation;
- (void)saveUploadLocation:(bool) isUploadLocation;
-(NSString*)getBindLogintype;
- (void)saveBindLogintype:(NSString*)bindlogintype;
@end
