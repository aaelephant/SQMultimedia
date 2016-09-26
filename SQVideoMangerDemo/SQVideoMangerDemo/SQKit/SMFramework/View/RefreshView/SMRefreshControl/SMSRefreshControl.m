//
//  SMSRefreshControl.m
//  DTPocket
//
//  Created by sqb on 15-2-13.
//  Copyright (c) 2015年 sqp. All rights reserved.
//

#import "SMSRefreshControl.h"

@implementation SMSRefreshControl

-(instancetype)init
{
    self = [super init];
    if (self) {
        [self setbeginRefreshing];
    }
    return self;
}

#pragma 开始刷新函数
- (void)setbeginRefreshing
{
    //刷新图形颜色
    self.tintColor = [UIColor grayColor];
    //刷新的标题
    self.attributedTitle = [[NSAttributedString alloc] initWithString:@"下拉刷新"];
    // UIRefreshControl 会触发一个UIControlEventValueChanged事件，通过监听这个事件，我们就可以进行类似数据请求的操作了
//    [self addTarget:self action:@selector(refreshTableviewAction:) forControlEvents:UIControlEventValueChanged];
//    //    [self.tableView addSubview:refresh];
}

-(void)beginRefreshing
{
    
    [self updateRefreshingTitle:@"正在刷新"];
    [super beginRefreshing];
}

-(void)updateRefreshingTitle:(NSString*)title
{
//    if (self.refreshing) {
        self.attributedTitle = [[NSAttributedString alloc]initWithString:title];
//    }

}
-(void)endRefreshing
{
    NSString *syseTiem = nil;
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"]; //创建的时间格式
    syseTiem = [formatter stringFromDate:[NSDate date]];
    
    NSString *lastUpdated = [NSString stringWithFormat:@"上一次更新时间为 %@", [formatter stringFromDate:[NSDate date]]];
    
    self.attributedTitle = [[NSAttributedString alloc] initWithString:lastUpdated] ;
    [self performSelector:@selector(endRe) withObject:nil afterDelay:1];
}

-(void)endRe
{
    if (self.refreshing) {
        self.attributedTitle = [[NSAttributedString alloc]initWithString:@" "];
    }
    [super endRefreshing];
}

@end
