//
//  DTPAccountData.m
//  DTPocket
//
//  Created by sqb on 15-2-12.
//  Copyright (c) 2015年 sqp. All rights reserved.
//

#import "SQAccountData.h"

#define USERDEFAULT_EMAIL       @"email"
#define USERDEFAULT_PHONE       @"phone"
#define USERDEFAULT_NAME       @"username"
#define USERDEFAULT_EASE_NAME       @"easename"
#define USERDEFAULT_TEAM_NUM      @"teamNum"
#define USERDEFAULT_ICON       @"icon"
#define USERDEFAULT_REAL_ICON       @"real_icon"

#define USERDEFAULT_PWD         @"pwd"
#define USERDEFAULT_IS_FIRST    @"is_first"
#define USERDEFAULT_SESSION_ID  @"session_id"
#define USERDEFAULT_IS_LOGIN    @"is_login"
#define USERDEFAULT_ROLE       @"role"
#define USERDEFAULT_MSG_NUM       @"msg_num"


#define NET_IN_WF_DOWNLOAD       @"only_wifi_to_download"

#define USERDEFAULT_ACCOUNT_ID  @"account_id"

#define USERDEFAULT_SEX  @"sex"

#define USERDEFAULT_AREA  @"area"

#define USERDEFAULT_SCHOOL  @"school"

#define USERDEFAULT_SPECIALTY  @"Specialty"

#define USERDEFAULT_SETTING_PLAY_SOUND  @"play_sound"
#define USERDEFAULT_SETTING_PLAY_VIBRATION  @"play_vibration"
#define USERDEFAULT_SETTING_PLAY_RECORD  @"play_record"

#define UPLOAD_USER_LOCATION @"upload_user_location"

#define LOGIN_BIND_TYPE @"login_bind_type"


@implementation SQAccountData
+ (SQAccountData *)sharedInstance {
    static SQAccountData *accountInstance = nil;
    static dispatch_once_t pre;
    dispatch_once(&pre, ^{ accountInstance = [[SQAccountData alloc] init]; });
    return accountInstance;
}

- (void)clearAccountData
{
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:USERDEFAULT_SESSION_ID];
    [[NSUserDefaults standardUserDefaults]
     removeObjectForKey:USERDEFAULT_IS_LOGIN];
    [[NSUserDefaults standardUserDefaults]
     removeObjectForKey:USERDEFAULT_EMAIL];
    [[NSUserDefaults standardUserDefaults]
     removeObjectForKey:USERDEFAULT_PHONE];
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:USERDEFAULT_NAME];
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:USERDEFAULT_ICON];
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:USERDEFAULT_MSG_NUM];
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:NET_IN_WF_DOWNLOAD];
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:USERDEFAULT_ACCOUNT_ID];
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:USERDEFAULT_SEX];
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:USERDEFAULT_AREA];
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:USERDEFAULT_SCHOOL];
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:USERDEFAULT_SPECIALTY];
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:USERDEFAULT_SETTING_PLAY_SOUND];
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:USERDEFAULT_SETTING_PLAY_VIBRATION];
        [[NSUserDefaults standardUserDefaults] removeObjectForKey:USERDEFAULT_SETTING_PLAY_RECORD];
        [[NSUserDefaults standardUserDefaults] removeObjectForKey:UPLOAD_USER_LOCATION];

    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (bool)isFirstLaunch
{
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    bool isFirst = [userDefault boolForKey:USERDEFAULT_IS_FIRST];
    [[NSUserDefaults standardUserDefaults] setBool:YES forKey:USERDEFAULT_IS_FIRST];
    [[NSUserDefaults standardUserDefaults] synchronize];
    return !isFirst;
}

- (bool)isLogin
{
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    bool isLogin = [userDefault boolForKey:USERDEFAULT_IS_LOGIN];
    return isLogin;
}

