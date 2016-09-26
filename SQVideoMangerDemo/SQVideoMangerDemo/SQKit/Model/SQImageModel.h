//
//  ImageModel.h
//  Photovoltaic
//
//  Created by sqb on 16/1/4.
//  Copyright © 2016年 sqp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SQImageModel : NSObject
@property NSString * uuid;
@property NSString * imageSuffix;
@property NSString * imageName;
@property NSString * thumbImage;
@property NSString * originImage;
@property NSString * localImage;
@property UIImage * thumbDataImage;
@property UIImage * dataImage;
@property NSString * thumbImagePath;
@property NSString * imagePath;
@property CGSize imageSize;
@end
