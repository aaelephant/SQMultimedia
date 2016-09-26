//
//  SQMergeController.h
//  SQVideoMangerDemo
//
//  Created by qbshen on 16/9/25.
//  Copyright © 2016年 qbshen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import <CoreMedia/CoreMedia.h>
#import <MobileCoreServices/UTCoreTypes.h>
#import <AssetsLibrary/AssetsLibrary.h>
#import <MediaPlayer/MediaPlayer.h>
@interface SQMergeController : UIViewController<UIImagePickerControllerDelegate,UINavigationControllerDelegate,MPMediaPickerControllerDelegate>{
    BOOL isSelectingAssetOne;
}

@property(nonatomic,retain)AVAsset* firstAsset;
@property(nonatomic,retain)AVAsset* secondAsset;
@property(nonatomic,retain)AVAsset* audioAsset;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *ActivityView;
@property (weak, nonatomic) IBOutlet UIImageView *twoImage;

@property (weak, nonatomic) IBOutlet UIImageView *oneImage;
+(instancetype)createViewController;
- (IBAction)LoadAssetOne:(id)sender;
- (IBAction)LoadAssetTwo:(id)sender;
- (IBAction)LoadAudio:(id)sender;
- (IBAction)MergeAndSave:(id)sender;
- (BOOL) startMediaBrowserFromViewController: (UIViewController*) controller
                               usingDelegate: (id <UIImagePickerControllerDelegate,
                                               UINavigationControllerDelegate>) delegate;
- (void)exportDidFinish:(AVAssetExportSession*)session;
@end
