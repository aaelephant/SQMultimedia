//
//  SNDefineUtil.h
//  soccernotes
//
//  Created by sqb on 15/7/27.
//  Copyright (c) 2015年 sqp. All rights reserved.
//

#ifndef soccernotes_LWDefineUtil_h
#define soccernotes_LWDefineUtil_h


#define NOTIF_LOGIN (@"notif_login")
#define TemporaryNotOpened @"暂未开通"
#define DEFAULT_IMAGE_STR (@"default_image")
#define HOLDER_IMAGE ([UIImage imageNamed:DEFAULT_IMAGE_STR])

#define DEFAULT_HEAD_IMAGE_STR (@"default_head_image")
#define HOLDER_HEAD_IMAGE ([UIImage imageNamed:DEFAULT_HEAD_IMAGE_STR])

#define HANDLE_NULL_STR(str) ( {  NSString *curStr = nil;  if([str length]>0){curStr = str;}else{curStr = @"无";} curStr;})

#endif

#define IS_IPHONE_5 ( fabs( ( double )[ [ UIScreen mainScreen ] bounds ].size.height - ( double )568 ) < DBL_EPSILON )

#define RGBACOLOR(r,g,b,a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]

#define KNOTIFICATION_LOGINCHANGE @"loginStateChange"

#define CHATVIEWBACKGROUNDCOLOR [UIColor colorWithRed:0.936 green:0.932 blue:0.907 alpha:1]

#define is_IOS_7 ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0)

#define COLOR_RGB(R,G,B,P) ([UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:P])
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue&0xFF0000)>>16))/255.0 green:((float)((rgbValue&0xFF00)>>8))/255.0 blue:((float)(rgbValue&0xFF))/255.0 alpha:1.0]

#define SCREEN_WHIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)

#define kTabHeight 44
#define kBottomHeight 49
#define kStatusBarHeight 20

#define NAV_AND_STATUS_BAR_HEIGHT (64)
#define TAB_BAR_HEIGHT (40)
#ifdef DEBUG
#define NSLog(...) NSLog(__VA_ARGS__)
#define debugMethod() NSLog(@"%s", __func__)

#else
#define NSLog(...)
#define debugMethod()

#endif

#define TAG
#ifdef TAG
#define SMToast(TEXT) ([SMToastView showMessageCenter:self.view.window withMessage:TEXT? TEXT:@""])
#define SMToastInView(TEXT,VIEW) ([SMToastView showMessageCenter:VIEW withMessage:TEXT? TEXT:@""])
#define SMToastInKeyWindow(TEXT) ([SMToastView showMessageCenter:[UIApplication sharedApplication].keyWindow withMessage:TEXT? TEXT:@""])

#else
#define SMToast(TEXT)
#endif

