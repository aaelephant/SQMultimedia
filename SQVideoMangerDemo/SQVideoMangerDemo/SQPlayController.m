//
//  SQPlayController.m
//  SQVideoMangerDemo
//
//  Created by qbshen on 16/9/25.
//  Copyright © 2016年 qbshen. All rights reserved.
//

#import "SQPlayController.h"
#import <AVFoundation/AVFoundation.h>

@interface SQPlayController ()
{
    AVPlayer * _player;
    UIImageView * iv;
    AVPlayerItem *item;
}
@end

@implementation SQPlayController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initNavItem];
    [self player];
    iv = [[UIImageView alloc]initWithFrame:CGRectZero];
    [self.view addSubview:iv];
    iv.contentMode = UIViewContentModeScaleAspectFit;
}

-(void)viewWillAppear:(BOOL)animated
{
    [_player play];
}

-(void)initNavItem
{
    UIBarButtonItem * item = [[UIBarButtonItem alloc]initWithTitle:@"视频截屏" style:UIBarButtonItemStylePlain target:self action:@selector(thumbnailImageAtCurrentTime)];
    self.navigationItem.rightBarButtonItem = item;
}

#pragma mark - 懒加载代码
- (AVPlayer *)player
{
    if (_player == nil) {
        // 1.获取URL(远程/本地)
        // NSURL *url = [[NSBundle mainBundle] URLForResource:@"01-知识回顾.mp4" withExtension:nil];
        //        NSURL *url = [NSURL URLWithString:@"http://v1.mukewang.com/a45016f4-08d6-4277-abe6-bcfd5244c201/L.mp4"];
        NSString *urlStr = [[NSBundle mainBundle]pathForResource:@"X-man.mp4" ofType:nil];
        
        NSLog(@"----%@",urlStr);
        
        NSURL *url = [NSURL fileURLWithPath:urlStr];
        
        // 2.创建AVPlayerItem
        item = [AVPlayerItem playerItemWithURL:self.videoUrl? self.videoUrl:url];
        
        // 3.创建AVPlayer
        _player = [AVPlayer playerWithPlayerItem:item];
//        [item addObserver:self forKeyPath:@"status" options:NSKeyValueObservingOptionNew context:nil];
//        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(playbackFinished:) name:AVPlayerItemDidPlayToEndTimeNotification object:item];
        // 4.添加AVPlayerLayer
        AVPlayerLayer *layer = [AVPlayerLayer playerLayerWithPlayer:self.player];
        layer.frame = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height*9/16);
        [self.view.layer addSublayer:layer];
    }
    
    return _player;
}


- (void)thumbnailImageAtCurrentTime
{
    NSString *urlStr = [[NSBundle mainBundle]pathForResource:@"X-man.mp4" ofType:nil];
    
    NSLog(@"----%@",urlStr);
    
    NSURL *url = [NSURL fileURLWithPath:urlStr];
    
    // -------- 实例化AVAssetImageGenerator需要asset --------
    AVAsset *asset = [AVAsset assetWithURL:self.videoUrl? self.videoUrl:url];
    
    AVAssetImageGenerator *imageGenerator = [AVAssetImageGenerator assetImageGeneratorWithAsset:asset]; // 初始化AVAssetImageGenerator
//    NSError *error = nil;
    CMTime time = CMTimeMakeWithSeconds(_player.currentTime.value/_player.currentTime.timescale, 1); // 获取当前的时间戳
    //    CMTime actualTime;
    //    CGImageRef cgImage = [imageGenerator copyCGImageAtTime:time actualTime:&actualTime error:&error]; // 从imageGenerator 取出时间戳
    //    UIImage *image = [UIImage imageWithCGImage:cgImage];
    
    //    NSLog(@"withd: %f  \n height: %f",image.size.width,image.size.height);
    iv.frame = CGRectMake(0, self.view.frame.size.height-300, self.view.frame.size.width, 300);
    //    iv.backgroundColor = [UIColor redColor];
    NSValue *value = [NSValue valueWithCMTime:time];
    [imageGenerator generateCGImagesAsynchronouslyForTimes:@[ value ] completionHandler:^(CMTime requestedTime, CGImageRef  _Nullable image, CMTime actualTime, AVAssetImageGeneratorResult result, NSError * _Nullable error) {
        UIImage *newImage = [UIImage imageWithCGImage:image];
        // 所以我们在更新UI的时候就需要回到主线程
        dispatch_async(dispatch_get_main_queue(), ^{
            iv.image = newImage;
            iv.frame = CGRectMake(0, self.view.frame.size.height-200, self.view.frame.size.width, 200);
        });
    }];
}

//截屏
static int i=0;
-(IBAction)screenShot:(id)sender{
    
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(640, 960), YES, 0);
    [[self.view.window layer] renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *viewImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    CGImageRef imageRef = viewImage.CGImage;
    CGRect rect =CGRectMake(166, 211, 426, 320);//这里可以设置想要截图的区域
    CGImageRef imageRefRect =CGImageCreateWithImageInRect(imageRef, rect);
    UIImage *sendImage = [[UIImage alloc] initWithCGImage:imageRefRect];
    UIImageWriteToSavedPhotosAlbum(sendImage, nil, nil, nil);//保存图片到照片库
    NSData *imageViewData = UIImagePNGRepresentation(sendImage);
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *pictureName= [NSString stringWithFormat:@"screenShow_%d.png",i];
    NSString *savedImagePath = [documentsDirectory stringByAppendingPathComponent:pictureName];
    NSLog(@"%@", savedImagePath);
    [imageViewData writeToFile:savedImagePath atomically:YES];//保存照片到沙盒目录
    CGImageRelease(imageRefRect);
    i++;
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context {
    
    if ([keyPath isEqualToString:@"status"]) {
        switch (self.player.status) {
            case AVPlayerStatusUnknown:
//                BASE_INFO_FUN(@"KVO：未知状态，此时不能播放");
                break;
            case AVPlayerStatusReadyToPlay:
                
//                BASE_INFO_FUN(@"KVO：准备完毕，可以播放");
                break;
            case AVPlayerStatusFailed:
//                BASE_INFO_FUN(@"KVO：加载失败，网络或者服务器出现问题");
                break;
            default:
                break;
        }
    }
}

- (void)playbackFinished:(NSNotification *)notice {
//    [[NSNotificationCenter defaultCenter] removeObserver:item];
//    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)viewWillDisappear:(BOOL)animated
{
//    [[NSNotificationCenter defaultCenter] removeObserver:self];
//    [[NSNotificationCenter defaultCenter] removeObserver:item];
    [_player pause];
    _player = nil;
}
@end
