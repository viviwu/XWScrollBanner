//
//  ViewController.m
//  XWScrollBanner
//
//  Created by vivi wu on 2014/11/4.
//  Copyright © 2018年 vivi wu. All rights reserved.
//

#import "ViewController.h"
#import "XWScrollBanner.h"

@interface ViewController ()
{
    XWScrollBanner * scroll;
}
@property (weak, nonatomic) IBOutlet XWScrollBanner *sBanner;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray * models =@[
    @{
         @"image" : @"https://oss-cn-hangzhou.aliyuncs.com/jfzapp-static2/ad/1049db96aaf99f3f92fc225c006648a6.jpg",
         @"url" : @"https://h5.jinfuzi.com/app/community/communityDetail?articleId=6816",
         @"rank" : @"202"
     },
     @{
         @"image" : @"https://oss-cn-hangzhou.aliyuncs.com/jfzapp-static2/ad/f601d614da6a1a56f30da4fe5fd5e501.jpg",
         @"url" : @"https://h5.jinfuzi.com/topic/pevc/tg-34",
         @"rank" : @"201"
     },
     @{
         @"image" : @"https://oss-cn-hangzhou.aliyuncs.com/jfzapp-static2/ad/e0ffc289900db4adb9060df0cedf056b.jpg",
         @"url" : @"https://h5.jinfuzi.com/vueApp/community/communityDetail/5650",
         @"rank" : @"200"
     },
     @{
         @"image" : @"https://jfz-static2.oss-cn-hangzhou.aliyuncs.com/main/img/92a7d6f5a9d2996342becbaaf6391fde.jpg",
         @"url" : @"https://h5.jinfuzi.com/topic/pof/tg-135",
         @"rank" : @"194"
     },
     @{
         @"image" : @"https://oss-cn-hangzhou.aliyuncs.com/jfzapp-static2/ad/89f6c1a5a9ebf5e15277087502388800.jpg",
         @"url" : @"https://h5.jinfuzi.com/activity/other/tg20",
         @"rank" : @"190"
     },
     @{
         @"image" : @"https://jfz-static2.oss-cn-hangzhou.aliyuncs.com/main/img/96de6f1a5cb64f9f99ace06b8e04bffe.jpg",
         @"url" : @"https://h5.jinfuzi.com/topic/pevc/tg-30",
         @"rank" : @"162"
     }
    ];
    
    NSMutableArray * sources = [NSMutableArray array];
    for (int i=0; i<models.count; i++) {
        NSDictionary * model = models[i];
        XWBannerModel *bannerModel = [[XWBannerModel alloc]init];
        bannerModel.title = model[@"rank"];
        bannerModel.imgURL = [NSURL URLWithString:model[@"image"]];
        bannerModel.link = model[@"url"];
        [sources addObject:bannerModel];
    }
    
//     scroll =[[XWScrollBanner alloc]initWithFrame:CGRectMake(0, 288.0, self.view.frame.size.width, 200.0) dataSource:sources];
//    [self.view addSubview:scroll];
//    scroll.dataSource = sources;
//    scroll.bannerClickHandle = ^(NSInteger currentPage, XWBannerModel * model){
//      NSLog(@"currentPage is: %ld", currentPage);
//    };
    
    _sBanner.dataSource = sources;
    _sBanner.bannerClickHandle = ^(NSInteger currentPage, XWBannerModel * model){
        NSLog(@"currentPage is: %ld", currentPage);
    };
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
//    [scroll startTimer];
    [_sBanner startTimer];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
//    [scroll stopTimer];
    [_sBanner stopTimer];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
