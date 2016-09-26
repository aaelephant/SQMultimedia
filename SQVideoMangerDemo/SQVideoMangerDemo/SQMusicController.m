//
//  SQMusicController.m
//  SQVideoMangerDemo
//
//  Created by qbshen on 16/9/26.
//  Copyright © 2016年 qbshen. All rights reserved.
//

#import "SQMusicController.h"
#import "SQLrcParser.h"
#import <AVFoundation/AVFoundation.h>

#define SECTION_ONE (@"0")

@interface SQMusicController ()
@property (strong,nonatomic) SQLrcParser* lrcContent;

@property (nonatomic,strong) NSTimer *timer;

@property (assign) NSInteger currentRow;

@property (nonatomic,copy) NSArray *songs;
@property (nonatomic,strong) AVAudioPlayer *player;

@property SQTableViewDelegate * delegate;
@property NSMutableDictionary * originDic;
@end

@implementation SQMusicController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.lrcContent=[[SQLrcParser alloc] init];
    [self.lrcContent parseLrc];
    [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(updateTime) userInfo:nil repeats:YES];
    
    [self iniBg];
    [self initTableV];
    [self requestInfo];
    [self initPlayer];
}

-(void)iniBg
{
    UIImage *img=[UIImage imageNamed:@"bg.jpg"];
    
    UIImageView *bgView=[[UIImageView alloc] initWithImage:img];
    //bgView.alpha=0.8;
    self.tableView.backgroundView=bgView;
    [bgView setImage:[self getBlurredImage:img]];
}

-(void)initTableV
{
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.delegate = [SQTableViewDelegate new];
    self.tableView.delegate = self.delegate;
    self.tableView.dataSource = self.delegate;
}

-(void)requestInfo
{
    if (nil == self.originDic) {
        self.originDic = [NSMutableDictionary new];
    }
    self.originDic[SECTION_ONE] = [self getDefaultInfo];
    [self.delegate loadData:self.originDic];
    [self.tableView reloadData];
}

-(SQTableViewSectionInfo*)getDefaultInfo
{
    SQTableViewSectionInfo * sectionInfo = [SQTableViewSectionInfo new];
    sectionInfo.cellDataArray = [NSMutableArray new];
    for (NSString*  cur in self.lrcContent.wordArray) {
        SQLrcCellInfo * cellInfo = [SQLrcCellInfo new];
        cellInfo.cellClassName = @"SQLrcCell";
        cellInfo.cellHeight = 44;
        cellInfo.content = cur;
        [sectionInfo.cellDataArray addObject:cellInfo];
    }
    return sectionInfo;
}

-(SQLrcCellInfo*)gainCellInfoIndex:(NSInteger)index{
    SQTableViewSectionInfo * sectionInfo  = self.originDic[SECTION_ONE];
    return sectionInfo.cellDataArray[index];
}

-(void) initPlayer{
    AVAudioSession *session=[AVAudioSession sharedInstance];
    [session setActive:YES error:nil];
    [session setCategory:AVAudioSessionCategoryPlayback error:nil];
    
    
    [[UIApplication sharedApplication] beginReceivingRemoteControlEvents];
    
    self.player=[[AVAudioPlayer alloc] initWithContentsOfURL:[[NSBundle mainBundle]  URLForResource:@"时间都去哪儿了" withExtension:@"mp3"] error:nil];
    self.player.numberOfLoops=10;
    [self.player prepareToPlay];
    [self.player play];
    
}

-(void) updateTime{
    CGFloat currentTime=self.player.currentTime;
    NSLog(@"%d:%d",(int)currentTime / 60, (int)currentTime % 60);
    for (int i=0; i<self.lrcContent.timerArray.count; i++) {
        NSArray *timeArray=[self.lrcContent.timerArray[i] componentsSeparatedByString:@":"];
        float lrcTime=[timeArray[0] intValue]*60+[timeArray[1] floatValue];
        SQLrcCellInfo * cellInfo = [self gainCellInfoIndex:_currentRow];
        cellInfo.highlight = NO;
        if(currentTime>lrcTime){
            _currentRow=i;
        }else
            break;
    }
    SQLrcCellInfo * cellInfo = [self gainCellInfoIndex:_currentRow];
    cellInfo.highlight = YES;
    [self.tableView reloadData];
    [self.tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:_currentRow inSection:0] atScrollPosition:UITableViewScrollPositionMiddle animated:YES];
}

//实现高斯模糊
-(UIImage *)getBlurredImage:(UIImage *)image{
    CIContext *context = [CIContext contextWithOptions:nil];
    CIImage *ciImage=[CIImage imageWithCGImage:image.CGImage];
    CIFilter *filter=[CIFilter filterWithName:@"CIGaussianBlur"];
    [filter setValue:ciImage forKey:kCIInputImageKey];
    [filter setValue:@5.0f forKey:@"inputRadius"];
    CIImage *result=[filter valueForKey:kCIOutputImageKey];
    CGImageRef ref=[context createCGImage:result fromRect:[result extent]];
    return [UIImage imageWithCGImage:ref];
}

-(void)viewWillDisappear:(BOOL)animated{
    [self.player stop];
    self.player = nil;
}
@end
