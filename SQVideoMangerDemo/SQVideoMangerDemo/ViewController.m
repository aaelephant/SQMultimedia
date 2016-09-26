//
//  ViewController.m
//  SQVideoMangerDemo
//
//  Created by qbshen on 16/9/24.
//  Copyright © 2016年 qbshen. All rights reserved.
//

#import "ViewController.h"
#import "SQPlayController.h"
#import "SQMergeController.h"
#import "SQMusicController.h"

@interface ViewController ()



@property UITableView * tableView;
@property SQTableViewDelegate * delegate;
@property NSMutableDictionary * originDic;

- (IBAction)onClick:(id)sender;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initTableV];
    [self requestInfo];

}

-(void)initTableV
{
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height-64) style:UITableViewStylePlain];
    self.delegate = [SQTableViewDelegate new];
    self.tableView.delegate = self.delegate;
    self.tableView.dataSource = self.delegate;
    [self.view addSubview:self.tableView];
}

-(void)requestInfo
{
    self.originDic = [NSMutableDictionary new];
    self.originDic[@"0"] = [self getDefaultSectionInfo];
    [self.delegate loadData:self.originDic];
    [self.tableView reloadData];
}

-(SQTableViewSectionInfo*)getDefaultSectionInfo
{
    SQTableViewSectionInfo* sectionInfo = [SQTableViewSectionInfo new];
    sectionInfo.cellDataArray = [NSMutableArray new];
    
    SQTableViewCellInfo * cellInfo = [SQTableViewCellInfo new];
    cellInfo.cellHeight = 44;
    cellInfo.cellClassName = @"SQBaseTableViewCell";
    cellInfo.title = @"播放视频";
    cellInfo.gotoNextBlock = ^(SQBaseTableViewInfo * args){
        SQPlayController * vc = [SQPlayController new];
        [self.navigationController pushViewController:vc animated:YES];
    };
    
    [sectionInfo.cellDataArray addObject:cellInfo];
    
    cellInfo = [SQTableViewCellInfo new];
    cellInfo.cellHeight = 44;
    cellInfo.cellClassName = @"SQBaseTableViewCell";
    cellInfo.title = @"播放音乐";
    cellInfo.gotoNextBlock = ^(SQBaseTableViewInfo * args){
        SQMusicController * vc = [SQMusicController new];
        [self.navigationController pushViewController:vc animated:YES];
    };
    [sectionInfo.cellDataArray addObject:cellInfo];
    cellInfo = [SQTableViewCellInfo new];
    cellInfo.cellHeight = 44;
    cellInfo.cellClassName = @"SQBaseTableViewCell";
    cellInfo.title = @"视频合成";
    cellInfo.gotoNextBlock = ^(SQBaseTableViewInfo * args){
        SQMergeController * vc = [SQMergeController createViewController];
        [self.navigationController pushViewController:vc animated:YES];
    };
    
    [sectionInfo.cellDataArray addObject:cellInfo];
    return sectionInfo;
}


- (IBAction)onClick:(id)sender {
//    NSLog(@"%@",[self thumbnailImageAtCurrentTime]);
}
@end