- (void)saveLoginState:(bool) isLogin
{
    [[NSUserDefaults standardUserDefaults] setBool:isLogin forKey:USERDEFAULT_IS_LOGIN];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (bool)isOnlyWiFi
{
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    bool isOnlywf = [userDefault boolForKey:NET_IN_WF_DOWNLOAD];
    return isOnlywf;
}

- (void)saveOnlyWiFi:(bool) isOnlyWiFi
{
    [[NSUserDefaults standardUserDefaults] setBool:isOnlyWiFi forKey:NET_IN_WF_DOWNLOAD];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (void)saveSessionId:(NSString *)sessionId
{
    [[NSUserDefaults standardUserDefaults] setValue:sessionId forKey:USERDEFAULT_SESSION_ID];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (NSString *)getSessionId
{
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    NSString *sessionId = [NSString stringWithFormat:@"%@",[userDefault objectForKey:USERDEFAULT_SESSION_ID]];
    if (!sessionId || [sessionId isEqualToString:@""] || [sessionId isEqualToString:@"(null)"])
    {
        return @"";
    }
    return sessionId;
}

- (void)saveEmail:(NSString *) email
{
    [[NSUserDefaults standardUserDefaults] setValue:email forKey:USERDEFAULT_EMAIL];
    [[NSUserDefaults standardUserDefaults] synchronize];
}
- (NSString*)getEmail
{
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    NSString * curEmail = [userDefault objectForKey:USERDEFAULT_EMAIL];
    if (!curEmail || [curEmail isEqualToString:@""])
    {
        return nil;
    }
    NSString *email = [NSString stringWithFormat:@"%@",[userDefault objectForKey:USERDEFAULT_EMAIL]];
    return email;
}
-(void)savePhone:(NSString*)phone
{
    [[NSUserDefaults standardUserDefaults] setValue:phone forKey:USERDEFAULT_PHONE];
    [[NSUserDefaults standardUserDefaults] synchronize];
}
-(NSString*)getPhone
{
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    NSString * curPhone = [userDefault objectForKey:USERDEFAULT_PHONE];
    NSLog(@"%@",curPhone);
    if (!curPhone || [curPhone isEqualToString:@""])
    {
        return nil;
    }
    NSString *phone = [NSString stringWithFormat:@"%@",curPhone];
    return phone;
}
-(void)saveName:(NSString*)name
{
    [[NSUserDefaults standardUserDefaults] setValue:name forKey:USERDEFAULT_NAME];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

-(NSString*)getName
{
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    NSString *name = [userDefault objectForKey:USERDEFAULT_NAME];
    if (!name || [name isEqualToString:@""])
    {
        return nil;
    }
    return name;
}

-(void)saveEaseName:(NSString*)name
{
    [[NSUserDefaults standardUserDefaults] setValue:name forKey:USERDEFAULT_EASE_NAME];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

-(NSString*)getEaseName
{
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    NSString *name = [userDefault objectForKey:USERDEFAULT_EASE_NAME];
    if (!name || [name isEqualToString:@""])
    {
        return nil;
    }
    return name;
}

-(void)saveTeamNum:(NSString*)teamNum
{
    [[NSUserDefaults standardUserDefaults] setValue:teamNum forKey:USERDEFAULT_TEAM_NUM];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

-(NSString*)getTeamNum
{
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    NSString *teamNum = [userDefault objectForKey:USERDEFAULT_TEAM_NUM];
    if (!teamNum || [teamNum isEqualToString:@""])
    {
        return nil;
    }
    return teamNum;
}

-(void)saveIcon:(NSString*)icon
{
    [[NSUserDefaults standardUserDefaults] setValue:icon forKey:USERDEFAULT_ICON];
    [[NSUserDefaults standardUserDefaults] synchronize];
}
-(NSString*)getIcon
{
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    NSString *icon = [userDefault objectForKey:USERDEFAULT_ICON];
    if (!icon || [icon isEqualToString:@""])
    {
        return nil;
    }
    return icon;
}

-(void)saveRealIcon:(NSString*)icon
{
    [[NSUserDefaults standardUserDefaults] setValue:icon forKey:USERDEFAULT_REAL_ICON];
    [[NSUserDefaults standardUserDefaults] synchronize];
}
-(NSString*)getRealIcon
{
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    NSString *icon = [userDefault objectForKey:USERDEFAULT_REAL_ICON];
    if (!icon || [icon isEqualToString:@""])
    {
        return nil;
    }
    return icon;
}


-(void)saveMsgNum:(NSString*)num
{
    [[NSUserDefaults standardUserDefaults] setValue:num forKey:USERDEFAULT_MSG_NUM];
    [[NSUserDefaults standardUserDefaults] synchronize];
}
-(NSString*)getMsgNum
{
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    NSString *num = [userDefault objectForKey:USERDEFAULT_MSG_NUM];
    if ([num integerValue] == 0) {
        return nil;
    }
    if (!num || [num isEqualToString:@""])
    {
        return nil;
    }
    return num;
}



- (void)saveAccountId:(NSString *)accountId
{
    [[NSUserDefaults standardUserDefaults] setValue:accountId forKey:USERDEFAULT_ACCOUNT_ID];
    [[NSUserDefaults standardUserDefaults] synchronize];

}

- (NSString *)getAccountId
{
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    NSString *num = [userDefault objectForKey:USERDEFAULT_ACCOUNT_ID];
    if ([num integerValue] == 0) {
        return nil;
    }
    if (!num || [num isEqualToString:@""])
    {
        return nil;
    }
    return num;
}

- (void)saveSex:(NSString *)sex
{
    [[NSUserDefaults standardUserDefaults] setValue:sex forKey:USERDEFAULT_SEX];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
}

- (NSString *)getSex
{
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    NSString *num = [userDefault objectForKey:USERDEFAULT_SEX];
    if ([num integerValue] == 0) {
        return nil;
    }
    if (!num || [num isEqualToString:@""])
    {
        return nil;
    }
    return num;
}

- (void)saveArea:(NSString *)area
{
    [[NSUserDefaults standardUserDefaults] setValue:area forKey:USERDEFAULT_AREA];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
}

- (NSString *)getArea
{
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    NSString *num = [userDefault objectForKey:USERDEFAULT_AREA];
    if ([num integerValue] == 0) {
        return nil;
    }
    if (!num || [num isEqualToString:@""])
    {
        return nil;
    }
    return num;
}

- (void)saveSchool:(NSString *)school
{
    [[NSUserDefaults standardUserDefaults] setValue:school forKey:USERDEFAULT_SCHOOL];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
}

- (NSString *)getSchool
{
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    NSString *num = [userDefault objectForKey:USERDEFAULT_SCHOOL];
    if ([num integerValue] == 0) {
        return nil;
    }
    if (!num || [num isEqualToString:@""])
    {
        return nil;
    }
    return num;
}



- (void)saveSpecialty:(NSString *)specialty
{
    [[NSUserDefaults standardUserDefaults] setValue:specialty forKey:USERDEFAULT_SPECIALTY];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
}

- (NSString *)getSpecialty
{
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    NSString *num = [userDefault objectForKey:USERDEFAULT_SPECIALTY];
    if ([num integerValue] == 0) {
        return nil;
    }
    if (!num || [num isEqualToString:@""])
    {
        return nil;
    }
    return num;
}

- (bool)isPlaySound
{
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    bool isOnlywf = [userDefault boolForKey:USERDEFAULT_SETTING_PLAY_SOUND];
    return isOnlywf;
}

- (void)savePlaySound:(bool) isPlaySound
{
    [[NSUserDefaults standardUserDefaults] setBool:isPlaySound forKey:USERDEFAULT_SETTING_PLAY_SOUND];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (bool)isPlayVibration
{
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    bool isOnlywf = [userDefault boolForKey:USERDEFAULT_SETTING_PLAY_VIBRATION];
    return isOnlywf;
}

- (void)savePlayVibration:(bool) isPlayVibration
{
    [[NSUserDefaults standardUserDefaults] setBool:isPlayVibration forKey:USERDEFAULT_SETTING_PLAY_VIBRATION];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (bool)isPlayRecord
{
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    bool isOnlywf = [userDefault boolForKey:USERDEFAULT_SETTING_PLAY_RECORD];
    return isOnlywf;
}

- (void)savePlayRecord:(bool) isPlayRecord
{
    [[NSUserDefaults standardUserDefaults] setBool:isPlayRecord forKey:USERDEFAULT_SETTING_PLAY_RECORD];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (bool)isUploadLocation
{
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    bool isOnlywf = [userDefault boolForKey:UPLOAD_USER_LOCATION];
    return isOnlywf;
}

- (void)saveUploadLocation:(bool) isUploadLocation
{
    [[NSUserDefaults standardUserDefaults] setBool:isUploadLocation forKey:UPLOAD_USER_LOCATION];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (NSString*)getBindLogintype
{
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    NSString* isOnlywf = [userDefault valueForKey:LOGIN_BIND_TYPE];
    return isOnlywf.length == 0?  @"":isOnlywf;
}

- (void)saveBindLogintype:(NSString*)bindlogintype
{
    [[NSUserDefaults standardUserDefaults] setValue:bindlogintype forKey:LOGIN_BIND_TYPE];
    [[NSUserDefaults standardUserDefaults] synchronize];
}



@end
